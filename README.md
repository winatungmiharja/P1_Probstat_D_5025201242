# P1_Probstat_D_5025201242

Praktikum 1 Probabilitas dan Statistik 2022

```
Nama    : Wina Tungmiharja
NRP     : 5025201242
Kelas   : Probstat D
```

## Soal 1

Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan
seseorang yang menghadiri acara vaksinasi sebelumnya.

### 1.a

Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi
sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ?
(distribusi Geometrik)

```
x <- 3
p <- 0.2
res <- dgeom(x,p,log = FALSE)
cat(sprintf("No 1.a -> %f", res))
```

disini kita menggunakan fungsi `dgeom` yang akan mengembalikan nilai dari probabilitas distribusi geometrik
x menunjukkan banyaknya kegagalan sebelum kesuksesan pertama dan `p` menunnjukkan besarnya probabilitas

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162614859-107ec7ff-6627-4438-9e2a-fb919269fc74.png"><img src="https://user-images.githubusercontent.com/64743796/162614859-107ec7ff-6627-4438-9e2a-fb919269fc74.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162614859-107ec7ff-6627-4438-9e2a-fb919269fc74.png">(lihat resolusi penuh)</a> |

### soal 1.b

mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi
geometrik acak tersebut `X = 3` ( distribusi geometrik acak () == 3 )

```
# agar hasil dapat di re-produce
set.seed(0)

n <- 10000
p <- 0.2
x <- 3
res <- mean(rgeom(n,p) == x)
cat(sprintf("No 1.b -> %f", res))
```

disini kita menggunakan fungsi `rgeom` yang akan melakukan _generate_ vector dari distribusi geometri nilai acak

|                                                                                                                                                                                                     **Dengan seed**                                                                                                                                                                                                      |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162614880-0a7d4d2e-8a34-40b7-93f5-dd21acf0d26c.png"><img src="https://user-images.githubusercontent.com/64743796/162614880-0a7d4d2e-8a34-40b7-93f5-dd21acf0d26c.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162614880-0a7d4d2e-8a34-40b7-93f5-dd21acf0d26c.png">(lihat resolusi penuh)</a> |

|                                                                                                                                                                                                      **Tanpa seed**                                                                                                                                                                                                      |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162614898-fcbc75cc-9d74-48b4-9eda-be3c778da84a.png"><img src="https://user-images.githubusercontent.com/64743796/162614898-fcbc75cc-9d74-48b4-9eda-be3c778da84a.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162614898-fcbc75cc-9d74-48b4-9eda-be3c778da84a.png">(lihat resolusi penuh)</a> |

dapat dilihat, jika kita tidak menggunakan `set.seed()` maka _generation_ dari hasil distribusi geometri bernilai acak dan berbeda setiap kali program dijalankan

### soal 1.c

Bandingkan Hasil poin `a` dan `b` , apa kesimpulan yang bisa didapatkan?

jawab :
Perbedaan pada hasil poin a dan poin b yaitu pada **hasilnya**.

- Pada poin a, dilakukan distribusi geometrik yang tetap sehingga hasilnya selalu akan bernilai sama
- sedangkan pada poin b, distribusi geometrik dilakukan secara acak sehingga hasilnya akan berbeda-beda setiap kali di-run

### soal 1.d

Histogram Distribusi Geometrik , Peluang `X = 3` gagal Sebelum Sukses Pertama

```
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

```

disini kita menggunakan _library_ external yaitu `dplyr` dan `ggplot2` untuk melakukan penggambaran histogram dari nilai probabilitas distribusi geometrik dan diberikan fungsi `mutate` untuk mengubah dan mengakses nilai pada data tersebut

|                                                                                                                                                                                                   **Hasil Histogram**                                                                                                                                                                                                    |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162615048-88bd5857-fe77-48b5-bd96-f72cde99aac0.png"><img src="https://user-images.githubusercontent.com/64743796/162615048-88bd5857-fe77-48b5-bd96-f72cde99aac0.png" alt="Device View" width="600"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162615048-88bd5857-fe77-48b5-bd96-f72cde99aac0.png">(lihat resolusi penuh)</a> |

