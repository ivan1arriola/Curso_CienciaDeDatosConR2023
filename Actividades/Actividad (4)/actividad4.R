
# Actividad 4

# 0.1. Ejercicio 1: Combine for, if y else()


x <- c(8, 6, 22, 1, 0, -2, -45)
y <- c()

for (i in x){
  if(i>0) 
    y <- c(y, 1)
  else 
    y <- c(y, 0)
}

y

# 0.2. Ejercicio 2: while() loops


multiplicacion <- 1
i<- 1
while(multiplicacion < 1000){
  multiplicacion <- multiplicacion * i
  i <- i+1
}
c(multiplicacion , " es factorial de " , i-1)
```

#2.  Dada la estructura siguiente, ¿Cuál es el valor del objeto suma?
#  Responda sin realizar el calculo en R.


x <- c(1,2,3)
suma <- 0
i <- 1
while(i < 6){
  suma = suma + x[i]
  i <- i + 1
}

#El resultado es NA de tipo numeric porque esta intentando sumar
#elementos inexistentes del vector

# 0.3. Ejercicio 3: Función

y <- c(1:3)
z<- c(1:15)

sumaSi <- function(vect){
  if(length(vect) < 5) 
    return(0)
  
  suma <- 0
  i <- 1
  
  while(i < 6){
    suma = suma + vect[i]
    i <- i + 1
  }
  return(suma)
}

sumaSi(y)
sumaSi(x)
sumaSi(z)