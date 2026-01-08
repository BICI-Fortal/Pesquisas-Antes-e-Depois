rm(list = ls())

library(LDA)

wd()

dirs <- list.dirs(path = '..')

dirs <- dirs[str_detect(dirs,'Pesquisas-Antes-e-Depois',T)]

dirs

dirs[3] %>% list.files(recursive = F,
                       full.names = T,
                       pattern = '.gsheet') %>% 
  normalizePath() %>% 
  paste0('type "',.,':user.drive.id"') %>% 
  shell()

