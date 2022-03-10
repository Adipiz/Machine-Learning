
# Formato fecha -----------------------------------------------------------

# Paquete básico de R para trabajar con fechas 
# EPOCH:1 de enero de 1970

# Fecha Hoy
Sys.Date()

# formato fecha
as.Date("1/1/80", format = "%m/%d/%y")

# formato fecha
fech <- as.Date("1/1/1980", format = "%m/%d/%Y")

#yyyy-mm-dd o yyyy/mm/dd
as.Date("2018-01-01")

#Conversión de fecha a número- Cuenta días desde el EPOCH
as.numeric(fech)


# Otros formatos
#x <- "1jan1960"
#as.Date(x, format = "%d%b%Y")


dt <- 2018
class(dt) <- "Date"
dt

dt <- -2018
class(dt) <- "Date"
dt




# creación fechas desde días

dt <- as.Date(2018, origin = as.Date("1988-05-19"))
as.Date(-2018, origin = as.Date("1988-05-19"))

#Componentes de la fecha
format(dt, "%Y")

# Resultado como número 
as.numeric(format(dt, "%Y"))



# Resultado como número 
as.numeric(format(dt, "%y"))


# Resultado como String
(format(dt, "%b"))
(format(dt, "%B"))


months(dt)
weekdays(dt)
quarters(dt)
julian(dt)

julian(dt, origin = as.Date("1992-04-27"))


# Operaciones y secuencias ------------------------------------------------

dt <- as.Date("1/1/2001", format = "%d/%m/%Y")
dt


# suma yb resta de días
dt+100
dt-100
dt+31


dt2 <- as.Date("2001/01/02")
dt2-dt
dt-dt2

# Comparaciones
dt>dt2
dt==dt2
dt2>dt


# Secuencias mensual
seq(dt, dt+365, "month")

seq(dt, as.Date("2001/01/10"), "day")

seq(dt, dt+365, "2 month")

seq(from = dt, by ="2 weeks", length.out = 6)





