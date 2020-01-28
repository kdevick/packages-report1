1:10
sum(1:10)

1:10 %>% sum()

trees %>% 
  mutate(volplus = Volume + 1) %>%
  mutate(heightgroup = as.numeric(Height >= 75)) %>%
  #filter(Height >= 70) %>%
  arrange(desc(Girth)) %>%
  group_by(heightgroup) %>% 
  summarize(avevol = mean(Volume))


trees %>% 
  select(Girth, Height)
