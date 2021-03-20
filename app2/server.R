# le server retourne les objets a ui
# il declare et calcul les outputs
# c'est ici que sont executes les codes R qui servent a produire les outputs
# et a les mettre a jour en cas de changement dans les valeurs d'inputs

library(shiny)
library(shinydashboard)

# les commandes de la fonction sont separees par des retours a la ligne

function(input, output) { 
  #loi normale
  output$dnorm <- renderPlot({
    ech <-rnorm(input$ech1,input$moyenne,input$ecart_type)
    bins <- seq(min(ech), max(ech), length.out = input$bins +1)
    hist(ech, breaks = bins,main = "Histogramme de la loi Normale" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=input$ech1)
    y<-dnorm(grille.x,input$moyenne,input$ecart_type)
    lines(grille.x,y,col="red",lwd = 2)
    })
  
  #loi binomiale
  output$dbinom <- renderPlot({
    ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
    plot(table(ech)/input$ech2,main = "Histogramme de la loi Binomiale")
    grille.x <- min(ech):max(ech)
    y<-dbinom(grille.x,input$nb_tirages,input$proba)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  #loi exponentielle
  output$dexp <- renderPlot({
    ech <-rexp(input$ech3,input$lambda2)
    bins <- seq(min(ech), max(ech), length.out = input$bins2 +1)
    hist(ech, breaks = bins,main = "Histogramme de la loi Exponentielle" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=input$ech3)
    y<-dexp(grille.x,input$lambda2)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  #loi poisson
  output$dpois <- renderPlot({
    ech <-rpois(input$ech4,input$lambda3)
    plot(table(ech)/input$ech4,main = "Histogramme de la loi de Poisson")
    grille.x <-min(ech):max(ech)
    y<-dpois(grille.x,input$lambda3)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  #loi uniforme  
  output$dunif <- renderPlot({
    ech <-runif(input$ech5,min(input$range),max(input$range))
    bins <- seq(min(ech), max(ech), length.out = input$bins3 +1)
    hist(ech, breaks = bins,main = "Histogramme de la loi Uniforme continue" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=input$ech5)
    y<-dunif(grille.x,min(input$range),max(input$range))
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  #loi gamma
  output$dgamma <- renderPlot({
    ech <-rgamma(input$ech6,shape = input$p, scale = input$teta)
    bins <- seq(min(ech), max(ech), length.out = input$bins4 +1)
    hist(ech, breaks = bins,main = "Histogramme de la loi Gamma" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=input$ech6)
    y<-dgamma(grille.x,shape = input$p, scale = input$teta)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  #loi du khi-deux
  output$dchisq <- renderPlot({
    ech <-rchisq(input$ech7, df = input$ddl)
    bins <- seq(min(ech), max(ech), length.out = input$bins5 +1)
    hist(ech, breaks = bins,main = "Histogramme de la loi du Khi-deux" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=input$ech7)
    y<-dchisq(grille.x, df = input$ddl)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  #loi student
  output$dt <- renderPlot({
    ech <-rt(input$ech8, df = input$ddl2)
    bins <- seq(min(ech), max(ech), length.out = input$bins6 +1)
    hist(ech, breaks = bins,main = "Histogramme de la loi Student" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=input$ech8)
    y<-dt(grille.x, df = input$ddl2)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  #loi Fisher
  output$df <- renderPlot({
    ech <-rf(input$ech9, df1 = input$ddl4, df2 = input$ddl3)
    bins <- seq(min(ech), max(ech), length.out = input$bins7 +1)
    hist(ech, breaks = bins,main = "Histogramme de la loi de Fisher" ,col = "lightblue", border = "black",freq=FALSE)
    grille.x <- seq(min(ech),max(ech),length=input$ech9)
    y<-df(grille.x, df1 = input$ddl4, df2 = input$ddl3)
    lines(grille.x,y,col="red",lwd = 2)
  })
}