### soal 1.e

Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.

```
p <- 0.2
n <- 3
cat(sprintf("No 1.e rataan -> %f", n/p))
cat(sprintf("No 1.e varian -> %f", (n-p)/("^"(p, 2))))
```

disini hasil kode didapatkan dari rumus

- Nilai Rataan (μ) : `n/p`
- Varian (σ²) : `(n-p)/p²`

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162615103-d316ed47-bb2f-45a5-95c7-f19d92de5c38.png"><img src="https://user-images.githubusercontent.com/64743796/162615103-d316ed47-bb2f-45a5-95c7-f19d92de5c38.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162615103-d316ed47-bb2f-45a5-95c7-f19d92de5c38.png">(lihat resolusi penuh)</a> |

## Soal 2

Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :

### 2.a

Peluang terdapat 4 pasien yang sembuh

```
x <- 4
n <- 20
p <- 0.2
res <- dbinom(x,n,p,log = FALSE)
cat(sprintf("No 2.a -> %f", res))
```

disini kita menggunakan fungsi `dbinom` untuk menghitung nilai fungsi probabilitas distirbusi binomial, dimana
`x` adalah banyaknya kejadian sukses yang diinginkan, `n` adalah banyaknya percobaan, dan `p` adalah nilai probabilitas

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162615617-5a55db67-bb22-4b11-829e-7ab1a03e2b2d.png"><img src="https://user-images.githubusercontent.com/64743796/162615617-5a55db67-bb22-4b11-829e-7ab1a03e2b2d.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162615617-5a55db67-bb22-4b11-829e-7ab1a03e2b2d.png">(lihat resolusi penuh)</a> |

### 2.b

Gambarkan grafik histogram berdasarkan kasus tersebut.

```
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
```

disini kita menggunakan _library_ external yaitu `dplyr` dan `ggplot2` untuk melakukan penggambaran histogram dari nilai probabilitas distribusi binomial dan diberikan fungsi `mutate` untuk mengubah dan mengakses nilai pada data tersebut

|                                                                                                                                                                                                   **Hasil Histogram**                                                                                                                                                                                                    |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162615708-30b53b67-e17b-4ef3-b58a-5bad73aa3d20.png"><img src="https://user-images.githubusercontent.com/64743796/162615708-30b53b67-e17b-4ef3-b58a-5bad73aa3d20.png" alt="Device View" width="600"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162615708-30b53b67-e17b-4ef3-b58a-5bad73aa3d20.png">(lihat resolusi penuh)</a> |

### 2.c

Nilai Rataan (μ) dan Varian (σ²) dari DistribusiBinomial.

```
n <- 20
p <- 0.2
cat(sprintf("No 1.c rataan -> %f", n*p))
cat(sprintf("No 1.c varian -> %f", n*p*(1-p)))
```

disini hasil kode didapatkan dari rumus

- Nilai Rataan (μ) : `n x p`
- Varian (σ²) : `μ x (1 - p)`

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162615725-3ca3f616-0150-45f8-af23-b4ef06edb768.png"><img src="https://user-images.githubusercontent.com/64743796/162615725-3ca3f616-0150-45f8-af23-b4ef06edb768.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162615725-3ca3f616-0150-45f8-af23-b4ef06edb768.png">(lihat resolusi penuh)</a> |

## Soal 3

Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis
4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

### 3.a

Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?

```
x <- 6
lambda <- 4.5
res <- dpois(x,lambda,log = FALSE)
cat(sprintf("No 3.a -> %f", res))
```

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162617378-65ce2757-7ee5-4350-95aa-b09084f8b7c0.png"><img src="https://user-images.githubusercontent.com/64743796/162617378-65ce2757-7ee5-4350-95aa-b09084f8b7c0.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162617378-65ce2757-7ee5-4350-95aa-b09084f8b7c0.png">(lihat resolusi penuh)</a> |

