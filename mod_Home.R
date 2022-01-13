#' Home UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Home_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Iris Data"),
    
    textOutput("selected_vars"),
    textOutput("nbins"),
    textOutput("nclust")
  )
}
    
#' Home Server Functions
#'
#' @noRd 
#' 
mod_Home_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$selected_vars <- renderText({ 
      paste("You have selected variables", input$xcol, "and", input$ycol)
    })
    
    output$nbins <- renderText({ 
      paste("You have selected binwidth of for the histograms")
    })
    
    output$nclust <- renderText({ 
      paste("You have selected", input$clusters,"clusters for k-means clustering.")
    })

  })
  
}

# mod_Home_server <- function(input, output, session){
#     ns <- session$ns
#   }
    
## To be copied in the UI
# mod_Home_ui("Home_ui_1")
    
## To be copied in the server
# mod_Home_server("Home_ui_1")
