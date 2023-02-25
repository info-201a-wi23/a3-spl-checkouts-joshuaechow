library(dplyr)

checkouts_df <- read.csv("C:/Users/hello/Downloads/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

most_checked_out_year <- checkouts_df %>% group_by(CheckoutYear) %>% summarize(Checkouts = sum(Checkouts)) %>% filter(Checkouts == max(Checkouts)) %>% pull(CheckoutYear)
least_checked_out_year <- checkouts_df %>% group_by(CheckoutYear) %>% summarize(Checkouts = sum(Checkouts)) %>% filter(Checkouts == min(Checkouts)) %>% pull(CheckoutYear)
most_checked_out_type <- checkouts_df %>% group_by(MaterialType) %>% summarize(Checkouts = sum(Checkouts)) %>% filter(Checkouts == max(Checkouts)) %>% pull(MaterialType)
digital_v_physical_more <- checkouts_df %>% group_by(UsageClass) %>% summarize(Checkouts = sum(Checkouts)) %>% filter(Checkouts == max(Checkouts)) %>% pull(UsageClass)
digital_v_physical_less <- checkouts_df %>% group_by(UsageClass) %>% summarize(Checkouts = sum(Checkouts)) %>% filter(Checkouts == min(Checkouts)) %>% pull(UsageClass)
highest_checkout <- checkouts_df %>% filter(Checkouts == max(Checkouts)) %>% pull(Checkouts)