disini kite menggunakan fungsi `dpois` yang mengembalikan nilai fungsi Distribusi Probabilitas Poisson yang mana `x` menujukkan banyaknya kesuksesan, `lambda` menujukkan rata-rata terjadinya kesuksesan

### 3.b

Simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama
setahun `(n = 365)`

```
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
```

disini kita menggunakan _library_ external yaitu `dplyr` dan `ggplot2` untuk melakukan penggambaran histogram dari nilai probabilitas distribusi poisson dan diberikan fungsi `mutate` untuk mengubah dan mengakses nilai pada data tersebut

kita juga menggunakan 'data' dari fungsi `rpois()` dimana fungsi ini melakukan generasi nilai variabel acak yang mengikuti distribusi Poisson dengan nilai rata rata kesuksesan yang telah ditentukan

|                                                                                                                                                                                                   **Hasil Histogram**                                                                                                                                                                                                    |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162617242-3f8febf8-33a9-4dd2-b06a-e2fcb451cec5.png"><img src="https://user-images.githubusercontent.com/64743796/162617242-3f8febf8-33a9-4dd2-b06a-e2fcb451cec5.png" alt="Device View" width="600"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162617242-3f8febf8-33a9-4dd2-b06a-e2fcb451cec5.png">(lihat resolusi penuh)</a> |

### 3.c

Bandingkan hasil poin `a` dan `b` , Apa kesimpulan yang bisa didapatkan

jawab :
Hasil yang didapatkan dari perhitungan di poin A dan poin B tergolong hasil yang saling berkolerasi. hal ini disebabkan
karena

- perhitungan poin b berupa estimasi selama 365 hari menujukkan hasil yaitu diantara 0.10-0.15,
- sedangkan pada poin a menujukkan hasil 0.128120

dari kedua nilai ini dapat disimpulkan bahwa estimasi
_peluang kelahiran 6 bayi perhari untuk hari esok akan tidak beda jauh dengan peluang kelahiran 6 bayi dalam setahunnya_

### 3.d

Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.

```
lambda <- 4.5
cat(sprintf("No 3.d rataan -> %f", lambda))
cat(sprintf("No 3.d varian -> %f", lambda))
```

disini hasil kode didapatkan dari rumus

- Nilai Rataan (μ) : `λ`
- Varian (σ²) : `λ`

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162617353-604916ea-e989-4a60-8205-035aabe624cf.png"><img src="https://user-images.githubusercontent.com/64743796/162617353-604916ea-e989-4a60-8205-035aabe624cf.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162617353-604916ea-e989-4a60-8205-035aabe624cf.png">(lihat resolusi penuh)</a> |

## Soal 4

Diketahui nilai x = 2 dan v = 10. Tentukan:

### 4.a

Fungsi Probabilitas dari Distribusi Chi-Square.

```
x <- 2
df <- 10
res <- dchisq(x,df,0,log = FALSE)
cat(sprintf("No 3.a -> %f", res))
```

disini kita menggunakan fungsi `dchisq` untuk melakukan perhitungan yang mengembalikan nilai dari Sitribusi probabilitas Chi-square

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162618872-76d4af8e-c60c-4f59-8f14-550159369c52.png"><img src="https://user-images.githubusercontent.com/64743796/162618872-76d4af8e-c60c-4f59-8f14-550159369c52.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162618872-76d4af8e-c60c-4f59-8f14-550159369c52.png">(lihat resolusi penuh)</a> |

### 4.b

Histogram dari Distribusi Chi-Square dengan 100 data random.

```
n <- 100
df <- 10

hist(
  rchisq(n, df),
  col = "#98d1d1",
)
```

|                                                                                                                                                                                                   **Hasil Histogram**                                                                                                                                                                                                    |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162618901-68536129-7f85-4898-9267-32c52681648c.png"><img src="https://user-images.githubusercontent.com/64743796/162618901-68536129-7f85-4898-9267-32c52681648c.png" alt="Device View" width="600"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162618901-68536129-7f85-4898-9267-32c52681648c.png">(lihat resolusi penuh)</a> |

### 4.c

Nilai Rataan (μ) dan Varian (σ²) dari DistribusiChi-Square.

