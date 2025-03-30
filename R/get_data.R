#' Fetches data from an API endpoint with specified offset and limit.
#'
#' This function constructs a URL with the given base URL, offset, and limit parameters,
#' sends a GET request to the API, and returns the JSON response. It handles potential
#' API errors gracefully.
#'
#' @param base_url A character string of the base URL API endpoint.
#' @param offset An integer specifying the starting row number for data retrieval (default is 0).
#' @param limit An integer specifying the maximum number of rows to retrieve (default is 1000).
#'
#'
#' @returns A list representing the JSON response from the API, or NULL if an error occurs.
#' @export
#'
#' @examples
#' \dontrun{
#' base_url <- "https://www.data.act.gov.au/resource/62sb-92ea.json"
#' data <- get_data(base_url, offset = 0, limit = 100)
#' if (!is.null(data)) {
#'   print(head(data))
#' }
#' }
get_data <- function(base_url, offset = 0, limit = 1000) {
  url <- paste0(base_url, "?$offset=", offset, "&$limit=", limit)
  response <- httr2::request(url) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
  return(response)
}
