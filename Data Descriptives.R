data <- all_contacts

data %<>%
  mutate(congress = as.character(congress))
class(data$congress)

data %<>%
  group_by(bioname) %>%
  mutate(n = n(),
         SUBJECTS = str_c(SUBJECT, collapse = "; "),
         IDs = str_c(ID, collapse = "; "),
         years = str_c(year, collapse = "; "),
         DATES = str_c(DATE, collapse = "; "),
         agencies = str_c(agency, collapse = "; "),
         FROM = str_c(FROM, collapse = "; "),
         congresses = str_c(as.character(congress), collapse = "; "))  %>%
  arrange(-n) %>%
  select(-SUBJECT, -ID, -year, -DATE, -agency, -timeframe, -FROM, -congress, -bioname_year) %>%
  ungroup() %>%
  distinct()

data %<>%
  select(bioname, congresses, everything())

hist(data$congress)

type <- data %>%
filter(!is.na(TYPE))

type %<>%
  mutate(TYPE = as.numeric(TYPE))

hist(type$TYPE)

data %<>%
  group_by(bioname) %>%
  mutate(n = n(),
         congresses = str_c(congress, collapse = ";")) %>%
  arrange(-n) %>%
  select(-congress) %>%
  ungroup() %>%
  distinct()

data %<>%
select(bioname, congresses, everything())

type2 <- data %>%
  filter(!is.na(TYPE))


type2 %<>%
  mutate(TYPE = as.numeric(TYPE))

hist(type2$TYPE)

class(members$congress)

                                            
members %<>%
  mutate(congress = as.character(congress))%>%
  group_by(bioname) %>%
  mutate(n = n(),
         congresses = str_c(congress, collapse = "; ")) %>%
  arrange(-n) %>%
  select(-congress) %>%
  ungroup() %>%
  distinct()


members %<>%
  mutate(elected1 = ifelse(str_detect(congresses, "105") & str_detect(congresses, "106"), 1, NA))%>%
  mutate(elected2 = ifelse(str_detect(congresses, "106") & str_detect(congresses, "107"), 1, NA))%>%
  mutate(elected3 = ifelse(str_detect(congresses, "107") & str_detect(congresses, "108"), 1, NA))%>%
  mutate(elected4 = ifelse(str_detect(congresses, "108") & str_detect(congresses, "109"), 1, NA))%>%
  mutate(elected5 = ifelse(str_detect(congresses, "109") & str_detect(congresses, "110"), 1, NA))%>%
  mutate(elected6 = ifelse(str_detect(congresses, "110") & str_detect(congresses, "111"), 1, NA))%>%
  mutate(elected7 = ifelse(str_detect(congresses, "111") & str_detect(congresses, "112"), 1, NA))%>%
  mutate(elected8 = ifelse(str_detect(congresses, "112") & str_detect(congresses, "113"), 1, NA))%>%
  mutate(elected9 = ifelse(str_detect(congresses, "113") & str_detect(congresses, "114"), 1, NA))%>%
  mutate(elected10 = ifelse(str_detect(congresses, "114") & str_detect(congresses, "115"), 1, NA))%>%
  mutate(elected11 = ifelse(str_detect(congresses, "115") & str_detect(congresses, "116"), 1, NA))
                                              
                                              

