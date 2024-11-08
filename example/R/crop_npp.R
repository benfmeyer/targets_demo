#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param npp_raw
#' @param shp_franconia
#' @return
#' @author ben
#' @export
crop_npp <- function(npp_raw, shp_franconia) {

  npp_sf <- npp_raw %>% 
    as_tibble() %>% 
    st_as_sf(coords = c("Lon", "Lat"), crs = 4326)
  
  npp_franconia <- st_join(npp_sf, shp_franconia, left = F)
  
}
