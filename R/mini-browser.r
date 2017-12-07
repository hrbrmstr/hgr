#' Use hgr as a mini-browser (RStudio Addin)
#'
#' @export
mini_browser <- function() {

  # Get the document context.
  context <- rstudioapi::getActiveDocumentContext()

  # Set the default data to use based on the selection.
  text <- context$selection[[1]]$text
  defaultData <- text

  # Generate UI for the gadget.
  ui <- miniPage(
    gadgetTitleBar("BrowseR"),
    miniContentPanel(
      shiny::div(
        style="width:100%",
        textInput("URL", "Location:", width="70%"),
        submitButton("Go!")
      ),
      shiny::br(),
      htmlOutput("output")
    )
  )


  # Server code for the gadget.
  server <- function(input, output, session) {

    output$output <- renderText({
      goto_url <- input$URL %||% ""
      if (goto_url != "") {
        tmp <- hgr::just_the_facts(goto_url)
        tmp$content
      }

      # data <- reactiveData()
      # if (nzchar(data) > 0) {
      #   tweet_base <- stringi::stri_wrap(data, 134, whitespace_only = TRUE)
      #   paste0(sprintf("%s %d/%d", tweet_base, 1:length(tweet_base), length(tweet_base)), collapse="<br/>\n<br/>\n")
      # } else {
      #   ""
      # }
    })

    # Listen for 'done'.
    observeEvent(input$done, {
      invisible(stopApp())
    })
  }

  # Use a modal dialog as a viewr.
  viewer <- dialogViewer("BrowseR", width = 800, height = 600)
  runGadget(ui, server, viewer = viewer)

}