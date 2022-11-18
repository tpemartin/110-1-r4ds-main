check_class <- function(){
  # class check
  class_check <- vector("integer", length(dataSet3))
  for(.x in seq_along(dataSet3)){
    class_check[[.x]] <- class(dataSet3[[.x]])
  }
  names(class_check) <- names(dataSet3)
  class_check # the last executed line
}


check_na <- function(){
  # NA check
  na_check <- vector("integer", length(dataSet3))
  for(.x in seq_along(dataSet3)){
    na_check[[.x]] <- sum(is.na(dataSet3[[.x]]))
  }
  names(na_check) <- names(dataSet3)
  na_check # the last executed line
}
