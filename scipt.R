#load libreries #### 
install.packages(c('iNZightPlots', 'FutureLearnData'), dependencies = TRUE, 
              repos = c('https://r.docker.stat.auckland.ac.nz', 'https://cran.rstudio.com'))

library(iNZightPlots)
library(FutureLearnData)
library(colorspace)
library(viridis)
library(iNZightTS)

#load data

data <- data(package="FutureLearnData")
data(nhanes_1000) 

nhanes_1000[1:10, 1:8] #preview
head(nhanes_1000)
tail(nhanes_1000)
names(nhanes_1000) 

# categorical variables ####
iNZightPlot(Race3, data=nhanes_1000)

# Get a summary for a variable (Race3)
# Equiv. of Get Summary in iNZight
getPlotSummary(Race3, data=nhanes_1000)

# Equivalent of Get Inference in iNZight
getPlotSummary(Race3, data=nhanes_1000, summary.type="inference", inference.type="conf") # "summary"

# Colour by a variable (Race3) (default colour palette)
iNZightPlot(Race3, data=nhanes_1000, colby=Race3)

# Create a new variable Race3.reord to re-order Race3
# with the categories in frequency order
levels(nhanes_1000$Race3)
nhanes_1000$Race3.reord = factor(nhanes_1000$Race3, 
                                 levels = c("White", "Black", "Mexican", "Hispanic", "Asian", "Other"))

levels(nhanes_1000$Race3.reord)

iNZightPlot(Race3.reord, data=nhanes_1000)
iNZightPlot(Race3.reord, data=nhanes_1000, colby=Race3)

# Well do this again putting the levels of Education into a sensible order
iNZightPlot(Education, data=nhanes_1000)
levels(nhanes_1000$Education)

# Create a new variable to re-order Education
nhanes_1000$Education.reord = factor(nhanes_1000$Education,
                              levels = c("8thGrade", "9_11thGrade", "HighSchool","SomeCollege", "CollegeGrad"))

levels(nhanes_1000$Education.reord)

iNZightPlot(Education.reord, data=nhanes_1000)
iNZightPlot(Education.reord, data=nhanes_1000,colby=Education.reord)

# Now change the colour palette to rainbow colours
iNZightPlot(Education.reord, data=nhanes_1000,colby=Education.reord, col.fun=rainbow)
iNZightPlot(Education.reord,data=nhanes_1000,colby=Education.reord,col.fun=rainbow_hcl)

iNZightPlot(Education.reord, data=nhanes_1000,colby=Education.reord,col.fun=viridis)
help(viridis)

#Optional: Try this new feature (interactive web graphics)
#We will export an iNZightPlot graph as an Interactive HTML file and open this file up
#in our default browser. If that is a modern browser like Chrome, Firefox or Safari (but
#not Internet Explorer) this will then give you an interactive version of the graph that
#lets you query it in various ways like hovering over bars or clicking them. Explore!
#You can give such files to others. They do not need to be connected to iNZight to
#work.

# Here is sample code:
# Make a plot and also store the output in myplot

myplot = iNZightPlot(Education.reord, data=nhanes_1000,colby=Education.reord,col.fun=viridis)

# Specify a location to store an Interactive HTML file. I will call my file "myintplot.html"
# You will have to change the path to the file because this one is to a location on my desktop!

filepath = "C://Users/Luis/Documents/Desktop/RStudio/Git/Data-to-Insight-An-Introduction-to-Data-Analysis-and-Visualisation/myintplot1.html" 
exportHTML(myplot, filepath)
browseURL(filepath) #open the file up in my default browser

# numeric variable ####
iNZightPlot(Pulse, data=nhanes_1000)
names(nhanes_1000)

# Changing the size of the dots
iNZightPlot(Pulse, data=nhanes_1000, cex.dotpt=.4)

# Get a Summary for Pulse
getPlotSummary(Pulse, data=nhanes_1000)

# Equivalent of Get Inference for Pulse
getPlotSummary(Pulse, data=nhanes_1000, summary.type="inference", inference.type="conf")

# Colour points by Age
iNZightPlot(Height, data=nhanes_1000, colby=Age)

# Change colour palette to rainbow
iNZightPlot(Height, data=nhanes_1000, colby=Age, col.fun=rainbow)

