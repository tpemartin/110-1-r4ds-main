l1[[1]][[1]] # show "value"
l1[[1]][[2]] # show "value2"

l1 <- list()
l1[[1]] <- list(
  "value", "value2"
)

l1 <- list()
l1$element1[[1]] <- "value"
l1$element1[[2]] <- "value2"

  
# declare 
l0 <- list()
# add
l0[[1]][[1]] <- "value"

l0[[1]] <- list()
l0[[1]][[1]] <- "value"
l0[[1]][[2]] <- "value2"
l0[[2]] <- list()
l0[[2]][[1]] <- "value2"
l0[[3]] <- list()
l0[[3]][[5]] <- "value3"
l0$element4[[1]] <- "value4"
l0 <- list()
l0$element2[[3]]$subelement1[[2]] <- "value" # okay since no ajacent position retrieval
