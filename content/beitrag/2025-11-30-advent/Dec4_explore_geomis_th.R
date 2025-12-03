library(httr)
library(xml2)
library(dplyr)
library(purrr)
library(stringr)

csw_url   <- "https://geomis.geoportal-th.de/geonetwork/srv/ger/csw"
page_size <- 100L

`%||%` <- function(x, y) if (is.null(x) || length(x) == 0) y else x

# --- 1. korrekt escaptes XML-Template ---------------------------------------

csw_getrecords_body <- function(start_position = 1L, max_records = page_size) {
  sprintf(
    '<?xml version="1.0" encoding="UTF-8"?>
<csw:GetRecords service="CSW"
                version="2.0.2"
                resultType="results"
                startPosition="%d"
                maxRecords="%d"
                outputSchema="http://www.isotc211.org/2005/gmd"
                xmlns:csw="http://www.opengis.net/cat/csw/2.0.2"
                xmlns:ogc="http://www.opengis.net/ogc">
  <csw:Query typeNames="gmd:MD_Metadata"
             xmlns:gmd="http://www.isotc211.org/2005/gmd">
    <csw:ElementSetName>full</csw:ElementSetName>
    <csw:Constraint version="1.1.0">
      <ogc:Filter>
        <ogc:PropertyIsLike wildCard="%%%%" singleChar="_" escapeChar="\\">
          <ogc:PropertyName>csw:AnyText</ogc:PropertyName>
          <ogc:Literal>%%%%opendata%%%%</ogc:Literal>
        </ogc:PropertyIsLike>
      </ogc:Filter>
    </csw:Constraint>
  </csw:Query>
</csw:GetRecords>',
    start_position, max_records
  )
}

# --- 2. Seite holen ----------------------------------------------------------

fetch_csw_page <- function(start_position = 1L, max_records = page_size) {
  body_xml <- csw_getrecords_body(start_position, max_records)
  
  resp <- POST(
    csw_url,
    body   = body_xml,
    encode = "raw",
    add_headers("Content-Type" = "text/xml", "Accept" = "application/xml")
  )
  stop_for_status(resp)
  
  doc <- read_xml(content(resp, as = "raw"))
  ns  <- xml_ns(doc)
  
  sr  <- xml_find_first(doc, "//csw:SearchResults", ns = ns)
  matched  <- as.integer(xml_attr(sr, "numberOfRecordsMatched")     %||% NA)
  returned <- as.integer(xml_attr(sr, "numberOfRecordsReturned")    %||% NA)
  next_rec <- as.integer(xml_attr(sr, "nextRecord")                 %||% NA)
  
  rec_nodes <- xml_find_all(doc, ".//gmd:MD_Metadata", ns = ns)
  
  list(records = rec_nodes, ns = ns,
       matched = matched, returned = returned, next_rec = next_rec)
}

# --- 3. Metadata extrahieren -------------------------------------------------

extract_md <- function(node, ns) {
  txt <- function(xpath) xml_text(xml_find_first(node, xpath, ns = ns)) %||% NA
  
  title <- txt(".//gmd:identificationInfo//gmd:citation//gmd:title//gco:CharacterString")
  scope <- xml_attr(
    xml_find_first(node, ".//gmd:hierarchyLevel/gmd:MD_ScopeCode", ns = ns),
    "codeListValue"
  ) %||% NA
  
  keywords <- xml_text(xml_find_all(node,
                                    ".//gmd:identificationInfo//gmd:keyword//gco:CharacterString", ns = ns))
  keywords <- if (length(keywords)) paste(keywords, collapse = "; ") else NA
  
  formats <- xml_text(xml_find_all(node,
                                   ".//gmd:distributionInfo//gmd:distributionFormat//gmd:name//gco:CharacterString",
                                   ns = ns))
  formats <- if (length(formats)) paste(formats, collapse = "; ") else NA
  
  protos <- xml_text(xml_find_all(node,
                                  ".//gmd:distributionInfo//gmd:onLine//gmd:protocol//gco:CharacterString", ns = ns))
  links  <- xml_text(xml_find_all(node,
                                  ".//gmd:distributionInfo//gmd:onLine//gmd:linkage//gco:CharacterString", ns = ns))
  
  proto_links <- if (length(protos) || length(links)) {
    paste(paste0(protos %||% "", " ", links %||% ""), collapse = "; ")
  } else NA
  
  tibble(
    title    = title,
    scope    = scope,
    keywords = keywords,
    format   = formats,
    links    = proto_links
  )
}