#  Change Plot type to histogram 
iNZightPlot(Height, data=nhanes_1000, plottype= "hist")

#  Control the number of bins (class intervals) 
iNZightPlot(Height, data=nhanes_1000, plottype= "hist", hist.bins=10)

#  Get a list of all the other things that can be changed in plots 
inzpar()                       # This list is complete
?inzpar                        # This documentation is not complete

# Make a plot and also store the output in myplot
myplot = iNZightPlot(Height, data=nhanes_1000, colby=Age, col.fun=rainbow)

# Specify a location to store an Interactive HTML file. I will call my file "myintplot.html"
# You will have to change the path to the file because this one is to a location on my desktop!
filepath = "C://Users/Luis/Documents/Desktop/RStudio/Git/Data-to-Insight-An-Introduction-to-Data-Analysis-and-Visualisation/myintplot2.html"
exportHTML(myplot, filepath)
browseURL(filepath) #open the file up in my default browser

# If the plot is truncated make your R plotting window smaller
# To add extra variables
filepath = "C://Users/Luis/Documents/Desktop/RStudio/Git/Data-to-Insight-An-Introduction-to-Data-Analysis-and-Visualisation/myintplot3.html"
exportHTML(myplot, filepath, data=nhanes_1000, extra.vars = c("Gender", "Weight"))
browseURL(filepath) #open the file up in my default browser



# iNZightPlot ####
data(gapminder_2008)
names(gapminder_2008)

iNZightPlot(ChildrenPerWoman, data=gapminder_2008)

# Now break out by Region
iNZightPlot(ChildrenPerWoman, Region, data=gapminder_2008)

# Get Summary of ChildrenPerWoman broken out by Region 
getPlotSummary(ChildrenPerWoman, Region, data=gapminder_2008)
	
# Colour by Region 
iNZightPlot(ChildrenPerWoman, Region, data=gapminder_2008, colby=Region)

# Try also 
iNZightPlot(ChildrenPerWoman, Region, data=gapminder_2008, colby=Region, cex.text=0.1)
iNZightPlot(ChildrenPerWoman, Region, data=gapminder_2008, colby=Region, hide.legend = TRUE)

# Colour by Infantmortality 
iNZightPlot(ChildrenPerWoman, Region, data=gapminder_2008, colby=Infantmortality, 
            col.fun=rainbow, hide.legend = TRUE)

# Make a plot and also store the output in myplot
myplot = iNZightPlot(ChildrenPerWoman, Region, data=gapminder_2008, colby=Infantmortality, 
                     col.fun=rainbow, hide.legend = TRUE)

# Specify a location to store an Interactive HTML file. I will call my file "myintplot.html"
# You will have to change the path to the file because this one is to a location on my desktop!
filepath = "C://Users/Luis/Documents/Desktop/RStudio/Git/Data-to-Insight-An-Introduction-to-Data-Analysis-and-Visualisation/myintplot4.html"
exportHTML(myplot, filepath)
browseURL(filepath) #open the file up in my default browser


# iNZightPlot - subset ####
data(gapminder)
names(gapminder)
summary(gapminder)

getPlotSummary(ChildrenPerWoman, Country, data=gapminder)
dimnames(gapminder)
nrow(gapminder)
ncol(gapminder)

#Chile = Country 41

gapminder$Country["Chile"]

iNZightPlot(ChildrenPerWoman, Region, data=gapminder)

# Plot ChildrenPerWoman by Region  "subset"  by Year_cat 
iNZightPlot(ChildrenPerWoman, Region, g1=Year_cat, data=gapminder, colby=ChildrenPerWoman)

# Plot ChildrenPerWoman by Region  subset by Year_cat 
iNZightPlot(ChildrenPerWoman, Year_cat, g1=Region, data=gapminder, 
            colby=ChildrenPerWoman, col.fun=rainbow)

levels(gapminder$Year_cat)

# Display just the plot for the year 2000
iNZightPlot(ChildrenPerWoman, Region, g1=Year_cat, g1.level="[2000]", data=gapminder,
            colby=ChildrenPerWoman, col.fun=rainbow)

