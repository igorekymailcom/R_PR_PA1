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

   a<-data.frame(id=NULL, nobs=NULL)
         for(i in id) {
              filename<- sprintf("%s/%03d.csv", directory,as.numeric(i)) 
              data <- read.csv( filename,header = TRUE,sep = ",",quote = "\"",dec = ".")
              num <- sum(complete.cases(data))
              
              number_obs <- num
              new_frame<-data.frame(id=i,nobs=number_obs)
              
              a<-rbind(a,new_frame)     
              
              
          }
         ##a<-na.omit(a)
         return (a);

}