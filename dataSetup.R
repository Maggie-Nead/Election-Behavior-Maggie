load("~/Election-Behavior-Maggie/all_contacts.RData") 
load("~/Election-Behavior-Maggie/members.Rdata")



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
  mutate(elected106 = ifelse(str_detect(congresses, "105") & str_detect(congresses, "106"), 1, 0))%>%
  mutate(elected107 = ifelse(str_detect(congresses, "106") & str_detect(congresses, "107"), 1, 0))%>%
  mutate(elected108 = ifelse(str_detect(congresses, "107") & str_detect(congresses, "108"), 1, 0))%>%
  mutate(elected109 = ifelse(str_detect(congresses, "108") & str_detect(congresses, "109"), 1, 0))%>%
  mutate(elected110 = ifelse(str_detect(congresses, "109") & str_detect(congresses, "110"), 1, 0))%>%
  mutate(elected111 = ifelse(str_detect(congresses, "110") & str_detect(congresses, "111"), 1, 0))%>%
  mutate(elected112 = ifelse(str_detect(congresses, "111") & str_detect(congresses, "112"), 1, 0))%>%
  mutate(elected113 = ifelse(str_detect(congresses, "112") & str_detect(congresses, "113"), 1, 0))%>%
  mutate(elected114 = ifelse(str_detect(congresses, "113") & str_detect(congresses, "114"), 1, 0))%>%
  mutate(elected115 = ifelse(str_detect(congresses, "114") & str_detect(congresses, "115"), 1, 0))%>%
  mutate(elected116 = ifelse(str_detect(congresses, "115") & str_detect(congresses, "116"), 1, 0))

class(members$icpsr)

members %<>%
  select(elected106, elected107, elected108, elected109, elected110, elected111, elected112, elected113, elected114, elected115, elected116, icpsr)

data = merge(all_contacts, members, by = "icpsr")



  
  
  
  