# Do it again for 2004 
iNZightPlot(ChildrenPerWoman, Region, g1=Year_cat, g1.level="[2004]", data=gapminder,
            colby=ChildrenPerWoman, col.fun=rainbow)

# Plot ChildrenPerWoman by Region  subset by Year_cat 
iNZightPlot(ChildrenPerWoman, Country, g1=Year_cat, g1.level="[2004]", data=gapminder, 
            colby=ChildrenPerWoman, col.fun=rainbow)

# Plot ChildrenPerWoman by Year_cat  Country 
levels(gapminder$Country)

iNZightPlot(ChildrenPerWoman,
            g1=Country,  g1.level="Chile",
            g2=Year_cat, g2.level="[2012]",
            data=gapminder, 
            colby=ChildrenPerWoman, col.fun=rainbow)

myplot = iNZightPlot(ChildrenPerWoman,Year_cat,
            g1=Country,  g1.level="Chile",
            data=gapminder, 
            colby=ChildrenPerWoman, col.fun=rainbow, xlim = c(-10,8),
            )

filepath = "C://Users/Luis/Documents/Desktop/RStudio/Git/Data-to-Insight-An-Introduction-to-Data-Analysis-and-Visualisation/myintplot5.html"
exportHTML(myplot, filepath)
browseURL(filepath) #open the file up in my default browser

# Now put it in a loop and do it for every year, i.e. for every level of Year_cat
for (k in levels(gapminder$Year_cat))
  iNZightPlot(ChildrenPerWoman,
              g1=Country,  g1.level="Chile",
              g2=Year_cat, g2.level=k,
              data=gapminder, 
              colby=ChildrenPerWoman, col.fun=rainbow)

# Do not display a new plot UNTIL you have clicked on the on plot window
old.value = devAskNewPage(TRUE)      # save current plotting behaviour and ask for new behaviour

for (k in levels(gapminder$Year_cat)) 
  iNZightPlot(ChildrenPerWoman,
              g1=Country,  g1.level="Chile",
              g2=Year_cat, g2.level=k,
              data=gapminder, 
              colby=ChildrenPerWoman, col.fun=rainbow)

devAskNewPage(old.value)     #  Reset the plotting behaviour back to the way it was before

# Play the plots, but with a 2 second delay between plots
for (k in levels(gapminder$Year_cat)) {
  iNZightPlot(ChildrenPerWoman,
              g1=Country,  g1.level="Chile",
              g2=Year_cat, g2.level=k,
              data=gapminder, 
              colby=ChildrenPerWoman, col.fun=rainbow)
  Sys.sleep(2)
}

# relationships between categorical variables ####
# Recreate  Education.reord 
nhanes_1000$Education.reord = factor(nhanes_1000$Education, 
                              levels = c("8thGrade","9_11thGrade","HighSchool","SomeCollege","CollegeGrad"))

iNZightPlot(Education.reord, data=nhanes_1000)

# Education.reord by Gender (side by side barcharts) 
iNZightPlot(Education.reord, Gender, data=nhanes_1000)

# Education subset by  Gender  (also coloured by Gender)
iNZightPlot(Education.reord, g1=Gender, data=nhanes_1000, colby=Gender)

#  Display just the female plot
iNZightPlot(Education.reord, g1=Gender, g1.level="female", data=nhanes_1000, colby=Gender)

#  Display just the male plot
iNZightPlot(Education.reord, g1=Gender, g1.level="male", data=nhanes_1000, colby=Gender)

#  Plot Education.reord subset by AgeDecade
iNZightPlot(Education.reord, g1=AgeDecade, data=nhanes_1000, colby=AgeDecade)

# Filter out unhelpful data
# Make a subset of the data without "under 20s" & call it Temp 
# (This is an example of "filtering" the data)"

Temp = subset(nhanes_1000, AgeDecade !=" 0-9" & AgeDecade !=" 10-19") # "!=" is read as "is not equal to"
table(Temp$AgeDecade)

# This will remove the empty levels 
Temp$AgeDecade=factor(Temp$AgeDecade) 

#  Replot the data using the subset of the data called Temp
iNZightPlot(Education.reord, g1=AgeDecade, data=Temp, colby=AgeDecade)

# relationships between numeric variables ####
data(gapminder_2008)

