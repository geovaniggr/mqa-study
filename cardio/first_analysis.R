database <- read.csv('/home/geovaniggr/dev/mqa-work/cardio/cardio_cleaned_sample.csv')

head(database)

boxplot(
  height ~ gender,
  database,
  col = c("#ff619b", "#6ee0ff"),
  names = c("Mulher", "Homem"),
  xlab = "Genêro",
  ylab = "Altura")

boxplot(
  weight ~ gender,
  database,
  col = c("#ff619b", "#6ee0ff"),
  names = c("Mulher", "Homem"),
  xlab = "Genêro",
  ylab = "Peso")

boxplot(
  ap_hi ~ gender,
  database,
  col = c("#ff619b", "#6ee0ff"),
  names = c("Mulher", "Homem"),
  xlab = "Genêro",
  ylab = "Pressão Sistólica")

boxplot(
  ap_lo ~ gender,
  database,
  col = c("#ff619b", "#6ee0ff"),
  names = c("Mulher", "Homem"),
  xlab = "Genêro",
  ylab = "Pressão Sistólica")


men_database <- database %>% filter(gender == 2)
female_database <- database %>% filter(gender == 1)


number_of_smoke_men = nrow(men_database %>% filter(smoke == 0 ))
number_of_smoke_woman = nrow(female_database %>% filter(smoke == 0))


barplot( height = c(number_of_smoke_men, number_of_smoke_woman), col = c("#ff619b", "#6ee0ff"))
