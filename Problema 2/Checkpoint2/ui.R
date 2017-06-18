library(shiny)
library(plotly)
source("import_data.R")
import_data()
shinyUI(fluidPage(
  
  titlePanel("Selecione a série que você deseja analisar:"),
  
  sidebarLayout(      
    
    sidebarPanel(
      selectInput("serie_name", "Série:", 
                  choices=levels(dados$series_name))
    ),
    
    mainPanel(
      p("No gráfico abaixo é possível verificar a regularidade das temporadas das séries escolhidas"),
#      plotOutput("variacao.episodios"),
      plotlyOutput("variacao.episodios"),
      hr(),
      p("Note que quando maior a distância inter quartil do boxplot (distância entre o primeiro e o terceiro percentil), 
        mais irregular a temporada é. Outra observação que pode ser feita é a partir da mediana, que pode ser considerada como parâmetro de comparação entre as temporadas, ou seja, quanto maior a mediana melhor a temporada"),
      p("A partir da explicação acima, note que, em The 100, a terceira temporada é a mais irregular, enquanto a primeira foi a mais regular"),
      p("Perceba que Lost é um série com as temporadas bem parecidas, ou seja, a regularidade das temporadas são parecidas entre si."),
      p("Ainda em Lost, perceba que a quinta temporada foi a melhor, pois possui a maior mediana"),
      p("Agora você pode analisar as suas séries favoriras, ou as que deseja assistir, e saber se são boas ou não a partir das avaliações dos usuários do IMDB")


    )
  )
))