library(tidyr)

#tidy the chaff data set
#so it is suitable for analysis
chaff <- chaff%>%
  pivot_longer(names_to="sex",
               values_to="mass",
               cols = everything())

#save chaff2 as a new file
file <-  "Data/chaff2.txt"
write.table(chaff, 
            file, 
            quote = FALSE,
            row.names = FALSE)


#create some summary statistics of 
#chaff2
chaff2 %>% group_by(sex) %>%
  summarise(mean = mean(mass),
            n = length(sex),
            sdev = sd(mass))

#create a report worthy figure 
library(ggplot2)
fig1 <- ggplot(data = chaff2, aes(x = sex, y = mass)) +
  geom_boxplot()+
  theme_bw()+
  ylab("Mass (g)") +
  xlab("Sex")
fig1

#figure saving settings
units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 

ggsave("figures/fig1.tiff",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)

