# time zone list: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

values <- c("Jan. 10, 2021 2:00PM", "08-27, 1991 13:00")

values_datetime <-
  lubridate::mdy_hm(
    values, tz="America/Los_Angeles"
  )
lubridate::with_tz(
  values_datetime,
  tz="Asia/Taipei"
)


# others ------------------------------------------------------------------

## restriction (1)
a$child[["name"]] # shows "John"
## restriction (2): a$child is an atomic vector
is.atomic(a$child) # shows TRUE

# Wrong expression
a <- list(
  child=name="John"
)
