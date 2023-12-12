#setwd("H:/SAD/Projekt/Medycyna")
#install.packages("readxl")
#install.packages("dplyr")

library("readxl")
library("dplyr")
library("corrplot")

data <- read_excel("dane_obrobione.xlsx")
data <- data.frame(data)
rownames(data) = data$Wojewodztwo
colnames(data) <- c("wojewodztwo","lekarze","pielegniarki","apteki","zgony_ogolem","zgony_niemowlat","szpitale","lozka_liczba","szpitalne_oddzialy_ratunkowe",
                    "zespoly_ratownictwa","przystanki","ludnosc","przewozy","liczba_ludnosci_na_lozko","absolwenci","organizacje_ratownictwo",
                    "organizacje_ochrona_zdrowia","powierzchnia")
data <- select(data, -c("wojewodztwo"))
data1 <- select(data, -c("ludnosc","szpitale",
                        "powierzchnia","lozka_liczba",
                        "szpitalne_oddzialy_ratunkowe","przewozy",
                        "organizacje_ratownictwo",
                        "przystanki","zgony_niemowlat"))
#names <- colnames(data)
#print(names)
#colnames(data) <- c("lekarze")
cor <- cor(data)
corrplot(cor,method="number")

cor1 <- cor(data1)
corrplot(cor1,method="number")

means <- c()
std_deviations <- c()
for(i in 1:length(data1)){
  means <- c(means, mean(data1[[i]]))
  std_deviations <- c(std_deviations, sd(data1[[i]]))
}
wspolczynnik_zmiennosci <- std_deviations/means
wspolczynnik_zmiennosci <- data.frame(colnames(data1),wspolczynnik_zmiennosci)
colnames(wspolczynnik_zmiennosci) <- c("zmienna","wspolczynnik_zmiennosci")
