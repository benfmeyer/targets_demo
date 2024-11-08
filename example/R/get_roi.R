#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param shp_bav
#' @param roi
#' @return
#' @author ben
#' @export
get_roi <- function(shp_bav, roi) {

  shp_roi <- shp_bav %>% 
    dplyr::filter(BEZ_RBZ %in% roi[[1]]) %>% 
    dplyr::select(c(BEZ_RBZ, LAND, geometry)) %>% 
    st_transform(4326)
  
  return(list(shp_roi))

}
