setwd("C:/Users/Howard/Documents/JBriggs/NR995")
survey <- read.table ("surveys.csv", sep = ",", header = T, stringsAsFactors = F)
head(survey)
summary(survey)
dim(survey)

install.packages("gridExtra")

library(ggplot2)
library(gridExtra)
library(grid)

plot1 <- ggplot(subset(survey[survey$sex != "", ]), aes(x = sex, y = hindfoot_length, group = sex, color = sex)) + 
  geom_boxplot() + 
  labs(x = "Sex", y = "Hindfoot Length(mm)", title = "Rodent weight by sex") + 
  theme(plot.title = element_text(hjust = 0.5))


plot2 <- ggplot(data = survey, aes(x = weight, y = hindfoot_length, color = species_id)) + 
  geom_point(shape = 3) +
  labs(x = "Weight(g)", y = "Hindfoot Length(mm)", title = "Weight and Hind Foot Length") + 
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

grid.arrange(plot1, plot2, ncol=2,
             top = textGrob("Figure 1: Both the plots are here",
                            x = 0, # starts far left
                            y = 0.5, # experiment with
                            # vertical placement
                            just = "left", # left-aligned,
                            gp = gpar(fontsize = 18) # bigger font
             ),
             bottom = textGrob("Fig 1: these plots show the hind foot length by sex and the correlation for weight and hind foot length.",
                               x = 0,
                               y = 0.5,
                               just = "left"))


