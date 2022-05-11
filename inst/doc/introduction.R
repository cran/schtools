## ---- include = FALSE---------------------------------------------------------
schtools::set_knitr_opts()
knitr::opts_chunk$set(
  collapse = TRUE,
  echo = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(schtools)

## ----read_tax-----------------------------------------------------------------
tax_filepath <- system.file("extdata", "test.taxonomy", package = "schtools")
tax_dat <- read_tax(tax_filepath)
head(tax_dat)

## -----------------------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(ggtext)
library(tidyr)
set.seed(20220427)
pick_random_bool <- function(n = nrow(tax_dat)) {
        sample(c(TRUE, FALSE), n, replace = TRUE)
    }
tax_dat %>% 
    select(label_html) %>% 
    mutate(sample1 = pick_random_bool(),
           sample2 = pick_random_bool(),
           sample3 = pick_random_bool() 
           ) %>% 
    pivot_longer(starts_with('sample'), 
                 names_to = 'sample', values_to = 'presence') %>% 
    ggplot(aes(x = sample, y = label_html, fill = presence)) +
    geom_tile() +
    scale_fill_manual(values = c(`TRUE` = "#08519C", `FALSE` = "#F0F0F0")) +
    scale_x_discrete(position = "top") +
    theme_classic() +
    theme(axis.text.y = element_markdown(),
          axis.title.y = element_blank(),
          axis.title.x = element_blank())

## ----read_dist----------------------------------------------------------------
dist_filepath <- system.file("extdata",
                             "sample.final.thetayc.0.03.lt.ave.dist",
                             package = "schtools")
dist_tbl <- read_dist(dist_filepath)
head(dist_tbl)

## ----oxford-------------------------------------------------------------------
animals <- c('cats', 'dogs', 'fish')

