df <- read.table("NEW_CogSciPersonalityTest2019.csv",header = TRUE,sep = ",")
library(dplyr)
library(pacman)
#filtering the dataframe by people with a shoe size above or equal to 39
df_shoesize39 <- filter(df, df$shoesize>=39)

#filtering the dataframe by people with shoe size who could touch the floor
df_touchfloor <- filter(df,df$touch_floor %in% c("Yes, of course!!","Yes"))

#Defined a new variable for the avrg. breath hold
average_breath <- mean(df$breath_hold)

#filtering the dataframe by people who could hold their breath longer than avrg.
df_largelungs <- filter(df,average_breath<df$breath_hold)   

#filtering the dataframe by people who could balance the ballon between 13&60 seconds
df_ballon <- filter(df,60>df$balloon_balance,13<df$balloon_balance)

#filtering the dataframe by people who fulfill all the conditions
df_allabove <- filter(df, 
                      df$shoesize>=39,
                      df$touch_floor %in% c("Yes, of course!!","Yes"),
                      average_breath<df$breath_hold,
                      60>df$balloon_balance,13<df$balloon_balance
)

#arranging the dataframe by speed of tongue twister
arranged_df_tongue <- arrange(df,df$tongue_twist)

#arranging the dataframe by first roomberg open, then romberg closed in desc order
arranged_df_romberg <- arrange(df,desc(df$romberg_open),desc(df$romberg_closed))
