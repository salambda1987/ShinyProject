
library(shinythemes)
library(dplyr)
library(ggplot2)
library(data.table)
library(chron)
library(tidyr)
library(DT)
library(markdown)

Flares=read.csv("hessisolarflare2002to2016.csv")

#HouseKeeping
Flares=Flares %>% mutate(start.date=as.Date(start.date, '%Y-%m-%d'))
Flares$start.time=chron(times=Flares$start.time)
Flares$end=chron(times=Flares$end)
Flares$peak=chron(times=Flares$peak)
Flares=Flares %>% mutate(duration.s=end-start.time)
colnames(Flares)[6]='duration'
Flares$energy.kev=ordered(Flares$energy.kev, levels= 
                                    c('3-6','6-12','12-25','25-50','50-100','100-300','300-800','800-7000','7000-20000'))
lilflares=Flares[1:100,1:9]