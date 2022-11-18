#' Google place api: nearby search
#'
#' @param location a list of $lat and $lng.
#' @param radius a numeric meter number.
#' @param googleAPIKey googleAPIKey
#'
#' @return
#' @export
#'
#' @examples none
search_nearby <- function(location, radius, type="restaurant", googleAPIKey="") {
  output="json"
  parameters <- {
    location <-
      glue::glue("location={location$lat},{location$lng}")
    par_type <- glue::glue("type={type}")
    par_radius <- glue::glue("radius={radius}")
    par_api <- ifelse(
      googleAPIKey=="",
      glue::glue("key={Sys.getenv('googleAPIKey')}"),
      googleAPIKey)
    
    paste(location,par_type,par_radius, par_api, sep = "&")
  }
  requestFormat <- glue::glue("https://maps.googleapis.com/maps/api/place/nearbysearch/{output}?{parameters}")
  result <- list()
  response <- httr::GET(requestFormat)
  result$content <- httr::content(response)
  return(result)
}
next_page <- function(next_page_token)
{
  googleAPIKey = Sys.getenv("googleAPIKey")
  requestFormat = glue::glue("https://maps.googleapis.com/maps/api/place/nearbysearch/json?pagetoken={next_page_token}&key={googleAPIKey}")
  result <- list()
  response <- httr::GET(requestFormat)
  result$content <- httr::content(response)
  return(result)
}

#' Google place API: get details of a place
#'
#' @param place_id place id
#' @param fields fields
#' @param googleAPIKey google API key
#'
#' @return
#' @export
#'
#' @examples none
get_detailsOfOnePlace <- function(place_id, fields=c("opening_hours","formatted_phone_number"), googleAPIKey="") {
  params <- list(
    fields=fields,
    place_id=place_id,
    key=ifelse(
      googleAPIKey=="",
      Sys.getenv('googleAPIKey'),
      googleAPIKey)
  )
  queryParameters <- {
    param_names <- names(params)
    purrr::map_chr(seq_along(params),
      ~{
        paste0(param_names[[.x]],"=",paste(params[[.x]],collapse=","))
      }) |>
      paste(collapse="&")
  }
  
  requestUrl <- paste0("https://maps.googleapis.com/maps/api/place/details/json?",queryParameters)
  
  place <- list()
  response <- httr::GET(requestUrl)
  place$content <- httr::content(response)
  return(place)
}