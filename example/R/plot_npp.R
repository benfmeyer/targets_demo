
plot_npp <- function(npp_only_for_interesting_region) {

  ggplot(npp_only_for_interesting_region, aes(Year, mean_npp))+
    geom_line()

}
