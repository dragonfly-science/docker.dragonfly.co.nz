old <- getOption("defaultPackages"); 
r <- getOption("repos")
r["CRAN"] <- "http://cran.stat.auckland.ac.nz"
options(defaultPackages = c(old, "MASS"), repos = r)

packages <- c(
    "shapefiles", "foreign", "sp", "grid", "lattice", "rgeos", "RColorBrewer",
    "maptools", "RPostgreSQL", "knitr", "rjson", "pander", "ggplot2", "dplyr",
    "tables", "data.table", "tidyr", "gridExtra", "rjags","R2jags","reshape2","mapproj",
    "cplm","lme4", "rgdal", "gridSVG"
)


update.packages(ask=F)
pkgs2install <- setdiff(packages, library()$results[, 'Package'])
install.packages(pkgs2install)
