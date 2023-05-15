#Actividad Individual 9
#
#Ejercicio 1

library(tidyverse)

##1. Seleccioná las columnas de mpg que cumplen la condición de ser de typo character

mpg %>%
  select(where(is.character))

## 2. Seleccioná las variables manufacturer y model y renombrálas a fabricante y modelo

mpg %>% select(manufacturer, model) %>% 
  rename(fabricante = manufacturer, modelo = model)

## 3. ¿Qué hace el siguiente código?

mpg %>%
  select(where(is.numeric)) %>%
  select_if(~(mean(., na.rm = TRUE) > 20 ))

## Selecciona las columnas de mpg que son numericas y 
## que la media de la columna sea mayor a 20


## 4. Recodifica la variable drv, f a fwdrive, r a rwdrive y 4 a 4wd
mpg %>% select(drv) %>% mutate(drv, case_match(drv,
                                   "f"~ "fwdrive",
                                   "r"  ~ "rwdrive",
                                   "4" ~ "4wd"
))

## 5. Selecciona la fila 225

mpg %>%
  slice(225)

## 6. Calculá IQR para cty, hwy y disp agrupando por manufacturer usando across.

mpg %>% group_by(manufacturer) %>% 
  summarise(
    across(
      .col = c(cty, hwy, displ),
      .fns = IQR,
      .names = "{col}_IQR"
           
    )
  )

## 7. Replique el siguiente gráfico donde los puntos con color tienen la media de cty y hwy para los tres fabricantes y los puntos son los datos para esos tres fabricantes, utilice la pipa para obtener este gráfico


mpg %>% select(cty, hwy, manufacturer) %>% 
  filter(manufacturer %in% c("dodge", "toyota", "volkswagen")) %>% 
  group_by(manufacturer) %>% mutate(across(
    .cols = c(cty, hwy),
    .fns = mean,
    .names = "{col}_media"
  ))
  
  
