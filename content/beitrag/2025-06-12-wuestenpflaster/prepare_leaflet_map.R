setwd("content/beitrag/2025-06-12-wuestenpflaster")
library("terra")
library("leaflet")
library("geodata")
library("osmextract")


download_dir <- "data"  # or any writable directory
namibia_pbf <- oe_get("Namibia", 
                      provider = "geofabrik", 
                      download_directory = download_dir,
                      force_download = FALSE)  # TRUE to re-download
namibia_file <- "data/geofabrik_namibia-latest.osm.pbf"


library(geodata)
library(sf)

namibia_file <- "data/namibia.rds"
if (file.exists(namibia_file)) {
  namibia_outline <- readRDS(namibia_file)
} else {
  # Load GADM level 0 boundary for Namibia
  namibia_outline <- geodata::gadm("Namibia", level = 0, path = tempdir())

  # Transform to EPSG:4326 for leaflet
  namibia_outline <- st_as_sf(namibia_outline)  # convert to sf
  namibia_outline <- st_transform(namibia_outline, 4326)
  saveRDS(namibia_outline, file = namibia_file)
}


dppi_file <- "data/dppi.rds"
if (file.exists(dppi_file)) {
  ras_masked <- readRDS(dppi_file)
} else {
  ras <- terra::rast("data/dpindex_mod.tif")
  ras_crop <- crop(ras, namibia_outline)
  ras_masked <- mask(ras_crop, namibia_outline)
  saveRDS(ras_masked, dppi_file)
}

plot(ras_masked)




library(terra)

# Use SRTM data or your own DEM
dem_file <- "data/dem.rds"
if (file.exists(dem_file)) {
  dem_crop <- readRDS(dem_file)
} else {
  dem <- geodata::elevation_30s(country = "Namibia", path = tempdir())  # 1 km res
  dem <- project(dem, crs(ras_masked))  # ensure same CRS
  dem_crop <- crop(dem, ras_masked)
  saveRDS(dem_crop, file = dem_file)
}

hill_file <- "data/hillshade.rds"
if (file.exists(hill_file)) {
  hill <- readRDS(hill_file)
} else {
  # Compute slope and aspect in radians
  slope  <- terrain(dem_crop, v = "slope", unit = "radians")
  aspect <- terrain(dem_crop, v = "aspect", unit = "radians")
  
  # Create hillshade (default: sun azimuth 315°, altitude 45°)
  hill <- shade(slope, aspect, angle = 45, direction = 315)
  saveRDS(hill, file = hill_file)
}

# Project hillshade to Web Mercator
hill_web <- project(hill, "EPSG:3857")

# install.packages("osmdata")
library(osmdata)
library(sf)

# Bounding box of raster
bbox <- st_as_sfc(st_bbox(ras_masked))
bbox <- st_transform(bbox, 4326)  # OSM requires EPSG:4326

# Get roads (highways)
roads_file <- "data/roads.rds"
if (file.exists(roads_file)) {
  roads <- readRDS(roads_file)
} else {
  roads <- opq(bbox = bbox, timeout = 120) %>%
    add_osm_feature(key = "highway",
                    value = c("primary", "secondary", "tertiary")) %>%
    osmdata_sf() %>%
    purrr::pluck("osm_lines")
  roads <- st_intersection(roads, namibia_outline)
  saveRDS(roads, file = roads_file)
}

railways_file <- "data/railways.rds"
if (file.exists(railways_file)) {
  railways <- readRDS(railways_file)
} else {
  railways <- opq(bbox = bbox, timeout = 120) %>%
    add_osm_feature(key = "railway", 
                    value = c("rail", "light_rail", "subway")) %>%
    osmdata_sf() %>%
    purrr::pluck("osm_lines")
  railways <- st_intersection(railways, namibia_outline)
  saveRDS(railways, file = railways_file)
}

rivers_file <- "data/rivers.rds"
if (file.exists(rivers_file)) {
  rivers <- readRDS(rivers_file)
} else {
  # Read only 'lines' layer from OSM extract
  rivers <- oe_read(
    file = namibia_file,
    layer = "lines",
    vectortranslate_options = c("-where", "waterway IN ('river')")
  )
  rivers <- st_transform(rivers, crs(ras_masked))
  rivers <- st_intersection(rivers, namibia_outline)
  saveRDS(rivers, file = rivers_file)
}

roads_web    <- st_transform(roads, 3857)
railways_web <- st_transform(railways, 3857)
rivers_web   <- st_transform(rivers, 3857)

# Download towns, cities, optionally villages
places_file <- "data/places.rds"
if (file.exists(places_file)) {
  places <- readRDS(places_file)
} else {
  places <- opq(bbox = bbox, timeout = 60) %>%
    add_osm_feature(key = "place", value = c("city", "town")) %>%
    osmdata_sf() %>%
    purrr::pluck("osm_points")
  places <- st_intersection(places, namibia_outline)
  saveRDS(places, file = places_file)
}

# Filter: keep only features with names
places <- places[!is.na(places$name), ]

# Optional: prioritize important settlements (e.g., capitals)
places <- places[is.na(places$capital) | places$capital %in% c("yes", "admin"), ]

# Reproject to Web Mercator
places_web <- st_transform(places, 3857)


library(leaflet)
# install.packages("rnaturalearth")
# install.packages("rnaturalearthdata")  # needed for physical layers
library(rnaturalearth)
library(sf)

