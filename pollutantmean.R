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
    dat <- read.csv2( filename,header = TRUE,sep = ",",quote = "\"",dec = ".")
    MyData <-rbind(dat,MyData)
    MyData <- data.frame(MyData)
   }
   ## print(MyData)
   ##print(MyData)
   mean(MyData[,pollutant],na.rm=TRUE)
  
}
