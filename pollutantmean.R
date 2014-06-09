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
  
 ## a<-data.frame(id=NULL, nobs=NULL)
  MyData <- data.frame()
   for(i in id) {
    filename<- sprintf("%s/%03d.csv", directory,as.numeric(i)) 
    ##print(filename);
    data <- read.csv( filename,header = TRUE,sep = ",",quote = "\"",dec = ".")
    
    MyData <- rbind(data)
    
   }
   ## print(MyData)
   print(MyData[, pollutant])
   mean(MyData[,pollutant],na.rm=TRUE)
  
}