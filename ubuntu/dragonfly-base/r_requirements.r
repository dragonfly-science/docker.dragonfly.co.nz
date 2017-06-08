old <- getOption("defaultPackages"); r <- getOption("repos")
r["CRAN"] <- "http://cran.stat.auckland.ac.nz"
options(defaultPackages = c(old, "MASS"), repos = r)

packages <- c(
    "shapefiles", "foreign", "sp", "grid", "lattice", "rgeos", "RColorBrewer",
    "maptools", "RPostgreSQL", "knitr", "rjson", "pander", "ggplot2", "dplyr",
    "tables", "data.table", "tidyr", "gridExtra", "rjags", "R2jags", "reshape2", 
    "mapproj", "cplm", "lme4", 'xtable', 'plyr', 'lubridate', 'scales', 'rgdal', 
    'ggmap', 'Cairo', 'maps', 'Matching', 'BenfordTests', 'genoud', 'tools', 
    'utils', 'rgenoud', 'broom','purrr'
)

update.packages(ask=F)

pkgs2install <- setdiff(packages, library()$results[, 'Package'])
install.packages(pkgs2install)

# INLA has its own repo...
if (!require("INLA", character.only=TRUE)) {
        install.packages("INLA", repos="http://www.math.ntnu.no/inla/R/testing")
}
