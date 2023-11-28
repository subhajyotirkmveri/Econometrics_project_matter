# Importing the libraries

library(FactoMineR)
library(factoextra)
library(dplyr)
library(missMDA)
library(Gifi)
#Importing the filtered data


data=read.csv("processed_data.csv")
str(data)  # checking the data types of the coloumns
#Removing the first column from the Filtered dataset
data=data[,-1]
colnames(data)
subset_data_original=select(data,-Lastly..what.was.your.favorite.overall.coffee.)

# Converting the data variables to factors in R 

subset_data=lapply(subset_data_original,factor)
subset_data[] <- lapply(subset_data, function(x) if(is.numeric(x)) factor(x) else x)
subset_data=data.frame(subset_data)
str(subset_data)
class(subset_data)
#subset_data$How.do.you.brew.coffee.at.home...Bean.to.cup.machine.
colnames(subset_data)

dim(subset_data)
estim_ncpMCA(don=subset_data)
# Dimensionality Reduction
# Multiple Correspondence Analysis
res.mca=MCA(subset_data,graph = FALSE)
get_eigenvalue(res.mca)
fviz_screeplot(res.mca,addlabels = TRUE,
                 # Avoid text overlapping (slow if many point)
                ggtheme = theme_minimal())


res.mca$call
