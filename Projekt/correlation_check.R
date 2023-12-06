#setwd("H:/SAD/Projekt/Medycyna")
#install.packages("readxl")
#install.packages("dplyr")

library("readxl")
library("dplyr")

data <- read_excel("dane_obrobione.xlsx")
data <- data.frame(data)
rownames(data) = data$Wojewodztwo
data <- select(data, -c("Wojewodztwo","ludnosc..tys.osob.","szpitale..liczba.",
                        "powierzchnia..km2.","lozka.w.szpitalach..liczba.",
                        "szpitalne.oddzialy.ratunkowe..liczba.","przewozy.pasazerskie..mln.osob.",
                        "organizacje.non.profit.ratownictwo....",
                        "przystanki.komunikacji.miejskiej..liczba.",
                        "zgony.niemowlat.na.tys.urodzen.zywych..liczba.tys.urodzen.zywych."))
names <- colnames(data)
print(names)
colnames(data) <- c(1:length(data))
cor <- cor(data)

means <- c()
std_deviations <- c()
for(i in 1:length(data)){
  means <- c(means, mean(data[[i]]))
  std_deviations <- c(std_deviations, sd(data[[i]]))
}
wspolczynnik_zmiennosci <- std_deviations/means
wspolczynnik_zmiennosci
