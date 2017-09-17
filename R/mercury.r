#' Retrieve parsed content of a URL processed by the Postlight Mercury API
#'
#' [Mercury](https://mercury.postlight.com) takes any web article and returns only the
#' relevant content --- headline, author, body text, relevant images and more --- free
#' from any clutter.
#'
#' @md
#' @param url URL to retrieve
#' @param mercury_api_key your Mercury API key. The function looks for it in `MERCURY_API_KEY`
#'     but you can specify it manually as well. Get your key [here](https://mercury.postlight.com).
#' @return `data.frame`
#' @export
just_the_facts <- function(url, mercury_api_key=Sys.getenv("MERCURY_API_KEY")) {

   res <- httr::GET("https://mercury.postlight.com/parser",
                    httr::content_type_json(),
                    httr::user_agent(.hgr_ua),
                    httr::add_headers(`x-api-key`=mercury_api_key),
                    query = list(url = url))

   httr::stop_for_status(res)

   res <- httr::content(res, as="text", encoding="UTF-8")
   res <- jsonlite::fromJSON(res, flatten=TRUE)
   res <- purrr::flatten_df(res)
   res <- suppressWarnings(readr::type_convert(res, col_types=.hgr_cols))

   class(res) <- c("hgr")

   res

}

#' @md
#' @rdname just_the_facts
#' @param x `hgr` object
#' @param ... unused
#' @export
print.hgr <- function(x, ...) {
  tmp <- htmltools::HTML(x$content)
  htmltools::html_print(tmp)
}