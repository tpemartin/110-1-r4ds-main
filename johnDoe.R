johnDoe <- list()
johnDoe$source[[1]] <- "https://www.moj.gov.tw/2204/2771/2773/76135/post"
johnDoe$source[[2]] <- "https://docs.google.com/spreadsheets/d/1g2AMop133lCAsmdPhsH3lA-tjiY5fkGIqXqwdknwEVk/edit#gid=640486514"
googlesheets4::read_sheet(
  johnDoe$source[[2]]
) -> johnDoe$data

saveRDS(johnDoe, file="johnDoe.Rds")
johnDoe <- readRDS("johnDoe.Rds")
