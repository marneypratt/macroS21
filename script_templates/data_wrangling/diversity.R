
# make sure the `vegan` and 'tidyverse' packages are installed and loaded to run the code below

# data must also be imported before you can run the code below

# remove missing values, and make sure each taxa is summarized within sampleID
macro.long <- ____ %>%  # replace the blank with the name of the appropriate data frame
  dplyr::filter(!is.na(number)) %>% 
  dplyr::select(sampleID, acceptedTaxonID, number) %>% 
  group_by(sampleID, acceptedTaxonID) %>% 
  dplyr::summarise(num = sum(number))


# convert to wide format
macro.wide <- macro.long %>% 
  pivot_wider(names_from = acceptedTaxonID, 
              values_from = num,
              values_fill = list(num = 0),
              values_fn = list(num = mean)) %>%
  tibble::column_to_rownames("sampleID")


#Calculate diversity index values

#Shannon
H <- diversity(macro.wide)


#effective number of species
effective.sp <- exp(H)


#Richness
sp.rich <- specnumber(macro.wide) 

#Max possible diversity
max.H <- log(sp.rich)


#Pielou's Evenness J 
J <- H / max.H

#put all diversity values into a single data frame
macro.div <- data.frame(H, effective.sp, sp.rich, max.H, J) %>% 
  tibble::rownames_to_column("sampleID")