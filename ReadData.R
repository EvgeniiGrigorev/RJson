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

# Cards names
velocity$cards$name
# Closed index
velocity$cards$closed
# Last activity
velocity$cards$dateLastActivity


library(stringr)

# prepare regular expression
regexp <- "[[:digit:]]+"

# process string
cards.sp <- as.data.frame(str_extract(velocity$cards$name, regexp))
colnames(cards.sp) = 'SP'
cards.name <- as.data.frame(velocity$cards$name)
colnames(cards.name) = 'ID'
cards.la <- as.data.frame(velocity$cards$dateLastActivity)
colnames(cards.la) = 'LastActivity'
cards.closed <- as.data.frame(velocity$cards$closed)
colnames(cards.closed) = 'FlagClosed'
velocity$cards$id

cards <- as.data.frame(c(cards.name, cards.sp, cards.la, cards.closed))

cards.name.full <- as.data.frame(velocity$actions$data.card.name)
colnames(cards.name.full) = 'ID'

cards.name.type <- as.data.frame(velocity$actions$type)
colnames(cards.name.type) = 'Action'

cards.name.date <- as.data.frame(velocity$actions$date)
colnames(cards.name.date) = 'Date'

velocity$actions$data.card.id
velocity$actions$data.list.name
velocity$actions$member.fullName

cards.full <- as.data.frame(c(cards.name.full, cards.name.type, cards.name.date))
cards.full.create <- cards.full[which(cards.full$Action=="createCard"),]


base_1 <- cards.full.create
base_2 <- cards

library(sqldf)
result <- sqldf("SELECT t1.*, t2.* from base_1 t1, base_2 t2 where t1.ID=t2.ID")

na.omit(cards)