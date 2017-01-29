library(plyr)
args<-commandArgs(TRUE)
sink(args[2], append=FALSE, split=FALSE)    # Output to filename defined by second argument
mydata <- read.table(file=args[1], sep=";", fill=TRUE, header=T, skip=1)  # na.strings=c("","NA")



# print(mydata[, 5])
# print(mydata)
# summary(mydata)
mydata$Määrä = as.numeric(gsub(",", ".", gsub("\\.", "", mydata$Määrä)))
mydata[, 4] <- as.numeric(as.character( mydata[, 4] ))
# mydata[, 4] <- mydata[, 4 < 0]
mydata[, 1] <- as.Date( mydata[, 1], "%d.%m.%Y")
# mydata[, 1] <- format(mydata[, 1], "%m-%Y")
# summary(mydata)
# print(mydata[, 1])

transactions_data = ddply(mydata, .(Kuukausi=format(Kirjauspäivä, "%m")), summarise, Määrä=sum(Määrä[Määrä > 0]))

# monthlySummary <- ddply(tempData, .(format(Date, "%m" ), summarize, monthlyMean=mean(Temp_C))

# transactions_data <- transactions_data[order(transactions_data$Määrä),]

# transactions_data = ddply(mydata, .(Saaja.Maksaja), summarise, Määrä=sum(Määrä))
# transactions_data <- transactions_data[order(transactions_data$Määrä),]
print((transactions_data))
plot(transactions_data, type="l")

