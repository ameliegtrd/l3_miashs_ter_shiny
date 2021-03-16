# le server retourne les objets a ui
# il declare et calcul les outputs
# c'est ici que sont executes les codes R qui servent a produire les outputs
# et a les mettre a jour en cas de changement dans les valeurs d'inputs

library(shiny)
library(shinydashboard)

# les commandes de la fonction sont separees par des retours a la ligne

function(input, output) {
  # loi normale
  output$dnorm <- renderPlot({
    ech <-rnorm(500,input$moyenne,input$ecart_type)
    bins <- seq(min(ech), max(ech), length.out = input$bins +1)
    hist(ech, breaks = bins,main = "Histogramme d'une loi normale" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=500)
    y<-dnorm(grille.x,input$moyenne,input$ecart_type)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  # loi binomiale
  output$dbinom<- renderPlot({
    ech <-rbinom(n=500,size = input$nb_tirages,prob = input$proba)
    plot(table(ech)/500,main = "Histogramme de la loi binomiale")
    grille.x <- min(ech):max(ech)
    y<-dbinom(grille.x,input$nb_tirages,input$proba)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  # loi exponentielle
  output$dexp <- renderPlot({
    ech <-rexp(500,input$lambda2)
    bins <- seq(min(ech), max(ech), length.out = input$bins2 +1)
    hist(ech, breaks = bins,main = "Histogramme de la loi exponentielle" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=500)
    y<-dexp(grille.x,input$lambda2)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  # loi de poisson
  output$dpois <- renderPlot({
    ech <-rpois(500,input$lambda3)
    plot(table(ech)/500,main = "Histogramme de la loi de poisson")
    grille.x <-min(ech):max(ech)
    y<-dpois(grille.x,input$lambda3)
    lines(grille.x,y,col="red",lwd = 2)
  })
}
