#Data Descriptives

#Reorder data
data %<>%
  select(bioname, congress, elected106, elected107, elected108, elected109, elected110, elected111, elected112, elected113, elected114, elected115, elected116, everything())


#Counts

hist(data$congress)

data %<>% as.numeric(TYPE)
hist(as.numeric(data$TYPE))


cong106 <- data %>%
  filter(congress %in% 106)
hist(as.numeric(cong106$TYPE))
table(as.factor(cong106$agency))

cong107 <- data %>%
  filter(congress %in% 107)
hist(as.numeric(cong107$TYPE))
table(as.factor(cong107$agency))

cong108 <- data %>%
  filter(congress %in% 108)
hist(as.numeric(cong108$TYPE))
table(as.factor(cong108$agency))

cong109 <- data %>%
  filter(congress %in% 109)
hist(as.numeric(cong109$TYPE))
table(as.factor(cong109$agency))

cong110 <- data %>%
  filter(congress %in% 110)
hist(as.numeric(cong110$TYPE))
table(as.factor(cong110$agency))

cong111 <- data %>%
  filter(congress %in% 111)
hist(as.numeric(cong111$TYPE))
table(as.factor(cong111$agency))

cong112 <- data %>%
  filter(congress %in% 112)
hist(as.numeric(cong112$TYPE))

cong113 <- data %>%
  filter(congress %in% 113)
hist(as.numeric(cong113$TYPE))
table(as.factor(cong113$agency))

cong114 <- data %>%
  filter(congress %in% 114)
hist(as.numeric(cong114$TYPE))
table(as.factor(cong114$agency))

cong115 <- data %>%
  filter(congress %in% 115)
hist(as.numeric(cong115$TYPE))
table(as.factor(cong115$agency))

cong116 <- data %>%
  filter(congress %in% 116)
hist(as.numeric(cong116$TYPE))
table(as.factor(cong116$agency))

data %>%
  count(ifelse(str_detect()))



data %<>%
  select(bioname, congresses, everything())

hist(data$congress)

type <- data %>%
filter(!is.na(TYPE))

type %<>%
  mutate(TYPE = as.numeric(TYPE))

hist(type$TYPE)


data %<>%
select(bioname, congresses, everything())

type2 <- data %>%
  filter(!is.na(TYPE))


type2 %<>%
  mutate(TYPE = as.numeric(TYPE))

hist(type2$TYPE)

class(members$congress)


                                              
                                              

