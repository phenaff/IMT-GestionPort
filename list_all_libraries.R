library(stringr)
rmd.files <- list.files(pattern='*.Rmd$', recursive=T)
list.of.libs = list()
i = 1
for (f.name in rmd.files) {
  file.input = readLines(f.name)
  lines <- grep('library', file.input)
  for (l in lines) {
    list.of.libs[[i]] <- as.character(file.input[[l]])
    i <- i+1
    }
}
list.of.libs <- unique(unlist(list.of.libs))

for (l in list.of.libs) {
  print(l)
  w = str_match(l, "library(.*?)")
  print(w)
  }


