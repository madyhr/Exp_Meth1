#defining a dataframe with the data from the test
df <- read.table("NEW_CogSciPersonalityTest2019.csv",header = TRUE,sep = ",")

#loading the necessary libraries
library(dplyr)
library(pacman)

#filtering the dataframe by people with a shoe size above or equal to 39
df_shoesize39 <- filter(df, df$shoesize >= 39)

#filtering the dataframe by people with shoe size who could touch the floor
df_touchfloor <- filter(df,df$touch_floor %in% c("Yes, of course!!","Yes"))

#defined a new variable for the avrg. breath hold
average_breath <- mean(df$breath_hold)

#filtering the dataframe by people who could hold their breath longer than avrg.
df_largelungs <- filter(df,average_breath < df$breath_hold)   

#filtering the dataframe by people who could balance the ballon between 13&60 seconds
df_ballon <- filter(df,60 > df$balloon_balance,13 < df$balloon_balance)

#filtering the dataframe by people who fulfill all the conditions
df_allabove <- filter(df, 
                      df$shoesize >= 39,
                      df$touch_floor %in% c("Yes, of course!!","Yes"),
                      average_breath < df$breath_hold,
                      60 > df$balloon_balance,13 < df$balloon_balance
)

#arranging the dataframe by speed of tongue twister
arranged_df_tongue <- arrange(df,df$tongue_twist)

#arranging the dataframe by first roomberg open, then romberg closed in desc order
arranged_df_romberg <- arrange(df,desc(df$romberg_open),desc(df$romberg_closed))

#selecting the same coloumn name multiple times only includes the first
sel_df_ng <- select(df,name,name)

#defining a vector of coloumn names and selecting a dataframe with those parameters
vars = c("name","shoesize","touch_floor")
sel_df_vars <- select(df,vars)

#selecting the dataframe with gender and shoesize first
sel_df_every <- select(df,gender,shoesize,everything(df))

#defining a new coloumn to the existing df using existing coloumns with mutate
df <- mutate(df,words_per_sec = 99 / tongue_twist)

#defining a new coloumn with the rounded down number of number of minutes
df <- mutate(df,breath_min = breath_hold %/% 60)

#defining a new coloumn with the remainder of breath hold in sec
df <- mutate(df,breath_sec = breath_hold %% 60)

#Defining new object as mean_wps and creating new coloumn as difference between mean
mean_wps <- mean(df$words_per_sec)
df <- mutate(df, diff_avrg_wps = df$words_per_sec - mean_wps)

#using pipes and summarise to create a new df with only gender and mean of b_b
gender_balloon <- df %>% group_by(gender) %>% summarise(mean(balloon_balance))

#using pipes and summarise to create a new df with only cola_pref and mean of sound_level
cola_sound <- df %>% group_by(taste_cola) %>% summarise(mean(sound_level_pref))

#using n() to count incidents of certain handedness in a summarise function
hand_tongue <- df %>% group_by(handedness) %>% summarise(mean(tongue_twist),n())