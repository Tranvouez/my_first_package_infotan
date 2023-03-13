#' get_next_transport_addin
#' @description La fonction appelle la fonction get_next_transport via un addin.
#' La fonction ne prend pas d'argument et renvoie l'utilisateur sur une interface shiny.
#' Il est possible de rentrer le nom de l'arret et de cliquer sur un bouton,
#' pour afficher les résultats. Un second bouton est disponible pour se déloguer de la session
#' locale.
#' @import shiny
#' @import tuneR
#' @return La sortie de la fonction get_next_transport
#' @export
get_next_transport_addin <- function() {
  ui <- fluidPage(
    textInput("input", "Entrez le nom d'un arret:", ""),
    actionButton("submit", "VROUM, Roulez jeunesse !"),
    actionButton("play_button", "Musique TAN"),
    actionButton("quit", "Deconnectez-vous !"),
    verbatimTextOutput("console_output"),
  )
  server <- function(input, output, session) {
    transport_data <- eventReactive(input$submit, {
      capture.output(get_next_transport(input$input))
    })
    output$console_output <- renderText({
      observeEvent(input$play_button,{
        tuneR::play(readWave("annonce_tan.wav"))
      })
      paste(transport_data(), collapse = "\n")
    })
    observeEvent(input$quit, {
      stopApp()
    })
  }
  runApp(list(ui = ui, server = server))
}



