# WHAT DOES THIS SCRIPT DO?
#Creates variables year_elected and member_reelected

# source("setup.R")


#load data
load(here::here("data/all_contacts.RData"))
load(here::here("data/members.Rdata"))
load(here::here("data/committees.Rdata"))


 #creates elected that selected yearelected and icpsr
elected <- committees %>% dplyr::select(yearelected, icpsr) %>% 
  group_by(icpsr) %>% 
  #mutate(years_elected = str_c(yearelected, collapse = ";")) %>% 
  slice_min(yearelected)%>% # ungroup() %>% select(yearelected) %>% 
  ungroup() %>%
  distinct()

#creates variable congresses
members %<>%
  mutate(congress = as.character(congress))%>%
  group_by(bioname) %>%
  mutate(congresses_n = length(unique(congress)),
         congresses = str_c(congress, collapse = ";")) %>%
  arrange(-congresses_n) %>%
  #select(-congress) %>%
  ungroup() %>%
  distinct() # %>% select(congress, congresses_n, congresses, bioname)


#join elected with members data
members %<>% left_join(elected %>% distinct()) %>% distinct()

sum(members$icpsr %in% elected$icpsr)

# members %<>%
#   mutate(elected106 = ifelse(str_detect(congresses, "105") & str_detect(congresses, "106"), 1, 0))%>%
#   mutate(elected107 = ifelse(str_detect(congresses, "106") & str_detect(congresses, "107"), 1, 0))%>%
#   mutate(elected108 = ifelse(str_detect(congresses, "107") & str_detect(congresses, "108"), 1, 0))%>%
#   mutate(elected109 = ifelse(str_detect(congresses, "108") & str_detect(congresses, "109"), 1, 0))%>%
#   mutate(elected110 = ifelse(str_detect(congresses, "109") & str_detect(congresses, "110"), 1, 0))%>%
#   mutate(elected111 = ifelse(str_detect(congresses, "110") & str_detect(congresses, "111"), 1, 0))%>%
#   mutate(elected112 = ifelse(str_detect(congresses, "111") & str_detect(congresses, "112"), 1, 0))%>%
#   mutate(elected113 = ifelse(str_detect(congresses, "112") & str_detect(congresses, "113"), 1, 0))%>%
#   mutate(elected114 = ifelse(str_detect(congresses, "113") & str_detect(congresses, "114"), 1, 0))%>%
#   mutate(elected115 = ifelse(str_detect(congresses, "114") & str_detect(congresses, "115"), 1, 0))%>%
#   mutate(elected116 = ifelse(str_detect(congresses, "115") & str_detect(congresses, "116"), 1, 0))

#create variable reelected
#checks if member shows up in the following congress
members %<>% 
  group_by(bioname) %>%
  mutate(member_reelected = str_detect(congresses, as.character(as.numeric(congress) + 1))) %>% 
  mutate(member_reelected = ifelse(congress == 116, NA, member_reelected)) %>% #current congress
  ungroup()

#members %>% filter(!member_reelected)
  
#check variable class
class(members$icpsr)
class(members$member_reelected)
class(members$yearelected)
class(members$congress)
class(all_contacts$congress)

members$congress %<>%
  as.numeric()

#Creates count of reelections
# 0 if not reelected at all
members %<>%
  group_by(icpsr) %>%
  mutate(reelections = length(unique(congress)-1)) %>%
  ungroup()


members %<>%
 dplyr::select(reelections, everything())

nrow(all_contacts)



#merge data
#Two different year_elected
data <- left_join(all_contacts, 
              members %>% dplyr::select(member_reelected, icpsr, bioname, congress, chamber, reelections)
              )#, by = "icpsr")

nrow(data)


