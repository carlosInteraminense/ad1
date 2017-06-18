library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(scales)
source("import_data.R")
import_data()

shinyServer(function(input, output) {
  output$variacao.episodios <- renderPlotly({
    dados.filtrados <- dados %>% 
      filter(series_name == input$serie_name)
    
    names(dados.filtrados)[names(dados.filtrados) == "UserRating"] <- "Avaliação"
    names(dados.filtrados)[names(dados.filtrados) == "season"] <- "Temporada"
  
bp <-ggplot(dados.filtrados, aes(x = Temporada, y = Avaliação)) +
      geom_boxplot() +
      geom_jitter() +
      facet_wrap(~Temporada, scale="free_x") +
      theme_minimal() +
      ggtitle("Avaliações dos Usuários") +
      ylab("Avaliação") +
      xlab("Temporada")  
  
ggplotly(bp, width = 800)
  })
  
})