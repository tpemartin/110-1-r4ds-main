as.numeric.eachColumn <- function(.df){
  
  for(.x in seq_along(.df)){
    .dfX=.df[[.x]]
    .len = length(.dfX)
    output = vector("integer", .len)
    output = rep(NA, .len) |> as.integer()
    
    whichIsNOTNULL <- .dfX |> whichIsNULL(negate = T) 
    output[whichIsNOTNULL] <- unlist(.dfX)
    .df[[.x]] <- output
  }
  
  return(.df)
}

whichIsNULL <- function(.list, negate=F){
  pickNULL <- vector("logical", length(.list))
  for(.x in seq_along(.list)){
    pickNULL[[.x]] <- is.null(.list[[.x]])
  }
  if(negate) pickNULL= !pickNULL
  return(which(pickNULL))
}
get_total <- function(.dfX){
  output_total <- vector("list", length(.dfX))
  for(.x in seq_along(.dfX)){
    .dfX[[.x]][["total"]] -> output_total[[.x]]
  }
  return(output_total)
}
get_drugWeight <- function(dataSet, drugnames){
  pickData <- dataSet$毒品品項 %in% drugnames
  subsample <- dataSet[pickData, ]
  subsample |> split(subsample$毒品品項) -> list_groupedData
  drugWeights <- vector("list", length(list_groupedData))
  names(drugWeights) <- names(list_groupedData)
  for(.x in seq_along(list_groupedData)){
    list_groupedData[[.x]]$`數量（淨重）_克` |>
      as.numeric() |>
      sum(na.rm=T) -> drugXweight
    drugWeights[[.x]] <- drugXweight
  }
  return(drugWeights)
}
get_drugCount <- function(dataSet, drugnames){
  # drugnames = top20s
  # dataSet = drug$data
  pickData <- dataSet$毒品品項 %in% drugnames
  subsample <- dataSet[pickData, ]
  subsample |> split(subsample$毒品品項) -> list_groupedData
  drugCounts <- vector("list", length(list_groupedData))
  names(drugCounts) <- names(list_groupedData)
  for(.x in seq_along(list_groupedData)){
    # .x=2
    table(list_groupedData[[.x]]$`數量（淨重）_克`==0) -> .tb
    .tb[["total"]] <- sum(.tb)
    drugCounts[[.x]] <- .tb
  }
  return(drugCounts)
}
