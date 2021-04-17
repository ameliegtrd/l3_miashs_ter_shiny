# le server retourne les objets a ui
# il declare et calcul les outputs
# c'est ici que sont executes les codes R qui servent a produire les outputs
# et a les mettre a jour en cas de changement dans les valeurs d'inputs

library(shiny)
library(shinydashboard)


nb_classes <- function(echantillon,classes){
  seq(min(echantillon), max(echantillon), length.out = classes +1)
}

histogramme <- function(echantillon,bins,titre,color = "lightblue", bord = "black",frequence=FALSE){
  hist(echantillon, breaks = bins, main = titre, col = color, border = bord, freq = frequence)
}

seq_abs <- function(echantillon,input_echantillon){
  seq(min(echantillon) - 10, max(echantillon) + 10, length = input_echantillon)
}


lignes <- function(x, y, color = "red", line_width = 2){
  lines(x, y, col = color, lwd = line_width)
}
  
function(input, output){ 
  
  #loi normale
  output$dnorm <- renderPlot({
    ech <-rnorm(input$ech1,input$moyenne,input$ecart_type)
    # Avant
    #bins <- seq(min(ech), max(ech), length.out = input$bins +1)
    #hist(ech, breaks = bins,main = "Histogramme de la loi Normale" ,col = "lightblue", border = "black",freq=FALSE)
    #lines(grille.x,y,col="red",lwd = 2)
    bins <- nb_classes(ech, input$bins)
    histogramme(ech, bins, "Histogramme de la loi Normale")
    grille.x <- seq_abs(ech,input$ech1)
    y<-dnorm(grille.x,input$moyenne,input$ecart_type)
    lignes(grille.x, y)
  })
  
  #loi binomiale
  output$dbinom1 <- renderPlot({
    ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
    plot(table(ech),main = "Fonction de masse de la loi Binomiale", xlab = "Nombre de succès")
  })
  
  output$dbinom2 <-renderPlot({
    ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
    plot(ecdf(ech), main = "Fonction de répartition empirique", cex = 2, col ="red")
  })
  #loi exponentielle
  output$dexp <- renderPlot({
    ech <-rexp(input$ech3,input$lambda2)
    bins <- nb_classes(ech, input$bins2)
    histogramme(ech, bins, "Histogramme de la loi Exponentielle")
    # moche avec cette fonction
    #grille.x <- seq_abs(ech,input$ech3)
    grille.x <- seq(min(ech),max(ech),length=input$ech3)
    y<-dexp(grille.x,input$lambda2)
    lignes(grille.x, y)
  })
  
  #loi poisson
  output$dpois1 <- renderPlot({
    ech <-rpois(input$ech4, input$lambda3)
    plot(table(ech), main = "Fonction de masse de la loi Poisson")
  })
  
  output$dpois2 <- renderPlot({
    ech <-rpois(input$ech4, input$lambda3)
    plot(ecdf(ech), cex= 2, col ="red", main = "Fonction de répartition empirique")
  })
  
  #loi uniforme  
  output$dunif <- renderPlot({
    ech <-runif(input$ech5,min(input$range),max(input$range))
    bins <- nb_classes(ech, input$bins3)
    histogramme(ech, bins, "Histogramme de la loi Uniforme continue")
    grille.x <- seq_abs(ech,input$ech5)
    y<-dunif(grille.x,min(input$range),max(input$range))
    lignes(grille.x, y)
  })
  
  #loi gamma
  output$dgamma <- renderPlot({
    ech <-rgamma(input$ech6,shape = input$p, scale = input$teta)
    bins <- nb_classes(ech, input$bins4)
    histogramme(ech, bins, "Histogramme de la loi Gamma")
    grille.x <- seq_abs(ech,input$ech6)
    y<-dgamma(grille.x,shape = input$p, scale = input$teta)
    lignes(grille.x, y)
  })
  
  #loi du khi-deux
  output$dchisq <- renderPlot({
    ech <-rchisq(input$ech7, df = input$ddl)
    bins <- nb_classes(ech, input$bins5)
    histogramme(ech, bins, "Histogramme de la loi du Khi-deux")
    grille.x <- seq_abs(ech,input$ech7)
    y<-dchisq(grille.x, df = input$ddl)
    lignes(grille.x, y)
  })
  
  #loi student
  output$dt <- renderPlot({
    ech <-rt(input$ech8, df = input$ddl2)
    bins <- nb_classes(ech, input$bins6)
    histogramme(ech, bins, "Histogramme de la loi Student")
    grille.x <- seq_abs(ech,input$ech8)
    y <- dt(grille.x, df = input$ddl2)
    lignes(grille.x, y)
  })
  
  #loi Fisher
  output$df <- renderPlot({
    ech <-rf(input$ech9, df1 = input$ddl3, df2 = input$ddl4)
    bins <- nb_classes(ech, input$bins7)
    histogramme(ech, bins, "Histogramme de la loi de Fisher")
    grille.x <- seq_abs(ech,input$ech9)
    y<-df(grille.x, df1 = input$ddl3, df2 = input$ddl4)
    lignes(grille.x, y)
  })
}



