This repository contains slides about the use of workflow management systems like targets and snakemake. Additionally, it includes a demonstration of how to implement a simple targets workflow. 
To see how this works either clone the repo or download as a zip folder to your computer. 

The example workflow is located in the "example" folder. "quick_mess_example.R" contains a script-based workflow. "_targets.R" contains the corresponding targets workflow. The functions needed for the targets pipeline are contained in "R/".
All data needed to run this workflow is included in the repo. 

To run the targets pipeline simply open the top level directory "targets_demo" in your favorite IDE (RStudio, VSCode, DataSpell, etc.). Then execute `tar_make(script = "example/_targets.R")` in the R console. 
Once the pipeline has run you can access individual targets using `tar_load(target_name)`. 