```
df <- 10
cat(sprintf("No 4.c rataan -> %f", df))
cat(sprintf("No 4.c varian -> %f", 2 * df))
```

disini hasil kode didapatkan dari rumus

- Nilai Rataan (μ) : `df`
- Varian (σ²) : `df`

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162618942-0ea39c85-085c-473c-94f8-2dcf4abba321.png"><img src="https://user-images.githubusercontent.com/64743796/162618942-0ea39c85-085c-473c-94f8-2dcf4abba321.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162618942-0ea39c85-085c-473c-94f8-2dcf4abba321.png">(lihat resolusi penuh)</a> |

## Soal 5

Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan

### 5.a

Fungsi Probabilitas dari Distribusi Exponensial

```
lambda <- 3
set.seed(1)
res <- rexp(lambda)
print(res)
```

disini kita menggunakan fungsi `rexp` untuk melakukan generasi data yang mengikuti Distribusi eksponensial

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162619321-932deff8-3cc9-44b9-847b-4d328a237ba1.png"><img src="https://user-images.githubusercontent.com/64743796/162619321-932deff8-3cc9-44b9-847b-4d328a237ba1.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162619321-932deff8-3cc9-44b9-847b-4d328a237ba1.png">(lihat resolusi penuh)</a> |

### 5.b

Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random

```
hist(rexp(10))
hist(rexp(100))
hist(rexp(1000))
hist(rexp(10000))
```

|                                                                                                                                                                                           **Hasil output rexp(10)**                                                                                                                                                                                           |                                                                                                                                                                                          **Hasil output rexp(100)**                                                                                                                                                                                           |                                                                                                                                                                                          **Hasil output rexp(1000)**                                                                                                                                                                                          |                                                                                                                                                                                         **Hasil output rexp(10000)**                                                                                                                                                                                          |
| :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162619359-c5c0b698-eb0a-4d03-bd2c-3d78821727ef.png"><img src="https://user-images.githubusercontent.com/64743796/162619359-c5c0b698-eb0a-4d03-bd2c-3d78821727ef.png" alt="Device View" ></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162619359-c5c0b698-eb0a-4d03-bd2c-3d78821727ef.png">(lihat resolusi penuh)</a> | <a href="https://user-images.githubusercontent.com/64743796/162619370-fb922490-55ee-429d-8f1a-dcaf28b974da.png"><img src="https://user-images.githubusercontent.com/64743796/162619370-fb922490-55ee-429d-8f1a-dcaf28b974da.png" alt="Device View" ></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162619370-fb922490-55ee-429d-8f1a-dcaf28b974da.png">(lihat resolusi penuh)</a> | <a href="https://user-images.githubusercontent.com/64743796/162619385-81c7d7af-8032-4529-9368-c1ae51083456.png"><img src="https://user-images.githubusercontent.com/64743796/162619385-81c7d7af-8032-4529-9368-c1ae51083456.png" alt="Device View" ></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162619385-81c7d7af-8032-4529-9368-c1ae51083456.png">(lihat resolusi penuh)</a> | <a href="https://user-images.githubusercontent.com/64743796/162619392-76a066d3-f992-4c29-a4c5-d96797cbd2f6.png"><img src="https://user-images.githubusercontent.com/64743796/162619392-76a066d3-f992-4c29-a4c5-d96797cbd2f6.png" alt="Device View" ></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162619392-76a066d3-f992-4c29-a4c5-d96797cbd2f6.png">(lihat resolusi penuh)</a> |
|                                                                                                                                                                                                      :-:                                                                                                                                                                                                      |                                                                                                                                                                                                      :-:                                                                                                                                                                                                      |                                                                                                                                                                                                      :-:                                                                                                                                                                                                      |                                                                                                                                                                                                      :-:                                                                                                                                                                                                      |

### 5.c

Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3

```
lambda <- 3
cat(sprintf("No 5.c rataan -> %f", 1/lambda))
cat(sprintf("No 5.c varian -> %f", 1/("^"(lambda, 2))))
```

