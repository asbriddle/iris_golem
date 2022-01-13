#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  mod_Home_server("Home_ui_1")
  mod_Data_server("Data_ui_1")
  mod_Plots_server("Plots_ui_1")
  mod_Clustering_server("Clustering_ui_1")
}
