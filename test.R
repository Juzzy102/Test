# Selecting a file manually

stats <- read.csv(file.choose())

# Method = setting the working directory
getwd()

#Setting WD - 
#setwd("C:\\Users\\xxxx")

#------------ Creating data frames
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)

# Changing the column names
#colnames(mydf) <-c("Country", "Code", "Region")
#head(mydf)

#Shortcut
mydf <- data.frame(Country = Countries_2012_Dataset, Code = Codes_2012_Dataset, Region = Regions_2012_Dataset)
head(mydf)


#Merging data frames
merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <-NULL
str(merged)
head(merged)

#Visualising Data 

qplot(data = merged, x = Internet.users, y = Birth.rate)
qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region)
qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region, size = I(5), shape=I(2))

# Transparency

qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region, size = I(5), shape=I(19), alpha = I(0.6) ) #alpha controls transparency

#Title
qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region, size = I(5), shape=I(19), alpha = I(0.6),
      main = "Birthrate vs Internet Users") 



