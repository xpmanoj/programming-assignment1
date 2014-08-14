pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        # Set the working directory to be 'directory'
        #setwd(directory)
        # Read the specified monitors and save them to a data frame
        for (i in 1:length(id)){
                file1 <- formatC(id[i], width=3, flag="0")
                filename <- paste(file1,".csv", sep = "")
                if(!exists("df")){
                        df <- read.csv(filename, header = TRUE, sep =",")
                }
                else{
                        temp_df <- read.csv(filename, header = TRUE, sep =",")
                        df <- rbind(df, temp_df)
                        rm(temp_df)
                }
               
        }
        
        # Check for pollutant type
        if(pollutant == "sulfate"){
                col <- 2
        }
        else{
                col <- 3
        }
        
        #Find the mean
        avg <- mean(df[,col], na.rm = TRUE)
        round(avg,3)
}
