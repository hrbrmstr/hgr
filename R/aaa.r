.hgr_cols <- readr::cols(
  title = readr::col_character(),
  content = readr::col_character(),
  author = readr::col_character(),
  date_published = readr::col_datetime(format = ""),
  lead_image_url = readr::col_character(),
  url = readr::col_character(),
  domain = readr::col_character(),
  excerpt = readr::col_character(),
  direction = readr::col_character()
)

.hgr_ua <- "hgr R package / github.com/hrbrmstr/hgr"