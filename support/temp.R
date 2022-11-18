ggcrop <- function(.sf){
  expr_sf <- rlang::enexpr(.sf) 
  
  sfname <- expr_sf |> 
    rlang::expr_deparse()

  rlang::eval_bare(rlang::expr(.sf <- !!expr_sf), env=.GlobalEnv)
  .GlobalEnv$.sf |> sf::st_bbox() -> bbox
  
  plotcopy <- 
  glue::glue('xmin={bbox[["xmin"]]} #input$xmin
  xmax={bbox[["xmax"]]} #input$xmax
  ymin={bbox[["ymin"]]} #input$ymin
  ymax={bbox[["ymax"]]} #input$ymax
  {sfname} |>
    sf::st_crop(
      c(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax)
    ) |> 
    ggplot() + geom_sf(
      fill="#c8c5be",
      color="#c8c5be",
      size=0)')
  require(magrittr)
  inputs <- {
    stringr::str_remove_all(
      plotcopy, "\\s"
    ) %>%
      stringr::str_extract_all("(?<=#)input\\$.+") %>%
      unlist()
  }
  input_names <- {
    purrr::map_chr(
      inputs,
      ~{
        stringr::str_extract(.x, "(?<=\\$).*")
      }
    )
  }
  inputValues <- {
    stringr::str_extract_all(
      plotcopy, "[^=\\(,\\)+]*(?=\\s*,?\\s*#\\s*input)"
    ) %>%
      purrr::map(
        ~{stringr::str_remove_all(.x, "\\s") -> .x2
          subset(.x2, .x2!="")}
      ) %>%
      unlist()
  }
  inputValueIsText <- {
    stringr::str_detect(
      inputValues,
      #inputValues[[5]][[1]],
      "[\"']")
  }
  uiInputTags <- {
    get_UItags(input_names, inputValues, inputValueIsText)
  }
  uiScript <- {
    get_uiText(uiInputTags)
  }
  serverText <- {
    get_serverText(plotcopy, inputs, input_names)
  }
  serverScript <- {
    get_serverScript(serverText, input_names)
  }
  runGGDash(uiScript, serverScript)
}
#   plotcopy <- ggcopy()

# }
