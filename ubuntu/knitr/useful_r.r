deps <- c('RPostgreSQL', 'ggplot2', 'dplyr', 'plyr', 'knitr', 'xtable')
inst_deps <- sapply(deps, function(o) {
    if(!require(o, character.only=T)) {
        install.packages(o, repos='http://cran.stat.auckland.ac.nz/')
    }
})