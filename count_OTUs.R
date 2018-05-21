library(tidyverse)
library(ggplot2)

# input should be a list of BLAST results from write_top_results.py

args = commandArgs(trailingOnly=TRUE)

if (length(args)!=1){
stop("Usage: Rscript assess_performance.R <filename.txt>", call.=FALSE)
} else {
  input = args[1]
  
  df <- read.table(input, header = FALSE, fill = TRUE)
  df <- df %>% select(V2, V3)
  
  colnames(df) <- c("Genus", "species")
  
  # unique ones
  unique_df <- unique(df)
  print(unique_df)
  
  # by genus
  ggplot(df, aes(Genus)) + geom_bar() + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
  
  dist <- df %>% group_by(Genus) %>% summarize(n())
  
  # write.csv(dist, "top10.csv")
  # write.csv(unique_df, "unique10.csv")
  
}

