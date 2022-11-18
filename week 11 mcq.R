chineseNumbers <- 
  c('陸','陸','5','七','5','5','七')
chinese5to7 <- c("5","陸","七") # Chinese means 5, 6, 7
fct_chineseNum <- 
  factor(
    chineseNumbers,
    levels=chinese5to7
  )
num_chineseNum <- 
  as.numeric(
    fct_chineseNum
  )
