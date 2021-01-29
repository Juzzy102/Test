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

## Statistical Transformations

u <- ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating, colour = Genre))

u + geom_point() + geom_smooth(fill = NA)


#boxplots

u <- ggplot(data = Movies, aes(x = Genre, y = AudienceRating, colour = Genre))
u + geom_boxplot()
u + geom_boxplot(size = 1.2)

u + geom_boxplot(size = 1.2) + geom_point()

# tip
u + geom_boxplot(size = 1.2) + geom_jitter()

# another way

u + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)

# Critic Rating Challenge

z <- ggplot(data= Movies, aes(x = Genre, y = CriticRating, colour = Genre))
z + geom_jitter() +geom_boxplot(size = 1.2, alpha = 0.5) 


# Facets

v <- ggplot(data = Movies, aes(x= BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

# Creating a histogram for each genre - use facets

v + geom_histogram(binwidth = 10, aes(fill = Genre), 
                   colour = "Black") +
  facet_grid(Genre~., scales = "free")

#scatter plots

w <- ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating,
                               colour = Genre))
w + geom_point(size = 3) + facet_grid(Year~.)

w + geom_point(aes(size = BudgetMillions)) + 
  geom_smooth() + 
  facet_grid(Genre~Year)

#coordinates

#Limiting the axis


m <- ggplot(data = Movies, aes(x = CriticRating, y = AudienceRating, 
                               size = BudgetMillions, colour = Genre))

m + geom_point()

m + geom_point() + 
  xlim(50,100) + 
  ylim(50,100) 

n <- ggplot(data = Movies, aes(x = BudgetMillions))

# Wrong way of doing things

n + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black") +
  ylim(50, 100)

# Zooming in

n + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black") +
  coord_cartesian(ylim = c(0,50))

w + geom_point(aes(size = BudgetMillions)) + 
  geom_smooth() + 
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))


# Themes

o <- ggplot(data = Movies, aes(x = BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

# Label
h + xlab("Money Axis") +
  ylab("Number of Movies")


# Label Formatting

h + xlab("Money Axis") +
  ylab("Number of Movies") + 
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 15), 
        axis.title.y = element_text(colour = "Red", size = 15))

# Tick mark formatting

h + xlab("Money Axis") +
  ylab("Number of Movies") + 
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 15), 
        axis.title.y = element_text(colour = "Red", size = 15),
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15))


?theme

# Legend Formatting

h + xlab("Money Axis") +
  ylab("Number of Movies") + 
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 15), 
        axis.title.y = element_text(colour = "Red", size = 15),
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15),
        legend.title = element_text(size = 15),
        legend.text = element_text(size = 15),
        legend.position = c(1,1),
        legend.justification = c(1,1)
        
        )

# Title of plot

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 15), 
        axis.title.y = element_text(colour = "Red", size = 15),
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15),
        legend.title = element_text(size = 15),
        legend.text = element_text(size = 15),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour ="DarkBlue",
                                  size = 15, family = "Courier")
        
  )


































