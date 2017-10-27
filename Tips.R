setwd("C:/Users/Howard/Documents/JBriggs/NR995")
survey <- read.table ("surveys.csv", sep = ",", header = T, stringsAsFactors = F)
head(survey)
summary(survey)
dim(survey)

rodents <- read.table ("rodent_timeseries.csv", sep = ",", header = T, stringsAsFactors = F)
head(rodents)

install.packages("gridExtra")

library(ggplot2)
library(gridExtra)
library(grid)

plot1 <- ggplot(subset(survey[survey$sex != "", ]), aes(x = sex, y = hindfoot_length, group = sex, color = sex)) + 
  geom_boxplot() + 
  labs(x = "Sex", y = "Hindfoot Length(mm)", title = "Rodents") + 
  theme(plot.title = element_text(hjust = 0.5))



plot2 <-ggplot(data = rodents, aes(x = year, y = n, group = species_id, color = species_id)) + 
  geom_line() + 
  labs(color = "Species", x = "Year", y = "Number of Samples", title = "Rodents captured over time") + 
  theme(plot.title = element_text(hjust = 0.5))

grid.arrange(plot1, plot2, ncol=2,
             top = textGrob("Figure 1: Both the plots are here",
                            x = 0, # starts far left
                            y = 0.5, # experiment with
                            # vertical placement
                            just = "left", # left-aligned,
                            gp = gpar(fontsize = 18) # bigger font
             ),
             bottom = textGrob("Fig 1: these plots show the hind foot length by sex and number of samples per year for each species.",
                               x = 0,
                               y = 0.5,
                               just = "left"))