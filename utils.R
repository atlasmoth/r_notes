library(quantmod)
util.load_data <- function(rawdata, ticker) {
  
  data <- read.csv(rawdata, header = TRUE)
  
  data$Date <- as.Date(data$Date, format = "%Y-%m-%d")
  
  data <- data[order(data$Date), ]
  
  data <- xts(data[, 2:7], order.by = data$Date) 
  
  names(data) <- c(
    paste(ticker, ".Open", sep = ""),
    paste(ticker, ".High", sep = ""), 
    paste(ticker, ".Low", sep = ""),
    paste(ticker, ".Close", sep = ""),
    paste(ticker, ".Adjusted", sep=""),
    paste(ticker, ".Volume", sep="")
  )
  
  data <- data[, c(1:4, 6, 5)]
  
  return(data)
  
}


util.head_tail <- function(dataset){
   print(head(dataset, 3))
   print(tail(dataset, 3))
}

util.normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}
