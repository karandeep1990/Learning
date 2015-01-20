rankall <- function(outcome = "", rank = 1){
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
  
  
  hospitalArr <- vector()
  stateArr <- vector()
  
  states <- unique(data$State)
  for(state in states){
    mortality <- data[data$State == state, cols]
    hospitals <- data[data$State == state, "Hospital.Name"]
    finalTable <- data.frame(Deaths = mortality, Hospital = hospitals)
    
    finalTable <- finalTable[complete.cases(finalTable),]
    
    sorted <- order(as.numeric(as.character(finalTable[,"Deaths"])), finalTable[,"Hospital"])
    sortedTable <- finalTable[sorted, ]
    
    
    hospital <- NA
    if (rank == "best"){
      hospital <- as.character(sortedTable[1,"Hospital"])
    }else if (rank == "worst"){
      hospital <- as.character(sortedTable[nrow(sortedTable),"Hospital"])
    }else{
      if (rank <= nrow(sortedTable)){
        hospital <- as.character(sortedTable[rank,"Hospital"])
      }else{
        hospital <- NA
      }
    }
    
    hospitalArr <- c(hospitalArr, hospital)
    stateArr <- c(stateArr, state)
  }
  allStates <- data.frame(hospital = hospitalArr, state = stateArr)
  allStates <- allStates[order(allStates$state),]
}