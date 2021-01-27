# Plotting Tutorial

Movies <- read.csv("P2-Movie-Ratings.csv", stringsAsFactors = TRUE)
head(Movies)

colnames(Movies) <- c("Movie", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(Movies)
tail(Movies)
str(Movies)

summary(Movies)

factor(Movies$Year)
Movies$Year <- factor(Movies$Year)

# ------ Aesthetics

ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating)) 

# Adding the dots
ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating)) + 
  geom_point()

# Adding colour
ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating, 
                          colour=Genre)) + geom_point()

# Chanings Size colour
ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating, 
                          colour=Genre, size = Genre)) + geom_point()

# Chanings Size colour
ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating, 
                          colour=Genre, size = BudgetMillions)) + geom_point()


# This is number 1


#Plotting with layers
p <- ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating, 
                          colour=Genre, size = BudgetMillions)) + geom_point()

p + geom_point()
p + geom_line()
p + geom_line() + geom_point()


# Overridng Aesthetics

q <- ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating, 
                                   colour=Genre, size = BudgetMillions)) + geom_point()

ggplot(data = Movies, aes(x = AudienceRating, y = BudgetMillions 
                          )) + geom_point()

# Add Geom Layer

q + geom_point()

# Overiding aesthetics

q + geom_point(aes(size = CriticRating))

#This one won't work
q + geom_point(aes(colour = BudgetMillions))

q + geom_point(aes(x = BudgetMillions)) +
xlab("Budget (Millions)")

q + geom_line() + geom_point()

#Reduce Line size

q + geom_line(size = 1) + geom_point()


# Mapping vs Setting

r <- ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating))
r+geom_point()



# Add Colour

#1. Mapping

r + geom_point(aes(colour = Genre)) # Telling it what colour belongs to

#2 Setting
r + geom_point(colour = "DarkGreen") # Setting the actual colour


#1. Mapping

r + geom_point(aes(size = BudgetMillions))

r + geom_point(size = 10)

## Histograms and Density Charts

s <- ggplot(data = Movies, aes( x = BudgetMillions))

#Creating a histogram

s + geom_histogram(binwidth = 10)
s + geom_histogram(binwidth = 10, aes(fill = Genre))

# Adding a border
s + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")


# Density Chart

s +geom_density(aes(fill=Genre), position = "stack")


#----------------Starting layer tips

t <- ggplot(data= Movies, aes(x = AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill = "White", colour = "Blue")

# another way:


t<- ggplot(data=Movies)

t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill = "White", colour = "Blue")
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill = "White", colour = "Blue")

t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill = "White", colour = "Blue")


t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating, fill = Genre),
                  , colour = "Black")

## Testing





































