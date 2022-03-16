# Etiquetas y leyendas ----------------------------------------------------

# ggtitle()
# xlab(eje x)
# ylab(eje y)
# labs(...)

library(ggplot2)

tooth  <- read.csv("Data/ToothGrowth.csv")
head(tooth)



ggplot(tooth, aes(x =dose, y = len, fill = as.factor(dose))) +
  geom_boxplot() + 
  ggtitle("Crecimiento dental en función de dosis (mg/día) de medicación") +
  xlab("Dosis de vitamina C (mg/día)") + 
  ylab("Crecimimiento dental (en mm)") + 
  theme(legend.position = "bottom") +
  labs(fill = "Dosis  mg/día") +
  guides(fill = F)

# Colores -----------------------------------------------------------------


ggplot(tooth, aes(x =dose, y = len, fill = as.factor(dose))) +
  geom_boxplot() + 
  ggtitle("Crecimiento dental en función de dosis (mg/día) de medicación") +
  xlab("Dosis de vitamina C (mg/día)") + 
  ylab("Crecimimiento dental (en mm)") + 
  # theme_bw() +
  # theme_classic() +
  #theme(plot.background = element_rect(fill = "yellow3"))
  theme(axis.text.x = element_text(face = "italic",
                                   family = "Times",
                                   size = 14,
                                   angle = 45,
                                   color = "#FF0055"),
        axis.text.y = element_text(face = "italic",
                                   family = "Times",
                                   size = 14,
                                   angle = 45,
                                   color = "#FF0055")) +
  theme(panel.border = element_blank()) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())







  