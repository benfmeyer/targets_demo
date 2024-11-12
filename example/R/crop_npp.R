crop_npp <- function(npp_raw, shp_file) {
  
  npp_sf <- npp_raw %>% 
    as_tibble() %>% 
    st_as_sf(coords = c("Lon", "Lat"), crs = 4326)
  
  npp_cropped <- st_join(npp_sf, shp_file, left = F) |> 
    group_by(Year) |> 
    summarize(mean_npp = mean(Fag_syl)) 
  
  return(npp_cropped)
  
}