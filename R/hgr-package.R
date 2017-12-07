#' Tools to Work with the 'Postlight' 'Mercury' 'API'
#'
#' [Mercury](https://mercury.postlight.com) takes any web article and returns only the
#' relevant content --- headline, author, body text, relevant images and more --- free
#' from any clutter.
#'
#' Tools are provided to access the 'API' and also further clean up retrieved text
#' through the the application of 'XSLT' style sheets. An 'RStudio' 'Addin' is also
#' provided which makes it possible to preview the cleaned content from a 'URL' on
#' the clipboard.
#'
#' @md
#' @name hgr
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @import purrr httr clipr htmltools
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom readr type_convert cols col_character col_datetime
#' @import xslt rstudioapi
#' @importFrom xml2 read_html
#' @importFrom rvest html_text
#' @import shiny miniUI
NULL
