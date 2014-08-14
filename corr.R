corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        # Set the working directory to be 'directory'
        
        setwd(directory)
        file_list <- list.files()
        # Read files one by one
        # Read each file to a data frame, check if threshold  applies
        # if yes, find correlation and add it to vector 
        correl <- numeric()
        for (file in file_list){
                df <- read.csv(file, header = TRUE)
                if (sum(complete.cases(df)) > threshold){
                        correl <- c(correl,(cor(df$nitrate, df$sulfate, use = "complete")))        
                }
                rm(df)        
              
        } 
        setwd("~/DataScience/RProgrammingWk2/Assignment1") #reset the wd
        #round(correl,5)
        correl
}