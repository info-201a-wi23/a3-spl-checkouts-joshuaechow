library(dplyr)
library(ggplot2)

checkouts_df <- read.csv("C:/Users/hello/Downloads/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

graph_data <- checkouts_df %>% group_by(Creator, CheckoutMonth, CheckoutYear) %>% filter(Creator %in% c("J.R.R. Tolkien", "C. S. Lewis")) %>% summarize(Checkouts = sum(Checkouts))

ggplot(data = graph_data) +
  xlab("Year") + ggtitle("Tolkien versus Lewis") +
  geom_line(mapping = aes(x = (CheckoutYear + (CheckoutMonth/12)), y = Checkouts, color = Creator))

