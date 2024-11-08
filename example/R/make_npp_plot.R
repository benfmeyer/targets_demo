#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param npp_by_county
#' @return
#' @author ben
#' @export
make_npp_plot <- function(npp_by_county) {

  ggplot(npp_by_county, aes(Year, Fag_syl, color = BEZ_RBZ))+
    geom_line()+
    scale_color_fivethirtyeight()

}