# Plot y=EnergyUsePerPerson by x=CO2emissions
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008)

# Note the reversal in the order of the names between the call and ordinary English usage for what we want to do!
# Label the 4 most extreme points by the variable Country
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008,locate=Country, locate.extreme=4)

# Add a trend line*
iNZightPlot(CO2Emissions, EnergyUsePerPerson, data=gapminder_2008, trend="linear")

# Changing from the default Axes labels and title
iNZightPlot(data=gapminder_2008,
            CO2Emissions, 
            EnergyUsePerPerson, 
            xlab="CO2 emissions per person ", 
            ylab="Energy use per person", 
            main="Energy use versus CO2 emissions")

# Put on a trend line but coloured red, instead of the default (blue) 
iNZightPlot(CO2Emissions, 
            EnergyUsePerPerson, 
            data=gapminder_2008, 
            trend="linear", 
            col.trend=list(linear="red")) 

# Label specified data points (easy metod)
gapminder_2008$Country # Chile=41 / Australia=12 / Spain=190 / United States of America=214

iNZightPlot(CO2Emissions, 
            EnergyUsePerPerson, 
            data=gapminder_2008, 
            trend="linear", 
            col.trend=list(linear="red"),
            col.fun=rainbow,
            locate=Country, 
            locate.id = c(41),
            colby=Country,
            hide.legend = TRUE,
            xlab="CO2 emissions per person ", 
            ylab="Energy use per person", 
            main="Energy use versus CO2 emissions") 

#  Label specified data points (hard metod)
ids = (1:nrow(gapminder_2008))[gapminder_2008$Country %in% c("Qatar","Iceland","Sweden")]
ids2 = (1:nrow(gapminder_2008))[gapminder_2008$Country %in% c("Chile")]

iNZightPlot(CO2Emissions, 
            EnergyUsePerPerson, 
            data=gapminder_2008, 
            locate.id=ids2, 
            locate=Country, 
            colby=Country, 
            col.fun=rainbow, 
            hide.legend = TRUE)

# Make a plot and also store the output in myplot
myplot = iNZightPlot(CO2Emissions, 
                     EnergyUsePerPerson, 
                     data=gapminder_2008, 
                     trend="linear", 
                     col.trend=list(linear="red"),
                     col.fun=rainbow,
                     locate=Country, 
                     locate.id = c(41),
                     colby=Country,
                     hide.legend = TRUE,
                     xlab="CO2 emissions per person ", 
                     ylab="Energy use per person", 
                     main="Energy use versus CO2 emissions")

# plot and save like html
filepath = "C://Users/Luis/Documents/Desktop/RStudio/Git/Data-to-Insight-An-Introduction-to-Data-Analysis-and-Visualisation/myintplot6.html"
exportHTML(myplot, filepath)
browseURL(filepath) #open the file up in my default browser  #open the file up in my default browser

# To add extra variables, e.g. Year, Pop
names(gapminder_2008)
exportHTML(myplot, filepath, data=gapminder_2008, extra.vars = c("Year", "Populationtotal"))
browseURL(filepath) 

# techniques for scatterplots ####
# Provided here in case of problems with copying and pasting from the pdf

# Plot Weight vs  Age 
iNZightPlot(Age, Weight,data=nhanes_1000)

# Add a trend line 
iNZightPlot(Age, Weight, data=nhanes_1000, trend="linear")

#  Get some summary information (result depends on trends fitted)
getPlotSummary(Age, Weight, data=nhanes_1000, trend="linear")
getPlotSummary(Age, Weight, data=nhanes_1000, trend="linear", summary.type="inference")

# Add more trend curves and a smoother* 
iNZightPlot(Age,Weight,data=nhanes_1000, trend=c("linear", "quadratic", "cubic") , smooth=.25)

# Make all the lines thicker, all solid lines, and change line colours
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3,
            trend=c("linear", "quadratic", "cubic"), 
            lty.trend=list(linear=1, quadratic=1,cubic=1), smooth=1,
            lwd=1,
            col.trend=list(linear="red", quadratic="yellow", cubic="blue"), col.smooth="black")

# Scatter plot coloured by Height and with Transparency
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3)

