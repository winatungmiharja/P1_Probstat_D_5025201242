# ________________________________________________________________________________________________________________________________
# 2a

x <- 4
n <- 20
p <- 0.2
res <- dbinom(x,n,p,log = FALSE)
cat(sprintf("No 2.a -> %f", res))

# ________________________________________________________________________________________________________________________________
# 2b

library(dplyr)
library(ggplot2)

banyak_data <- 10

n <- 4
p <- 0.2
prob <- dbinom(x = 0:banyak_data, size = 20, p)

data.frame(x = 0:banyak_data, prob) %>%
    mutate(Failures = ifelse(x == n, "X = 4", "X lainnya")) %>%
    ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
    scale_fill_manual(values = c("#98d1d1","#cbd6e4")) +
    geom_col() +
    geom_text(
        aes(label = round(prob,2), y = prob + 0.01),
        position = position_dodge(0.9),
        size = 2,
        vjust = 0
    ) +
    labs(
        title = "Peluang X = 4 ",
        subtitle = "Histogram Distribusi Binomial",
        caption = "No 2.b Praktikum Probstat 1",
        x = "Pasien sembuh",
        y = "Probabilitas"
    ) 

# ________________________________________________________________________________________________________________________________
# 2c

n <- 20
p <- 0.2
cat(sprintf("No 2.c rataan -> %f", n*p))

cat(sprintf("No 2.c varian -> %f", n*p*(1-p)))
