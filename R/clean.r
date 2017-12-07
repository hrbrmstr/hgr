#' Remove all tags from a document
#'
#' This is designed to be run on the `$content` component of the `data.frame` returned
#' by `just_the_facts()`. It can be run on any `html_document` or atomic character vectors
#' (which it will parse into an `html_document`) and it will return an atomic character
#' vector of only plain text (i.e. it will remove all tags).
#'
#' @md
#' @param doc atomic character vector (i.e. plain text) or an `html_document`
#' @return atomic character vector of cleaned text
#' @note the XSLT can be a bit aggressive for some URLs and this function will first
#'     try the XSLT and test for an empty return. If that condition exists, then
#'     it will revert to a plain text conversion with just straight `rvest::html_text()`.
#' @export
#' @examples
#' clean_text(system.file("extdata", "raw.html", package="hgr"))
clean_text <- function(doc) {

  if (!inherits(doc, "html_document")) doc <- xml2::read_html(doc)

  cleaner <- xml2::read_xml(system.file("xslt/justthetext.xslt", package="hgr"))

  doc_tmp <- xslt::xml_xslt(doc, cleaner)
  doc_tmp <- rvest::html_text(doc_tmp)
  doc_tmp <- trimws(doc_tmp)

  if (nchar(doc_tmp) == 0) {
    doc_tmp <- rvest::html_text(doc)
    doc_tmp <- trimws(doc_tmp)
  }

  doc_tmp

}