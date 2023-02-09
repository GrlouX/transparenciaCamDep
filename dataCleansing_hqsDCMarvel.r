# Roteiro para pré-processamento dos dados das HQs da DC e da Marvel

# Bibliotecas utilizadas

library(dplyr) # Manipulação de bancos de dados
library(tidyr) # Transformação de dados
library(readr) # Recursos de leitura e formatação de dados
library(stringr) # Manipulação de strings

# Leitura dos dados preparados

dados <- read.csv("dados/comic_data.csv", sep=",", encoding="UTF-8") 
View(dados)
dados.norm <- dados

# Pré-processamento dos dados 

glimpse(dados.norm) 

# Padronizar pageid e tratar valores ausentes
dados.norm <- dados.norm %>%
  mutate_at(vars(pageid), str_pad, width=6, side="left", pad="0") 

dados.norm <- dados.norm %>%
  mutate_at(vars(identity), str_replace, " Identity", "")

dados.norm <- dados.norm %>%
  mutate_at(vars(align, sex, alive, gsm), str_replace, " Characters", "")

dados.norm <- dados.norm %>%
  mutate_at(vars(eye), str_replace, " Eyes", "")

dados.norm <- dados.norm %>%
  mutate_at(vars(hair), str_replace, " Hair", "")

dados.norm <- dados.norm %>%
  mutate_at(vars(identity,align,eye,hair,sex,alive,firstappearance), na_if, "")

dados.norm <- dados.norm %>%
  mutate_at(vars(identity,align,eye,hair,sex,alive), replace_na, "No info")

# Incluir atributo multiverse e alterar nameid para name
dados.norm <- dados.norm %>% 
  mutate(multiverse = str_extract(nameid, "[^(]*$"))

dados.norm <- dados.norm %>%
  mutate_at(vars(multiverse), str_replace, "\\)", "")

dados.norm <- dados.norm %>%
  mutate(name = str_extract(nameid, "[^(]+"), .after = nameid)

dados.norm <- dados.norm %>% select(-nameid)

colSums(is.na(dados.norm))/nrow(dados.norm)*100

dados.norm <- na.omit(dados.norm) # Remoção de valores ausentes nos atributos
# primeira aparição (~3,80%)

summary(dados.norm) # Tabela normalizada com 22388 registros e 13 atributos  

write.csv(dados.norm, "dados/comic_data_norm.csv", row.names = FALSE, 
          fileEncoding="UTF-8")  
