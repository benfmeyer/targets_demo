get_roi <- function(shp_bav, roi) {
  
  shp_roi <- shp_bav %>% 
    dplyr::filter(BEZ_RBZ %in% roi) %>% 
    dplyr::select(c(BEZ_RBZ, LAND, geometry)) %>% 
    st_transform(4326)
  
  return(shp_roi)
  
}