borders_file <- "data/borders.rds"
if (file.exists(borders_file)) {
  borders <- readRDS(borders_file)
} else {
  borders <- ne_download(scale = 110, type = "admin_0_boundary_lines_land", category = "cultural", returnclass = "sf")
  saveRDS(borders, file = borders_file)
}

coastlines_file <- "data/coastlines.rds"
if (file.exists(coastlines_file)) {
  coastlines <- readRDS(coastlines_file)
} else {
  # Coastlines
  coastlines <- ne_download(scale = 110, type = "coastline", category = "physical", returnclass = "sf")
  saveRDS(coastlines, file = coastlines_file)
}




# Set DPPI < 0.70 to NA
dppi_filtered <- classify(ras_masked, cbind(-Inf, 0.7, NA))

# Reproject for leaflet
dppi_web <- project(dppi_filtered, "EPSG:3857")

# Define a color palette
pal <- colorNumeric("YlOrRd", domain = c(0.7, 1.0), na.color = "transparent")

# Get bounding box
zoom_bbox <- st_bbox(namibia_outline)

m <- leaflet() %>%
  addRasterImage(hill, colors = gray.colors(256), opacity = 0.7, project = FALSE, group = "Hillshade") %>%
  addRasterImage(dppi_filtered, colors = pal, opacity = 0.6, project = FALSE, group = "DPPI") %>%
  addProviderTiles("CartoDB.PositronOnlyLabels", group = "Labels") %>%
  addPolylines(data = roads,    color = "black",    weight = 1, group = "Roads & Rail") %>%
  addPolylines(data = railways, color = "darkred",  weight = 1, dashArray = "3", group = "Roads & Rail") %>%
  addPolylines(data = rivers,   color = "blue",     weight = 1, group = "Rivers") %>%
  addPolylines(data = coastlines, color = "black", weight = 1, group = "Coastlines") %>%
  addPolylines(data = borders, color = "gray30", weight = 1, dashArray = "4", group = "Country Borders") %>%
  addPolygons(data = namibia_outline, fill = FALSE, color = "black", weight = 2, group = "Namibia Border") %>%
  addCircleMarkers(data = places, radius = 2, color = "black",
                   label = ~name, labelOptions = labelOptions(textsize = "12px"),
                   group = "Towns") %>%
  # addControl("Waiting for your location...", position = "topright") %>%
  htmlwidgets::onRender("
    function(el, x) {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var lat = position.coords.latitude;
          var lon = position.coords.longitude;
          var map = this;
          var leafletMap = HTMLWidgets.find('.leaflet').getMap();
          // leafletMap.setView([lat, lon], 10);
          L.marker([lat, lon]).addTo(leafletMap)
            .bindPopup('You are here').openPopup();
        });
      } else {
        alert('Geolocation is not supported by this browser.');
      }
    }
  ") %>%
  addLegend(pal = pal, values = values(dppi_filtered, na.rm = TRUE),
            title = "DPPI", position = "bottomright") %>%
  addLayersControl(
    overlayGroups = c("DPPI", "Hillshade", "Roads & Rail", "Rivers", "Towns"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  fitBounds(lng1 = zoom_bbox["xmin"], lat1 = zoom_bbox["ymin"],
            lng2 = zoom_bbox["xmax"], lat2 = zoom_bbox["ymax"]) %>%
  setView(lng = 18.0, lat = -22.5, zoom = 6)

m

library(htmlwidgets)
# Save to a self-contained HTML file
saveWidget(m, file = "dppimap.html", selfcontained = TRUE)




###############################



# Set DPPI < 0.70 to NA
dppi_filtered <- classify(ras_masked, cbind(-Inf, 0.7, NA))

# Reproject for leaflet
dppi_web <- project(dppi_filtered, "EPSG:3857")

# Define a color palette
pal <- colorNumeric("YlOrRd", domain = c(0.7, 1.0), na.color = "transparent")

# Leaflet map with semi-transparent overlay
leaflet() %>%
  addProviderTiles("CartoDB.Positron", group = "Positron") %>%
  addProviderTiles("OpenTopoMap", group = "Topo") %>%
  addProviderTiles("Esri.WorldImagery", group = "Imagery") %>%
  addProviderTiles("Esri.WorldShadedRelief", group = "Relief") %>%
  addRasterImage(dppi_web, colors = pal, opacity = 0.1, project = FALSE, group = "DPPI") %>%
  addLegend(pal = pal, values = values(dppi_filtered, na.rm = TRUE),
            title = "DPPI", position = "bottomright") %>%
  addLayersControl(
    baseGroups = c("Positron", "Topo", "Imagery", "Relief"),
    overlayGroups = c("DPPI"),
    options = layersControlOptions(collapsed = FALSE)
  )


leaflet() %>%
  # 1. DPPI at full opacity
  addRasterImage(dppi_web, colors = pal, opacity = 0.3, group = "DPPI", project = FALSE) %>%
  
  # 2. Semi-transparent hillshade (e.g. relief)
  addProviderTiles("Esri.WorldShadedRelief", group = "Relief", options = providerTileOptions(opacity = 0.3)) %>%
  
  # 3. Vector-style overlay (Positron) for roads, towns
  addProviderTiles("CartoDB.PositronOnlyLabels", group = "Labels") %>%
  
  # Legend and controls
  addLegend(pal = pal, values = values(dppi_filtered, na.rm = TRUE),
            title = "DPPI", position = "bottomright") %>%
  addLayersControl(
    overlayGroups = c("DPPI", "Relief", "Labels"),
    options = layersControlOptions(collapsed = FALSE)
  )


