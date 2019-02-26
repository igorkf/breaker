#' nbreak
#'
#' Breaks a line from the nth word, from n to n.
#'
#' @param string a string.
#'
#' @param n an integer (n > 0).
#'
#' @param loop Logical value. By default, loop = TRUE. If FALSE, it will break only a once.
#'
#' @export
nbreak <- function(string, n, loop = TRUE){

  ts <- unlist(strsplit(string, " "))
  tsn <- c()
  p <- c()

  if(n == 0){
    stop("n must be greater than 0")
  }

  for(i in 1:length(ts)){

    if(loop == FALSE){

      p[i] <- paste0(ts[i], " ")

      p[n] <- gsub(" ", "\n", p[n])

    }else if(loop == TRUE){

      tsn[i] <- (1:length(ts))[i]

      if(tsn[i] %% n == 0){

        p[i] <- paste0(ts[i], "\n")

      }else{

        p[i] <- paste0(ts[i], " ")

      }

    }}

  if(grepl(p[length(ts)], "\\n") == T){

    p[length(ts)] <- gsub("\\n", "", p[length(ts)])

  }

  p <- do.call(paste0, as.list(p))

  return(substr(p, 1, nchar(p)-1))

}
