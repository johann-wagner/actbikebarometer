get_data <- function(base_url, offset = 0, limit = 1000) {
  url <- paste0(base_url, "?$offset=", offset, "&$limit=", limit)
  response <- httr2::request(url) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
  return(response)
}