# alpha (0 to 1) controls transparency. Smaller for more transparent
# Make the points smaller
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3, cex.pt=.5)

# Create a median smoother in black
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3, quant.smooth=.5, col.smooth="black")

# Create a median and quartile smoothers all in black
iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3, 
            quant.smooth=c(.25,.5,.75), col.smooth="black")

iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, col.fun=viridis, alpha=.3, cex.pt=.5,
            trend="cubic", col.trend=list(cubic="black"))

#  Jitter in the vertical (y) direction
iNZightPlot(Age, HomeRooms, data=nhanes_1000)
iNZightPlot(Age, HomeRooms, data=nhanes_1000, jitter="y")

# Make a plot and also store the output in myplot
myplot = iNZightPlot(Age, Weight, data=nhanes_1000, colby=Height, alpha=.3, cex.pt=.5,
                       trend=c("linear", "quadratic", "cubic"),
                       col.trend=list(linear="red", quadratic="yellow", cubic="blue"))

# Specify a location to store an Interactive HTML file. I will call my file "myintplot.html"
# You will have to change the path to the file because this one is to a location on my desktop!
filepath = "C://Users/Luis/Documents/Desktop/RStudio/Git/Data-to-Insight-An-Introduction-to-Data-Analysis-and-Visualisation/myintplot7.html"
exportHTML(myplot, filepath)
browseURL(filepath)    #open the file up in my default browser

# To add extra variables
exportHTML(myplot, filepath, data=nhanes_1000, extra.vars = c("ID", "Gender"))


# advanced scatterplots with deeper analysis ####
# Scatterplot of Infantmortaility against ChildrenPerWoman
iNZightPlot(ChildrenPerWoman,Infantmortality , data=gapminder)

#  Subset by Year_cat
iNZightPlot(ChildrenPerWoman,Infantmortality, g1=Year_cat, data=gapminder)

# Change size and colour of points
iNZightPlot(ChildrenPerWoman,Infantmortality,g1=Year_cat, data=gapminder, 
            colby=Region, sizeby=Populationtotal)

#  Show results for 1972 only 
iNZightPlot(ChildrenPerWoman,Infantmortality,g1=Year_cat, g1.level="[1972]",
            data=gapminder, colby=Region, sizeby=Populationtotal)

# Darker background (often easier to see some of the lighter dots)
iNZightPlot(ChildrenPerWoman,Infantmortality, g1=Year_cat, g1.level="[1972]",
            data=gapminder, colby=Region, sizeby=Populationtotal, bg="darkgray")

#Here!!!
#Try transparency and smaller points (removed garkgray)
iNZightPlot(ChildrenPerWoman,Infantmortality, g1=Year_cat, g1.level="[1976]",
            data=gapminder, colby=Region, sizeby=Populationtotal, alpha=.45, cex.dotpt=.5)

# Try subsetting by different years, e.g. g1.level="[1976]",
#  Label some of the extreme points (ask for 4)
iNZightPlot(ChildrenPerWoman,Infantmortality, g1=Year_cat, g1.level="[1972]",
            data=gapminder, colby=Region, sizeby=Populationtotal, alpha=.45, cex.dotpt=.5, 
            locate.extreme=4, locate=Country)

#  Label some specific countries
View(gapminder$Country)
View(gapminder$Year_cat)

ids = (1:nrow(gapminder))[gapminder$Country %in% c("Chile")] 

iNZightPlot(ChildrenPerWoman,Infantmortality, g1=Year_cat, g1.level="[1984]",
            data=gapminder, colby=Region, sizeby=Populationtotal, alpha=.45, cex.dotpt=.5, 
            locate.id=ids, locate=Country)

# Allow a little more room on left to accommodate label
iNZightPlot(ChildrenPerWoman,Infantmortality, g1=Year_cat, g1.level="[1984]",
            data=gapminder, colby=Region, sizeby=Populationtotal, alpha=.45, cex.dotpt=.5, 
            locate.id=ids, locate=Country, xlim=c(0,9))

# Subset by a fourth variable (Region= America)
iNZightPlot(ChildrenPerWoman, Infantmortality,
            g1= Year_cat,
            g2=Region, g2.level="America",
            data=gapminder, sizeby=Populationtotal, 
            colby=Country, color.fun= viridis, alpha=.45, cex.dotpt=.5, 
            locate.id=ids, locate=Country, 
            hide.legend = TRUE, xlim=c(0,9), ylim=c(0,150))

