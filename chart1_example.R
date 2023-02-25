library(dplyr)
library(ggplot2)

checkouts_df <- read.csv("C:/Users/hello/Downloads/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

x_and_y_values <- checkouts_df %>% group_by(MaterialType, CheckoutYear) %>% filter(MaterialType %in% c("BOOK", "EBOOK", "AUDIOBOOK", "VIDEODISC", "SOUNDDISC")) %>% summarize(Checkouts = sum(Checkouts))  

ggplot(data = x_and_y_values) +
  xlab("Year") + ggtitle("Checkouts by Type") +
  geom_line(mapping = aes(x = CheckoutYear, y = Checkouts, color = MaterialType))

