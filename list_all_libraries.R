# A script to list all the packages used in this project
# and install them as needed

library(stringr)
library(pacman)

# all the Rmarkdown files in the project
rmd.files <- list.files(pattern='*.Rmd$', recursive=T)
list.of.calls = list()
i = 1
for (f.name in rmd.files) {
  file.input = readLines(f.name)
  lines <- grep('library', file.input)
  for (l in lines) {
    list.of.calls[[i]] <- as.character(file.input[[l]])
    i <- i+1
    }
}

# set of unique lines of type "library(xyz)"
list.of.calls <- unique(unlist(list.of.calls))

# update what's already installed
pacman::p_update()

list.of.packages = list()
i <- 1
for (l in list.of.calls) {
  print(paste('working on ', l))
  package = str_match(l, "library\\((.*?)\\)")[2]
  if(!is.na(package)) {
    pacman::p_install(package)
    list.of.packages[i] <- package
    i <- i+1
  }
}

lapply(list.of.packages, write, "requirements.txt",
       append=TRUE)


