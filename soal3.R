# ________________________________________________________________________________________________________________________________
# 3a

x <- 6
lambda <- 4.5
res <- dpois(x,lambda,log = FALSE)
cat(sprintf("No 3.a -> %f", res))


# ________________________________________________________________________________________________________________________________
# 3b

library(dplyr)
library(ggplot2)

banyak_data <- 10

n <- 365
lambda <- 4.5


data.frame('data' = rpois(n, lambda)) %>% 
  ggplot() +
  geom_histogram(
    aes(
      x=data, 
      y=stat(count/sum(count)), 
      fill = ifelse(data == 6, "X = 6", "X lainnya"),
    ), 
    binwidth = 1, 
    color = 'black',
  ) +
  scale_fill_manual(values = c("#98d1d1","#cbd6e4")) +
  scale_x_continuous(breaks = 0:banyak_data) +
  labs(
    title = "Simulasi peluang X = 6 selama setahun",
    subtitle = "Histogram Distribusi Poisson",
    caption = "No 3.b Praktikum Probstat 1",
    x = "Bayi lahir per/hari",
    y = "Probabilitas"
  ) 


# ________________________________________________________________________________________________________________________________
# 3c

# Hasil yang didapatkan dari perhitungan di poin A dan poin B tergolong hasil yang saling berkolerasi. hal ini disebabkan
# karena perhitungan poin b berupa estimasi selama 365 hari menujukkan hasil yaitu diantara 0.10-0.15, sedangkan pada poin a menujukkan hasil 0.128120

# dari kedua nilai ini dapat disimpulkan bahwa estimasi peluang kelahiran 6 bayi perhari untuk hari esok akan tidak beda jauh dengan peluang kelahiran 6 bayi dalam setahunnya

# ________________________________________________________________________________________________________________________________
# 3d

lambda <- 4.5
cat(sprintf("No 3.d rataan -> %f", lambda))

cat(sprintf("No 3.d varian -> %f", lambda))
