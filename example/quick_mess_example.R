library(tidyverse)
library(sf)

## functions we will need
get_roi <- function(shp_bav, roi) {
  
  shp_roi <- shp_bav %>% 
    dplyr::filter(BEZ_RBZ %in% roi) %>% 
    dplyr::select(c(BEZ_RBZ, LAND, geometry)) %>% 
    st_transform(4326)
  
  return(shp_roi)
  
}

crop_npp <- function(npp_raw, shp_file) {
  
  npp_sf <- npp_raw %>% 
    as_tibble() %>% 
    st_as_sf(coords = c("Lon", "Lat"), crs = 4326)
  
  npp_file <- st_join(npp_sf, shp_file, left = F)
  
}


## read data
npp_raw <- read_table("example/data/vanilla_05_05_2021/anpp.out")
shape_file <- read_sf("example/shp/Verwaltungsgebiete_shp_epsg25832/regbez_ex.shp")

## define some regions we are interested in
regions_of_interest <-list(c("Unterfranken", "Oberfranken", "Mittelfranken"),
     c("Oberbayern", "Niederbayern"))

## subset raw data only to those regions

data_only_for_interesting_regions <- get_roi(shape_file, roi = regions_of_interest[[1]])


npp_only_for_interesting_region <- crop_npp(npp_raw, data_only_for_interesting_regions) |> 
  group_by(Year) |> 
  summarize(mean_npp = mean(Fag_syl)) 


ggplot(npp_only_for_interesting_region, aes(Year, mean_npp))+
  geom_line()
