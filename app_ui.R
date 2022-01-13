#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
#app_ui <- function(request) {

# vars <- setdiff(names(iris), "Species")

app_ui <- function() {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    fluidPage(
      titlePanel("Iris Data"),
      
      # Sidebar layout with input and output definitions ----
      sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
          selectInput('xcol', 'X Variable', choices =c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), selected = "Sepal.Length"),
          selectInput('ycol', 'Y Variable',choices =c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), selected = "Sepal.Width"),
          sliderInput("bins", "Number of BINs for histogram", min=5, max = 25, value=15),
          sliderInput('clusters', 'Cluster count', 3, min = 1, max = 9)
          #numericInput('clusters', 'Cluster count', 3, min = 1, max = 9)
        ),
      
        mainPanel(
          tabsetPanel(type="tab", 
                      #tabPanel("Summary", verbatimTextOutput("sum")),
                      tabPanel("Home", mod_Home_ui("Home_ui_1")),
                      tabPanel("Data", mod_Data_ui("Data_ui_1")),
                      tabPanel("Plots", mod_Plots_ui("Plots_ui_1")),
                      tabPanel("Clustering", mod_Clustering_ui("Clustering_ui_1"))
          )
          
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'irisproject'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

