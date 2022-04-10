# ________________________________________________________________________________________________________________________________
# 1a
x <- 3
p <- 0.2
res <- dgeom(x,p,log = FALSE)
cat(sprintf("No 1.a -> %f", res))

# ________________________________________________________________________________________________________________________________
# 1b

# agar hasil dapat di re-produce
set.seed(0) 

n <- 10000
p <- 0.2
x <- 3
res <- mean(rgeom(n,p) == x)
cat(sprintf("No 1.b -> %f", res))

# ________________________________________________________________________________________________________________________________
# 1c
# Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
# Perbedaan pada hasil poin a dan poin b yaitu pada hasilnya. 
# Pada poin a, dilakukan distribusi geometrik yang tetap sehingga hasilnya selalu akan bernilai sama
# sedangkan pada poin b, distribusi geometrik dilakukan secara acak sehingga hasilnya akan berbeda-beda setiap kali di-run

# ________________________________________________________________________________________________________________________________
# 1d

library(dplyr)
library(ggplot2)

banyak_data <- 10

p <- 0.2
n <- 3
prob <- dgeom(x = 0:banyak_data, p)


data.frame(x = 0:banyak_data, prob) %>%
  mutate(Failures = ifelse(x == n, "X = 3", "X lainnya")) %>%
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
    title = "Peluang X = 3 ",
    subtitle = "Histogram Distribusi Geometrik",
    caption = "No 1.d Praktikum Probstat 1",
    x = "Kegagalan Sebelum Sukses Pertama",
    y = "Probabilitas"
  ) 

# ________________________________________________________________________________________________________________________________
# 1e

p <- 0.2
n <- 3
cat(sprintf("No 1.e rataan -> %f", n/p))

cat(sprintf("No 1.e varian -> %f", (n-p)/("^"(p, 2))))