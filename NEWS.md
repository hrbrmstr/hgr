0.3.0
* Enhanced "printing" of `hgr` objects (uses `htmltools::html_print()`)

0.2.0
* New `clean_text()` function which is designed to be run on the `$content` 
  component of the `data.frame` returned by `just_the_facts()`. It can be run
  on any `htmnl_document` or atomic character vectors (which it will parse
  into an `html_document`) and it will return an atomic character vector of
  only plain text (i.e. it will remove all tags).

0.1.0 
* Initial release
