library(dplyr)
library(ggplot2)

checkouts_df <- read.csv("C:/Users/hello/Downloads/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

test <- checkouts_df %>% filter(MaterialType == "MUSIC") %>% group_by(Subjects, CheckoutYear, CheckoutMonth) %>% summarize(Checkouts = sum(Checkouts)) %>% filter(nchar(Subjects) > 2 & nchar(Subjects) < 25 & Subjects %in% c("Pop", "Rock", "Soundtrack", "Hip-Hop/Rap", "Alternative"))

ggplot(data = test) +
  xlab("Year") + ggtitle("Music Checkouts by Genre") +
  geom_line(mapping = aes(x = (CheckoutYear + (CheckoutMonth/12)), y = Checkouts, color = Subjects))

