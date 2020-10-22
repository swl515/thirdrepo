library(tidyr)

chaff <- chaff%>%
  pivot_longer(names_to="sex",
               values_to="mass",
               cols = everything())

file <-  "Data/chaff2.txt",
write.table(chaff, 
            file, 
            quote = FALSE,
            row.names = FALSE)