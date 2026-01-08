rm(list = ls())

library(LDA)

wd()

config_gargle_drive()

dirs <- list.dirs(path = '..')

dirs <- dirs[str_detect(dirs,'Pesquisas-Antes-e-Depois',T)]

lapply(dirs, function(x){
  files <- x %>% list.files(recursive = F,
                            full.names = T,
                            pattern = '.gsheet')
  
  if(length(files)>0){
    id <- normalizePath(files) %>% 
      paste0('type "',.,':user.drive.id"') %>% 
      shell(intern = T)
    
    if(!dir.exists(str_remove(x,'\\.\\.\\/'))){
      dir.create(str_remove(x,'\\.\\.\\/'),recursive = T)
    }
    
    f <- str_remove(files,'\\.\\.\\/') %>% 
      str_replace('.gsheet','.xlsx')
    if(!file.exists(f)){
      drive_download(
        file = as_id(id),
        path = f
      )
    }
    
  }
  
})






