

library(plyr) 
 options(stringsAsFactors = FALSE)
  
  
  
  requires <- c("gmailr", "dplyr", "ggplot2", "gdata", "magrittr","googlesheets4","googledrive","devtools","stringi","stringr", "tidyverse",
                "pdftools", "here", "rvest","maps", "ineq", "mapproj", "dotwhisker", "crayon")
  to_install <- c(requires %in% rownames(installed.packages()) == FALSE)
  install.packages(c(requires[to_install], "NA"), repos = "https://cloud.r-project.org/" )
  
  library(devtools)
  if(!"fiftystater" %in% rownames(installed.packages())) {
    devtools::install_github("wmurphyrd/fiftystater")
  }
  
  
  library(stargazer)
  library(tidyverse)
  library(dplyr) # in case tydyverse fails (problem on linux)
  library(ggplot2); theme_set(theme_bw())
  options(
    ggplot2.continuous.color = "viridis",
    ggplot2.continuous.fill = "viridis"
  )
  scale_color_discrete <- function(...)
    scale_color_viridis_d(...)
  scale_fill_discrete <- function(...)
    scale_fill_viridis_d(...)
  library(magrittr)
  library(googlesheets)
  # modified gs_read function to assume char typ
  gs_read_chr <- function(title){
    data <- gs_read(title, 
                    FROM = col_character(), 
                    DATE = col_character(),
                    SUBJECT = col_character(), 
                    TYPE = col_character(),
                    POLICY_EVENT = col_character(),
                    NOTES = col_character(),
                    ERROR = col_character())
  }
  library(googledrive)
  library(gmailr)
  library(stringi)
  # library(pdftools)
  library(here)
  library(rvest)
  library(tidyr)
  library(ineq)
  # library(stargazer)
  library(maps)
  library(fiftystater)
  library(mapproj)
  library(knitr)
  library(broom)
  library(dotwhisker)
  library(crayon)
  library(knitr)
  library(kableExtra)
  library(tidytext)
  library(topicmodels)
  library(textfeatures)
  library(cleanNLP)
  library(textdata)
  library(broom)
  library(gtsummary)
  library(MASS)

  
  
 
  
  knitr::opts_chunk$set(echo = TRUE, # echo = TRUE means that your code will show
                        warning = FALSE,
                        message = FALSE,
                        fig.align = "center", 
                        fig.path= 'Figs/', ## where to save figures
                        fig.height = 3,
                        fig.width = 3)


  
  