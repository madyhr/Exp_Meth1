#Defining a vector with the names of people around me
names <- c("Kevan","Andreas","Thea","Cecilie")

#Defining a vector with a guess of amount of siblings
sib_guess <-  c(1,2,0,2)

#Testing out adding numbers to a vector with +
sib_guess_add <- sib_guess + 2

#Testing out the sum function sum()
sum_sibs <- sum(sib_guess)

#Testing out the product function *
product_ex <- sib_guess[1]*sib_guess[2]

#Defining a df with the vectors defined earlier
studygroup <- data.frame(Names = names, Siblings_Guess = sib_guess)

#Defining a new coloumn "Gender"
studygroup$Gender <- c("Male","Male","Female","Female")

#Defining a new vector with the "Marcus" values, and makings sure the class is chr
marcus_data <- c("Marcus",1,"Male")
studygroup$Names <- as.character(studygroup$Names)

#Defining a new row with the "Marcus" values, and making sure the class is num
studygroup <- rbind(studygroup,marcus_data)
studygroup$Siblings_Guess <- as.numeric(studygroup$Siblings_Guess)

#Finding the mean of the sib_guess values
mean_sib <- mean(studygroup$Siblings_Guess)

#Defining a new coloumn with the actual amount of siblings people have
sib_real <- c(1,4,2,1,1)
studygroup$Siblings_Real <- sib_real

#Defining sib_guess2 as sib_guess with an extra value, as sib_guess doesn't include "Marcus"
sib_guess2 <- c(sib_guess,1)

#Defining a sib_off vector with the absolute values 
#of the difference between guess and real
sib_off <- abs(sib_guess2-sib_real)

#Defining a new coloumn in df studygroup called Siblings_Off
studygroup$Siblings_Off <- sib_off

#Defining a new df with their name and gender as a subset of studygroup 
#with everyone with exactly 1 sibling
studygroup_onesib <- subset(studygroup,sib_real == 1, select = c("Names","Gender"))

#Defining a new df with their name and gender as a subset of studygroup
#with everyone where the guess is equal to the actual amount (i.e. sib_off == 0)
studygroup_correct <- subset(studygroup,sib_off == 0, select =c("Names","Gender"))