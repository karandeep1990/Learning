best <- function(state = "", outcome = ""){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  cols <- NULL
  if (outcome == "Heart Attack"){
    cols <- 11
  }else if(outcome == "Heart Failure"){
    cols <- 17
  }else if(outcome == "Pneumonia"){
    cols <- 23
  }else{
    stop("invalid outcome")
  }
  
  mortality <- data[data$State == state, cols]
  if (!(length(mortality) > 0)){
    stop("invalid state")
  }
  
  hospitals <- data[data$State == state, "Hospital.Name"]
  data <- data.frame(Deaths = mortality, Hospital = hospitals)
  
  data[, "Deaths"] <- as.numeric(data[, "Deaths"])
  sorted <- with(data, order(Deaths, Hospital))
  data <- data[sorted, ]
}
x <- best("AL", "Heart Failure")
x