library(ggplot2)
install.packages("RColorBrewer")
library("RColorBrewer")
boxplot(count~interest, data = d)


cols <- brewer.pal(3, "Blues")

bp <-ggplot(d, aes(x=interest, y=count)) + 
  geom_boxplot(outlier.colour="black", outlier.shape=16,
             outlier.size=2, notch=TRUE) 
bp + scale_fill_brewer( palette="Blues") + theme_classic()

bp + scale_fill_brewer(palette = "Dark2")

countModel <- glm(count ~ interest, 
                  data = d  %>% distinct(), 
                  family = poisson)  

summary(countModel)
