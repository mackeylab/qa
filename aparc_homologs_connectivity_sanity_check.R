setwd("/data/picsl/mackey_group/Ursula/analyses/sub_aparc_ts")

precentralhomo <- list()
postcentralhomo <- list()
occipitalhomo <- list()
pericalcarinehomo<-list()
subjects<-read.table("/data/picsl/mackey_group/Ursula/scripts/sub_list_Siemens_full_under_10_no_motion.txt")
for (s in subjects[,1]){
  mine <- sprintf("%s_rest_aparc_meants.csv", s)
  df <- read.csv(file=mine)
                 table <- cor(df)
                 precentralhomo[[s]] <- table[1,5]
                 postcentralhomo[[s]] <- table[3,7]
                 occipitalhomo[[s]] <- table[9,11]
                 pericalcarinehomo[[s]]<-table[10,12]         
}

precentralhomo.df = as.data.frame(do.call(rbind, precentralhomo))
postcentralhomo.df = as.data.frame(do.call(rbind, postcentralhomo))
occipitalhomo.df = as.data.frame(do.call(rbind, occipitalhomo))
pericalcarinehomo.df = as.data.frame(do.call(rbind,pericalcarinehomo))
df=cbind(precentralhomo.df,postcentralhomo.df,occipitalhomo.df,pericalcarinehomo.df)

write.csv(df, "aparc_roi_homolog_correlations.csv", row.names=TRUE)
