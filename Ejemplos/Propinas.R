library(tidyverse)
propinas <- read_csv("./Datos/propina.csv")
head(propinas)


# grafico base
ggplot(data = propinas, aes( x= total, y = propina)) +
  geom_point() +
  theme(aspect.ratio = 1)

# grafico / sexo colour
ggplot(data = propinas, aes( x= total, y = propina, colour=sexo)) +
  geom_point() +
  theme(aspect.ratio = 1)

# grafico / sexo shape
ggplot(data = propinas, aes( x= total, y = propina, shape=sexo)) +
  geom_point() +
  theme(aspect.ratio = 1)

# grafico / cantidad size
ggplot(data = propinas, aes( x= total, y = propina, size=cantidad)) +
  geom_point() +
  theme(aspect.ratio = 1)

# grafico / cantidad size alpha
ggplot(data = propinas, aes( x= total, y = propina, size=cantidad)) +
  geom_point(alpha = 1/3) +
  theme(aspect.ratio = 1)

# grafico / azul fijo
ggplot(data = propinas, aes( x= total, y = propina)) +
  geom_point(colour="blue") +
  theme(aspect.ratio = 1)

# grafico / Etiquetas
ggplot(data = propinas, aes(x = total, y = propina) ) +
  geom_point(size = 5, alpha = 1 / 3) + theme(aspect.ratio = 1) +
  labs(x = "Total de la cuenta en dólares"
       , y = "Propina en dólares")

# grafico / facet_wrap
ggplot(data = propinas, aes(x = total, y = propina) ) +
  geom_point() + theme(aspect.ratio = 1) +
  labs(x = "Total de la cuenta en dólares"
       , y = "Propina en dólares") +
  facet_wrap( ~sexo)

# grafico / facet_grid
ggplot(data = propinas, aes(x = total, y = propina) ) +
  geom_point() + theme(aspect.ratio = 1) +
  labs(x = "Total de la cuenta en dólares"
       , y = "Propina en dólares") +
  facet_grid( sexo~fuma)