# --- 4. Pagination -----------------------------------------------------------

all <- list()
start <- 1L
matched_total <- NA

repeat {
  cat("CSW: startPosition =", start, "...\n")
  
  pg <- fetch_csw_page(start)
  if (is.na(matched_total)) matched_total <- pg$matched
  
  if (length(pg$records) == 0) break
  
  all <- append(all, list(map_dfr(pg$records, extract_md, ns = pg$ns)))
  
  if (is.na(pg$next_rec) || pg$next_rec == 0) break
  
  start <- pg$next_rec
}

meta <- bind_rows(all)

cat("Total laut CSW:", matched_total, "\n")
cat("Eingelesen:", nrow(meta), "\n")

# --- 5. nur Datensätze -------------------------------------------------------

meta_ds <- meta |> filter(tolower(scope) == "dataset")

# --- 6. Verfeinerte Raster/Vektor-Klassifikation ----------------------------

meta_ds <- meta_ds %>%
  mutate(
    # vorbereitete Strings
    txt_format = tolower(format %||% ""),
    txt_links  = tolower(links  %||% ""),
    txt_kw     = tolower(keywords %||% ""),
    
    # --- 6.1 harte Datei-Indikatoren ----------------------------------------
    # Raster-Dateien: GeoTIFF, TIFF, TIF, Raster/Grid
    is_raster_file =
      str_detect(txt_format,
                 "(geotiff|geo\\.tiff|image/tiff|image/geotiff|\\.tif\\b|\\.tiff\\b|grid|raster)") |
      str_detect(txt_links,
                 "(geotiff|geo\\.tiff|\\.tif\\b|\\.tiff\\b|grid|raster)"),
    
    # Vektor-Dateien: Shapefile, GeoJSON, GPKG, GML, DXF, CSV, FGDB, PostGIS
    is_vector_file =
      str_detect(txt_format,
                 "(shapefile|shape|geojson|gpkg|geopackage|filegdb|fgdb|gml|dxf|sqlite|postgis|csv)") |
      str_detect(txt_links,
                 "(\\.shp\\b|geojson|gpkg|geopackage|gml|dxf|sqlite|postgis|csv)"),
    
    # --- 6.2 Dienst-Indikatoren ---------------------------------------------
    has_wms = str_detect(txt_links, "service=wms|\\bwms\\b"),
    has_wfs = str_detect(txt_links, "service=wfs|\\bwfs\\b"),
    
    # --- 6.3 Entscheidungsbaum ----------------------------------------------
    geom_type_refined = case_when(
      # A) klare Dateiindikatoren
      is_raster_file & !is_vector_file ~ "raster (Datei)",
      is_vector_file & !is_raster_file ~ "vektor (Datei)",
      is_raster_file & is_vector_file  ~ "gemischt (Dateien)",
      
      # B) keine Dateien, aber Dienste
      !is_raster_file & !is_vector_file & has_wms & !has_wfs ~ "raster (nur WMS)",
      !is_raster_file & !is_vector_file & has_wfs & !has_wms ~ "vektor (nur WFS)",
      !is_raster_file & !is_vector_file & has_wms & has_wfs  ~ "gemischt (nur Dienste)",
      
      # C) sonstiges / nicht eindeutig
      TRUE ~ "unklar"
    )
  )

meta_ds %>% 
  count(geom_type_refined, sort = TRUE)
