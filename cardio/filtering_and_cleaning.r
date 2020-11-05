database <- read.csv('/home/geovaniggr/dev/mqa-work/cardio/cardio_train.csv', sep = ';')

head(database)

library(dplyr)


# cleaning database
first_clean <- database %>% filter(ap_hi > ap_lo)
height_cleaned <- first_clean %>% filter(height >= 140 & height <= 220)
weight_cleaned <- height_cleaned %>% filter(weight >= 30 )
systolic_cleaned <- weight_cleaned %>% filter(ap_lo >= 30 & ap_lo <= 170)

fully_cleaned <- systolic_cleaned %>% filter(ap_hi >= 70 & ap_hi < 250)

head(fully_cleaned)

summary(fully_cleaned)

cols = c("gender", "cholesterol", "gluc", "smoke", "alco", "active", "cardio")

fully_cleaned[cols] = lapply(fully_cleaned[cols], factor)

summary(fully_cleaned)

nrow(fully_cleaned)

data <- slice_sample(fully_cleaned, n = 5000)


summary(fully_cleaned)
summary(data)

mean(fully_cleaned$height)
mean(data$height)

mean(fully_cleaned$weight)
mean(data$weight)

mean(fully_cleaned$ap_hi)
mean(data$ap_hi)

mean(fully_cleaned$ap_lo)
mean(data$ap_lo)

nrow(fully_cleaned %>% filter(alco == 1))
nrow(data %>% filter(alco == 1))

summary(fully_cleaned$weight)
summary(data$weight)

boxplot(fully_cleaned$height)
boxplot(data$height)


pacientes_fumantes <- fully_cleaned %>% filter(smoke == 1)
pacientes_nao_fumantes <- fully_cleaned %>% filter(smoke == 0)

nrow(pacientes_fumantes) / 68521
nrow(pacientes_nao_fumantes) / 68521


nao_fumantes_doencas_cardio <- pacientes_nao_fumantes %>% filter(cardio == 1)

nao_fumantes_doencas_sem_cardio <- pacientes_nao_fumantes %>% filter(cardio == 0)


nrow(nao_fumantes_doencas_cardio)
nrow(nao_fumantes_doencas_sem_cardio)






write.csv(data, '/home/geovaniggr/dev/mqa-work/cardio/cardio_cleaned_sample-2.csv', row.names = TRUE)
