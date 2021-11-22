## ---- include = FALSE---------------------------------------------------------
schtools::set_knitr_opts()
knitr::opts_chunk$set(
  collapse = TRUE,
  echo = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(schtools)

## ----read_dist----------------------------------------------------------------
dist_filepath <- system.file("extdata",
                             "sample.final.thetayc.0.03.lt.ave.dist",
                             package = "schtools")
dist_tbl <- read_dist(dist_filepath)
head(dist_tbl)

## ----oxford-------------------------------------------------------------------
animals <- c('cats', 'dogs', 'fish')

