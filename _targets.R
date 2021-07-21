library(targets)
library(tarchetypes)
lapply(list.files("./R", pattern = "\\.R$", full.names = TRUE), source)

tar_option_set(packages = c("tidyverse", "sf", "ggthemes"))

list(
    
   tar_target(
       npp_raw,
       read_table("data/vanilla_05_05_2021/anpp.out")
    ),

   ##  source for the shapefile https://www.ldbv.bayern.de/produkte/weitere/opendata.html 
   tar_target(
       shp_bav,
       read_sf("shp/Verwaltungsgebiete_shp_epsg25832/regbez_ex.shp")
    ),
    
   tar_target(
       regions_of_interest,
       list(c("Unterfranken", "Oberfranken", "Mittelfranken"),
            c("Oberbayern", "Niederbayern"))
    ),

   
   tar_target(
       shp_franconia,
       get_roi(shp_bav, 
               roi = regions_of_interest
       ),
       pattern = map(regions_of_interest)
   ),
   
   tar_target(
       npp_franconia,
       crop_npp(npp_raw, shp_franconia)
   ),
   
   tar_target(
       npp_by_county,
       summarize_npp(npp_franconia)
   ),
   
   tar_target(
       npp_plot,
       make_npp_plot(npp_by_county)
   ),
   
   tar_render(
       npp_report,
       "doc/npp_report.Rmd"
   )
   
)
