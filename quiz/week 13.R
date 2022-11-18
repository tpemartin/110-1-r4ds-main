deaths <- c('自然死','自然死','自殺','不詳','他殺','自然死','不詳','自殺','意外','意外')
pick <- deaths == c("不詳","他殺")
which(pick)
table(deaths[pick])
