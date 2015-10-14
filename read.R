library(plyr)
args<-commandArgs(TRUE)
mydata <- read.table(file=args[1], na.strings=c("","NA"), sep="\t", fill=TRUE, header=T, skip=1)
mydata$Määrä = as.numeric(gsub(",", ".", gsub("\\.", "", mydata$Määrä)))
mydata[, 4] <- as.numeric(as.character( mydata[, 4] ))
transactions_data = ddply(mydata, .(Saaja.Maksaja), summarise, Määrä=sum(Määrä))
print((transactions_data))
plot(transactions_data)