library(jsonlite)

# Work Directory
datDir <- getwd()
setwd(datDir)

setwd(paste(datDir,"/Data", sep=""))

# Считываются все данные
velocity <- fromJSON("aAs5Tzf5.json", flatten=TRUE)
names(velocity)

# Имя доски
velocity$name

# Названия задач
velocity$cards$name

strsplit(velocity$cards$name, " ")

# velocity$cards$name[1]

library(stringr)

# prepare regular expression
regexp <- "[[:digit:]]+"

# process string
str_extract(velocity$cards$name, regexp)
