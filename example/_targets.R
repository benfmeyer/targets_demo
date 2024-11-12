library(targets)

tar_option_set(
  packages = c("sf", "tidyverse"), # packages that your targets need to run
  format = "rds"
)


lapply(list.files("example/R", full.names = TRUE, recursive = TRUE), source)

list(
  
  tar_target(
    raw_npp_path,
    "example/data/vanilla_05_05_2021/anpp.out",
    format = "file" ## pipeline will run again if file changes
  ),
  
  tar_target(
    raw_npp,
    read_table(raw_npp_path)
  ),
  
  tar_target(
    shape_file_path,
    "example/shp/Verwaltungsgebiete_shp_epsg25832/regbez_ex.shp",
    format = "file"
  ),
  
  tar_target(
    shape_file,
    read_sf(shape_file_path)
  ),
  
  tar_target(
    regions_of_interest,
    list(c("Unterfranken", "Oberfranken", "Mittelfranken"),
         c("Oberbayern", "Niederbayern"))
  ),
  
  tar_target(
    data_only_for_interesting_regions,
    get_roi(shape_file, roi = regions_of_interest[[1]]) 
  ), ## to simplify this example we just use the first list entry
  
  tar_target(
    npp_only_for_interesting_region,
    crop_npp(raw_npp, data_only_for_interesting_regions)
  ),
  
  tar_target(
    npp_plot,
    plot_npp(npp_only_for_interesting_region)
  )
  

  
)



