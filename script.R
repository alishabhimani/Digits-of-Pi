library(circlize)
library(readxl)
library(ggraph)
library(igraph)
library(tidyverse)
library(RColorBrewer)

data_og=read_excel("pi-data.xlsx")
data2=data_og[,1]
digit_to=rbind(data2[-1,],data2[1,])

df = cbind(data2,digit_to) #change to df_og
#df=rbind(c(99,1),df_og)
colnames(df)=c("from", "to")
#df$value <- runif(nrow(df))

df_sub=df[1:31415,]

colors<-c("0"="#FFF7F3", "1"="#FDE0DD",
         "2"="#FCC5C0", "3"="#FA9FB5",
         "4"="#F768A1", "5"="#DD3497",
         "6"="#AE017E", "7"="hotpink4",
         "8"="#7A0177", "9"="#49006A")

par(bg="black")
chordDiagram(df_sub, annotationTrack ="grid",
             transparency = 0.5, grid.col=colors)
#title(main = "Digits in Pi", col.main="white", font.main=3)
for(si in get.all.sector.index()) {
  xlim = get.cell.meta.data("xlim", sector.index = si, track.index = 1)
  ylim = get.cell.meta.data("ylim", sector.index = si, track.index = 1)
  circos.text(mean(xlim), mean(ylim), si, sector.index = si, track.index = 1, 
              facing = "bending.inside", niceFacing = TRUE, col = "white", adj = c(0, -0.8))
}


# Names and grid: annotationTrack =  c("name", "grid")
# Height of grid: annotationTrackHeight = c(0.04, 0.02)

circos.clear()