disini hasil kode didapatkan dari rumus

- Nilai Rataan (μ) : `λ`
- Varian (σ²) : `1/λ²`

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162619420-e100f94b-7882-4dbf-b93e-8beb3bba3ec6.png"><img src="https://user-images.githubusercontent.com/64743796/162619420-e100f94b-7882-4dbf-b93e-8beb3bba3ec6.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162619420-e100f94b-7882-4dbf-b93e-8beb3bba3ec6.png">(lihat resolusi penuh)</a> |

## Soal 6

Diketahui generate random nilai sebanyak `100 data`, `mean = 50`, `sd = 8`. Tentukan

### 6.a

Fungsi Probabilitas dari Distribusi Normal `P(X1 ≤ x ≤ X2)`, hitung Z-Score Nya dan plot
data generate randomnya dalam bentuk grafik.

hitung Z-Score Nya dan plot
data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).

```
n <- 100
mean <- 50
sd <- 8
# generate random nilai
res <- rnorm(n,mean,sd)

# generate z-score
z <- (res - mean(res)) / sd(res)
print(z)

plot(res)
```

Disini kita menggunakan fungsi `rnorm()` untuk melakukan generasi data yang mengikuti Distribusi normal. disini kita juga melakukan perhitungan `z-score` dimana disapatkan dengan rumus

`z-score` = `nilai random` - `rata-rata` / `σ`

|                                                                                                                                                                                                    **Hasil Z-score**                                                                                                                                                                                                     |                                                                                                                                                                                                      **Hasil Plot**                                                                                                                                                                                                      |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162623242-95bb23ce-e34f-4d3b-9707-8e9064fd4b71.png"><img src="https://user-images.githubusercontent.com/64743796/162623242-95bb23ce-e34f-4d3b-9707-8e9064fd4b71.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162623242-95bb23ce-e34f-4d3b-9707-8e9064fd4b71.png">(lihat resolusi penuh)</a> | <a href="https://user-images.githubusercontent.com/64743796/162623373-ad202892-ce7c-422f-b8a1-50310bd9fc45.png"><img src="https://user-images.githubusercontent.com/64743796/162623373-ad202892-ce7c-422f-b8a1-50310bd9fc45.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162623373-ad202892-ce7c-422f-b8a1-50310bd9fc45.png">(lihat resolusi penuh)</a> |
|                                                                                                                                                                                                           :-:                                                                                                                                                                                                            |                                                                                                                                                                                                           :-:                                                                                                                                                                                                            |

### 6.b

Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan

```
n <- 100
mean <- 50
sd <- 8
hist(
  rnorm(n,mean,sd),
  breaks = 50,
  main = "5025201242_Wina Tungmiharja_Probstat_D_DNhistogram"
)

```

|                                                                                                                                                                                                   **Hasil Histogram**                                                                                                                                                                                                    |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162620121-9cbc0ac8-9070-4101-8d96-2f36ef84130c.png"><img src="https://user-images.githubusercontent.com/64743796/162620121-9cbc0ac8-9070-4101-8d96-2f36ef84130c.png" alt="Device View" width="600"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162620121-9cbc0ac8-9070-4101-8d96-2f36ef84130c.png">(lihat resolusi penuh)</a> |

### 6.c

Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.

```
sd <- 8
cat(sprintf("No 6.c varian -> %f", ("^"(sd, 2))))
```

disini hasil kode didapatkan dari rumus

- Varian (σ²) : `σ²`

|                                                                                                                                                                                                     **Hasil output**                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| <a href="https://user-images.githubusercontent.com/64743796/162620140-0e68bf35-521a-4a96-820a-5d4b9aedc6d6.png"><img src="https://user-images.githubusercontent.com/64743796/162620140-0e68bf35-521a-4a96-820a-5d4b9aedc6d6.png" alt="Device View" width="300"></a><br /><sup><a href="https://user-images.githubusercontent.com/64743796/162620140-0e68bf35-521a-4a96-820a-5d4b9aedc6d6.png">(lihat resolusi penuh)</a> |
