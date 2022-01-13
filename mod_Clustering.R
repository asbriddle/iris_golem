#' Clustering UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 

mod_Clustering_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("k-means clustering"),
    plotOutput(ns('clusterplot')),
    plotOutput(ns('elbowplot'))
  )
}
    
#' Clustering Server Functions
#'
#' @noRd 
mod_Clustering_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    datasetInput <- reactive({
      iris[, c(input$xcol, input$ycol)]
    })
    
    clusters <- reactive({
      kmeans(datasetInput(), input$clusters)
    })
    
    output$clusterplot <- renderPlot({
      palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
      
      par(mar = c(5.1, 4.1, 0, 1))
      plot(datasetInput(),
           col = clusters()$cluster,
           pch = 20, cex = 3)
      points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })
    
    output$elbowplot <- renderPlot({
      factoextra::fviz_nbclust(datasetInput(), kmeans, method = "wss")
    })
 
  })
}
    
## To be copied in the UI
# mod_Clustering_ui("Clustering_ui_1")
    
## To be copied in the server
# mod_Clustering_server("Clustering_ui_1")
