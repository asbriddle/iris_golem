#' Plots UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Plots_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' Plots Server Functions
#'
#' @noRd 
mod_Plots_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_Plots_ui("Plots_ui_1")
    
## To be copied in the server
# mod_Plots_server("Plots_ui_1")
