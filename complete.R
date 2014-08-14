complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        # Set the working directory to be 'directory'
        #setwd(directory)
        
        # Read the specified monitors and save them to a data frame
        df <- data.frame("id" = numeric(0), "nobs" = numeric(0))
        for (i in 1:length(id)){
                file1 <- formatC(id[i], width=3, flag="0")
                filename <- paste(file1,".csv", sep = "")
                nobs <- sum(complete.cases(read.csv(filename, header = TRUE)))
                df <- rbind(df,data.frame("id" = id[i], "nobs" = nobs))  
                rm(nobs)
        }  
        df
}