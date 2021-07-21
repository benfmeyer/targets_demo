#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param npp_franconia
#' @return
#' @author ben
#' @export
summarize_npp <- function(npp_franconia) {

  npp_county <- npp_franconia %>% 
    mutate(lon = st_coordinates(.)[,1],
           lat = st_coordinates(.)[,2]) %>% 
    as_tibble() %>% 
    dplyr::select(-geometry) %>% 
    group_by(BEZ_RBZ) %>% 
    summarize(across(.cols = 1:3, .fns = \(x) median(x, na.rm = T)))

}
