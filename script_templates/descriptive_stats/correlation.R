

#select just the two variables you want to compare
___ %>%    # place the data frame object name here
  dplyr::select(___, ___) %>%  #place name of the column for each variable in these blanks
  
  #remove missing values for each variable
  dplyr::filter(!is.na(___), !is.na(___)) %>%  # remove missing values by putting the name of the same two variables from above in these blanks
  
  #perform parametric correlation using method="pearson" 
  #or perform non-parametric correlation by replacing with "kendall" or "spearman" as needed
  #see the ?cor help file for more information
  cor(method = "pearson") 