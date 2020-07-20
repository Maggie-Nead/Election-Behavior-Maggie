#packages for visuals
library(ggplot2)
library("RColorBrewer")


#Filter for TYPE
d <- data %>%
  filter(!is.na(TYPE))


#Type counts
d %>%
  group_by(TYPE) %>%
  tally

#Interest variable
d %<>%
  mutate(interest = ifelse(TYPE %in% c(1), "constituent", NA)) %>%
  mutate(interest = ifelse(TYPE %in% c(2,4), "corporate", interest))# %>%
#mutate(interest = ifelse(! str_detect(TYPE, "1|2|4"), "neither", interest))


#Filter out NA
d %<>%
  filter(! is.na(interest))

#Intrest counts
d %>%
  group_by(interest) %>%
  tally()
  

#Boxplot
boxplot(count~interest, data = d, col=(c("darkslategray4","darkslategray3", "darkslategray1")))


#ggplot box plot
ggplot(d, aes(x=interest, y=count)) + 
  geom_boxplot(outlier.colour="black", outlier.shape=16,
               outlier.size=2, notch=TRUE,
               col=(c("darkslategray4","darkslategray3", "darkslategray1"))) 




#d$interest <- ordered(d$interest, levels = c("neither", "corporate", "constituent"))

#poisson model for count given interest
countModel <- glm(count ~ interest, 
                  data = d  %>% distinct(), 
                  #contrasts = list(interest = contr.sum(3)),
                  family = poisson)  

summary(countModel)


#influence points, outliers
cooksd <- cooks.distance(countModel)
plot(cooksd, pch="*", cex=2, main="Influential Obs by Cooks distance")  # plot cook's distance
abline(h = 4*mean(cooksd, na.rm=T), col="red")  # add cutoff line

influential <- as.numeric(names(cooksd)[(cooksd > 4*mean(cooksd, na.rm=T))])  # influential row numbers
head(ozone[influential, ]) 



#LM for count given interest
countModel2 <- lm(count ~ interest, 
                  data = d  %>% distinct())  

summary(countModel2)



#Count given interest/party and interaction

#poisson
#d$party_name <- ordered(d$party_name, levels = c("Independent", "Democratic", "Republican"))
partyModel <- glm(count ~ interest*party_name, 
                  data = d  %>% distinct(), 
                  family = poisson)  

summary(partyModel)



#linear model
partyModel2 <- lm(count ~ interest*party_name, 
                  data = d  %>% distinct()
)  


summary(partyModel2)




