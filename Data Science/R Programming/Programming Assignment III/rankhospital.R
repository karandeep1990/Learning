rankhospital <- function(state = "", outcome = "", rank = 1){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  
  outcome <- tolower(outcome)
  cols <- NULL
  if (outcome == "heart attack"){
    cols <- 11
  }else if(outcome == "heart failure"){
    cols <- 17
  }else if(outcome == "pneumonia"){
    cols <- 23
  }else{
    stop("invalid outcome")
  }
  
  mortality <- data[data$State == state, cols]
  if (!(length(mortality) > 0)){
    stop("invalid state")
  }
  
  hospitals <- data[data$State == state, "Hospital.Name"]
  finalTable <- data.frame(Deaths = mortality, Hospital = hospitals)
  
  finalTable <- finalTable[complete.cases(finalTable),]
  
  sorted <- order(as.numeric(as.character(finalTable[,"Deaths"])), finalTable[,"Hospital"])
  sortedTable <- finalTable[sorted, ]
  
  if (rank == "best"){
    as.vector(sortedTable[1,"Hospital"])
  }else if (rank == "worst"){
    as.vector(sortedTable[nrow(sortedTable),"Hospital"])
  }else{
    if (rank <= nrow(sortedTable)){
      as.vector(sortedTable[rank,"Hospital"])
    }else{
      NA
    }
  }
}