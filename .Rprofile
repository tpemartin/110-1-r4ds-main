.owner="tpemartin"
.repo="110-1-r4ds-main"


library(classdash)
.class_gitter <- readRDS("class_gitter.Rds")
.class_gitter$googleSheets$ss <- googlesheets4::as_sheets_id("https://docs.google.com/spreadsheets/d/1LSjsiUQ3WHoWa-2767y_fs3qSwS9GDnxQlF5Hq6VJ0c/edit#gid=1129935409")
.roomId <- .class_gitter$roomIds$`110-1-r4ds/main`
.startingSemester <- lubridate::ymd("2021-9-19")
dash <- Classdash(.class_gitter$googleSheets$ss)
gh <- gitterhub::githubService()
