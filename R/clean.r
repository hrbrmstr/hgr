#' Remove all tags from a document
#'
#' This is designed to be run on the `$content` component of the `data.frame` returned
#' by `just_the_facts()`. It can be run on any `htmnl_document` or atomic character vectors
#' (which it will parse into an `html_document`) and it will return an atomic character
#' vector of only plain text (i.e. it will remove all tags).
#'
#' @md
#' @param doc atomic character vector (i.e. plain text) or an `html_document`
#' @return atomic character vector of cleaned text
#' @export
clean_text <- function(doc) {

  if (!inherits(doc, "html_document")) doc <- xml2::read_html(doc)

  cleaner <- xml2::read_xml(system.file("xslt/justthetext.xslt", package="hgr"))

  doc <- xslt::xml_xslt(doc, cleaner)
  doc <- rvest::html_text(doc)
  doc <- trimws(doc)

  doc

}