# Subset by Populationtotal and Region=America and filter by  Year_Cat=1984
iNZightPlot(ChildrenPerWoman, Infantmortality, 
            g1=Year_cat, g1.level="[1984]", 
            g2=Region, g2.level="America",
            data=gapminder, sizeby=Populationtotal, 
            colby=Country, color.fun= viridis, alpha=.45, cex.dotpt=.5, 
            locate.id=ids, locate=Country, 
            hide.legend = T, xlim=c(0,9), ylim=c(0,150))


#  Play through the years
for (k in levels(gapminder$Year_cat)) {
    iNZightPlot(ChildrenPerWoman, Infantmortality,
              g1= Year_cat, g1.level=k,
              g2=Region, g2.level="America",
              data=gapminder, sizeby=Populationtotal, 
              colby=Country, color.fun= viridis, alpha=.45, cex.dotpt=.5, 
              locate.id=ids, locate=Country, 
              hide.legend = TRUE, xlim=c(0,9), ylim=c(0,150))
          Sys.sleep(2)
}

# time series for a single variable ####
data(week8_AverageVisitorsQuarterly)
head( week8_AverageVisitorsQuarterly)
View(week8_AverageVisitorsQuarterly)

Australia = iNZightTS(week8_AverageVisitorsQuarterly, var="Australia")

# Plot the data -- t controls smoothing
plot( Australia , t=20, ylab="Average Visitors")

# Now experiment with different values of t
# If you are on Windows and using R alone (not RStudio) try ?
plot( Australia, t=20, animate=TRUE)

# Seasonal plot ? additive
seasonplot( Australia )

# Seasonal plot ? multiplicative
seasonplot( Australia, multiplicative=TRUE)

# Decomposition plot
decompositionplot( Australia, t=20)

# Recomposed plot
decomp=decompositionplot( Australia, t=20)
recompose(decomp, animate=FALSE)

# If you are on Windows and using R alone (not RStudio) try ?
recompose(decomp, animate=TRUE)

# Calculate a forecast
forecastplot( Australia )
forecastplot(Australia, multiplicative=F)
forecastplot(Australia, multiplicative=T)

# Let establish this pattern for another country
China = iNZightTS (week8_AverageVisitorsQuarterly, var= "China.PR")
plot( China, t=20, ylab="Visitor Arrivals")
decompositionplot( China, t=20, ylab="Average Visitors")

# Recomposed plot
decomp=decompositionplot( China, t=20)
recompose(decomp, animate=FALSE)

# If you are on Windows and using R alone (not RStudio) try ?
recompose(decomp, animate=TRUE)

# Calculate a forecast
forecastplot( China)
forecastplot(China, multiplicative=F)
forecastplot(China, multiplicative=TRUE)

# time series analysis for more than one series ####
# See how these work
c(2,5,9)
c(2,4:6, 8)

names(week8_AverageVisitorsQuarterly)
Aus_USA = iNZightTS(week8_AverageVisitorsQuarterly, var=c(2,9))
# Alternative, use the names of the columns
Aus_USA = iNZightTS(week8_AverageVisitorsQuarterly, var=c("Australia","USA"))
plot(Aus_USA, t=20, multiplicative=F) #additive seasonal efects
plot(Aus_USA, t=20, multiplicative=T) #multiplicative seasonal efects

jpn_can = iNZightTS(week8_AverageVisitorsQuarterly, var=c("Japan", "Canada"))
plot(jpn_can, multiplicative=F) #additive seasonal efects
plot(jpn_can, multiplicative=T) #multiplicative seasonal efects

# Separate plots for Aus_USA
plot(Aus_USA, t=20, compare=FALSE, multiplicative=F)
plot(jpn_can, t=20, compare=FALSE, multiplicative=F)

ALL = iNZightTS(week8_AverageVisitorsQuarterly, var=c(2:9))
plot(ALL, t=20)

# Separate plots for ALL
plot(ALL, t=20, compare=FALSE)

# Note: too many series at once for this display 