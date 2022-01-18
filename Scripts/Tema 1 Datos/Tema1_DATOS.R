# Fichero CSV: Comma separated value
# Base de datos relacional


# Reading data set
auto <- read.csv("Data/auto-mpg.csv", header = TRUE,sep = ",")

# optional way,  sep =";" | sep = "t" 

# Names of variables
names(auto)


# When data set  no cointains  header
auto_no_header.v <- read.csv("Data/auto-mpg-noheader.csv", header = FALSE, sep = ",")

# using colnames

auto_custom_header <- read.csv("Data/auto-mpg-noheader.csv", header = FALSE,
                               col.names = c('col1','col2','col3',
                                             'col4','col5','col6',
                                             'col7', 'col8', 'col9'
                                             )

                               
                              )

# looking at the data
head(auto_custom_header,4)



#NA : not available
#na.strings = ""|"N/A"| "NA"| "NULL"
#stringsAsFactors = False
#as.character

# Loading data from internet
WHO_from_internet <- read.csv("https://raw.githubusercontent.com/joanby/r-course/master/data/tema1/WHO.csv",
                               header = TRUE)









