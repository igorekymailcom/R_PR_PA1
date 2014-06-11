corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        a<-numeric()
  for(i in 1:332) {
        filename<- sprintf("%s/%03d.csv", directory,as.numeric(i)) 
        data <- read.csv( filename,header = TRUE,sep = ",",quote = "\"",dec = ".")
        c_data <- data[complete.cases(data),]
        s<-sum(complete.cases(data))
        
        if (s>=threshold){
          a<- c(a,cor(c_data$sulfate,c_data$nitrate))        
        }
  } 
       a;
      ## a <-head(a,threshold)
      ## a<- subset(a,select=c(sulfate,nitrate)) 
      
  
}