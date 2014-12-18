corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  
  temp <- list.files(path = directory, pattern="*.csv", full.names = TRUE)# makes a list of files with path
  correlation <- vector()
  for(i in 1:length(temp)){
    fileName <- temp[i]
    myfile <- read.csv(fileName)
    sum <- sum(complete.cases(myfile))
    completed <- myfile[(complete.cases(myfile)),]
    if (sum > threshold){
      correlation <- c(correlation, cor(completed$sulfate, completed$nitrate))
    }
  }
  correlation
}