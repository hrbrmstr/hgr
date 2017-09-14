#' Take URL from clipboard and get the facts!
#'
#' @export
jtf_addin <- function() {

  clip_txt <- trimws(clipr::read_clip())[1]

  if (grepl("^http[s]*://", clip_txt)) {

    var_name <- temp_name()

    code_to_exec <- sprintf("print(%s <- hgr::just_the_facts('%s'))",
                            var_name, clip_txt)

    rstudioapi::sendToConsole(code_to_exec, execute = TRUE)

  }

}
