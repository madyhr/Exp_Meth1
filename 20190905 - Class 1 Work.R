box<-9
box2<-"car"
boxes<-c(rep(1:4))
boxes[1]<-boxes[1]+3
a_vector<-c("Thea","Kevan","Andreas","Cecilie","Søren")
vector_sibling <- c(0,2,2,1,1)
a_vector+2;vector_sibling+2
class(a_vector);class(vector_sibling)

sum(vector_sibling)
vector_sibling[1]*vector_sibling[2]


partnerface_m <- c(69,76,70,76,72,65,82,71,71,75,52,34)
ownface_m <- c(33,26,10,51,34,28,27,9,33,11,14,46)
partnerface_f <- c(70,74,64,43,51,93,48,51,74,73,41,84)
ownface_f <- c(97,80,88,100,100,58,95,83,97,89,69,82)
gender <- gl(2, 12, labels =c("Male","Female"))
maledata <- data.frame(Partner_Face = partnerface_m, Own_Face = ownface_m)
femaledata <- data.frame(Partner_Face2 = partnerface_f, Own_Face2 = ownface_f)
alex3 <- data.frame(Gender = gender, maledata, femaledata)

partnerface_comb <- c(69,76,70,76,72,65,82,71,71,75,52,34,70,74,64,43,51,93,48,51,74,73,41,84)
ownface_comb <- c(70,74,64,43,51,93,48,51,74,73,41,84,97,80,88,100,100,58,95,83,97,89,69,82)
alex3_1 <- data.frame(Gender = gender, Partner_Face = partnerface_comb, Own_Face = ownface_comb)
rm(z)
mean(alex3_1$Partner_Face)
plot(alex3_1$Partner_Face, alex3_1$Own_Face)
lmexample <- data.frame(x = partnerface_comb, y = ownface_comb)
scatter.smooth(x=lmexample$x, y=lmexample$y)
lm(x ~ y, data=lmexample)

