library(tidyverse)

## calc sum of integers 1 through 10 in base R
sum(1:10)

## the pipe feeds in the object on the very left (normally a dataset) as the first element in the functions listed on the right
## you can see this using sum
1:10 %>% sum
## this is the same as using the () at the end 
1:10 %>% sum()


trees %>% 
  ## create new variable volplus that is the volume plus one
  mutate(volplus = Volume + 1) %>%
  ## create another new variables that is 1 if the height is greater than or equal to 75 and 0 otherwise
  mutate(heightgroup = as.numeric(Height >= 75)) %>%
  ## use this if you only want to do this calculate among trees with height >= 70
  #filter(Height >= 70) %>%
  ## sort the dataset in descending order by girth value
  arrange(desc(Girth)) %>%
  ## group by height group
  group_by(heightgroup) %>%
  ## by height group by calculate mean 
  summarize(avevol = mean(Volume))
  ## if i wanted to do more after not by groups, then I would need to use group_ungroup()


trees %>% 
  ## only select columens Girth and Height
  select(Girth, Height)


trees %>% 
  ## create new heightgroup variable, 1 for trees >= 75, 0 otherwise
  mutate(heightgroup = as.numeric(Height >= 75)) %>%
  ## count the numner is each group
  count(heightgroup) %>%
  ## use the n column created by heightgroup and calc proportions with this column
  mutate(prop = n / sum(n))