# le server retourne les objets a ui
# il declare et calcul les outputs
# c'est ici que sont executes les codes R qui servent a produire les outputs
# et a les mettre a jour en cas de changement dans les valeurs d'inputs

# library
library(shiny)
library(shinydashboard)
library(ggplot2)



seq_abs <- function(echantillon,input_echantillon){
  seq(min(echantillon) - 0.5, max(echantillon) + 0.5, length = input_echantillon)
}

function(input, output){ 
  # exemple de qu'est-ce que shiny dans l'accueil
  output$ex_input <- renderText({
    input$ex_input
    })
  
  # loi normale
  ## fonction de densite
  output$dnorm1 <- renderPlot({
    ech <- rnorm(input$ech1, input$moyenne, input$ecart_type)
    grille.x <- seq_abs(ech, input$ech1)
    y<-dnorm(grille.x, input$moyenne, input$ecart_type)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins) + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="red") +
      labs(title="Fonction de densité d'une loi normale",x="echantillon",y="densité") + 
      scale_fill_brewer(palette = "Greens")
  })
  ## fonction de repartition
  output$dnorm2 <- renderPlot({
    ech <- rnorm(input$ech1, input$moyenne, input$ecart_type)
    grille.x <- seq_abs(ech, input$ech1)
    y <- pnorm(grille.x, input$moyenne, input$ecart_type)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="blue") + 
      geom_line(aes(x=grille.x, y=y), col="red") +
      labs(title = "Fonction de répartition d'une loi normale",x="echantillon",y="Fn(x)")
    
  })
  
  # loi binomiale
  ## fonction de masse theorique
  output$dbinom1 <- renderPlot({
    ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
    grille_x <- min(ech):max(ech)
    dat <- data.frame(x = grille_x, prob = dbinom(grille_x, size = input$nb_tirages , prob = input$proba))
    ggplot(dat, aes(x = x, y = prob))+ 
      geom_segment(aes(xend = x, yend = 0),col="#FC4E07") + 
      labs(title="Fonction de masse théorique d'une loi Binomiale", x = "Nombre de succes", y = "Proba de succès")
  })
  ## fonction de masse empirique
  output$dbinom2 <-renderPlot({
    ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
    plot(table(ech)/input$ech2, main = "Fonction de masse empirique d'une loi Binomiale",xlab = "Nombre de succes", ylab = "Proba de succès")
  })
  ## fonction de repartition
  output$dbinom3 <-renderPlot({
    ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
    grille.x = seq(min(ech), max(ech),length=input$ech2)
    y = pbinom(grille.x,input$nb_tirages,input$proba)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df, aes(ech)) + stat_ecdf(col="blue") + geom_line(aes(x=grille.x,y=y),col="red") +
      labs(title = "Fonction de répartition d'une loi Binomiale",x="echantillon",y="Fn(x)")
  })
  
  # loi exponentielle
  ## fonction de densite
  output$dexp1 <- renderPlot({
    ech <- rexp(input$ech3,input$lambda2)
    grille.x <- seq(min(ech),max(ech),length=input$ech3)
    y <- dexp(grille.x,input$lambda2)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins2) + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="red") +
      labs(title="Fonction de densité d'une loi Exponentielle",x="echantillon",y="densité") + 
      scale_fill_brewer(palette = "Greens")
  })
  ## fonction de repartition
  output$dexp2 <- renderPlot({
    ech <- rexp(input$ech3,input$lambda2)
    grille.x <- seq(min(ech),max(ech),length=input$ech3)
    y <- pexp(grille.x,input$lambda2)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="blue") + 
      geom_line(aes(x=grille.x, y=y), col="red") + 
      labs(title = "Fonction de répartition d'une loi Exponentielle",x="echantillon",y="Fn(x)")
  })
  
  
  # loi poisson
  ## fonction de masse theorique
  output$dpois1 <- renderPlot({
    ech <- rpois(input$ech4, input$lambda3)
    grille_x <- min(ech):max(ech)
    dat <- data.frame(x = grille_x, prob = dpois(grille_x, lambda = input$lambda3))
    ggplot(dat, aes(x = x, y = prob)) +
      geom_segment(aes(xend = x, yend = 0),col="red") + 
      labs(title="Fonction de masse théorique d'une loi de Poisson", x = "echantillon", y = "P(x=k)")
  })
  ## fonction de masse empirique
  output$dpois2 <- renderPlot({
    ech <- rpois(input$ech4, input$lambda3)
    plot(table(ech)/input$ech4, main = "Fonction de masse empirique d'une loi Poisson")
  })
  ## fonction de repartition
  output$dpois3 <- renderPlot({
    ech <-rpois(input$ech4, input$lambda3)
    grille.x = seq(min(ech), max(ech),length=input$ech4)
    y = ppois(grille.x, input$lambda3)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df, aes(ech)) + stat_ecdf(col="blue") + 
      geom_line(aes(x=grille.x,y=y),col="red") +
      labs(title = "Fonction de répartition d'une loi Poisson",x="echantillon",y="Fn(x)")
  })

  # loi uniforme  
  ## fonction de densite
  output$dunif1 <- renderPlot({
    ech <-runif(input$ech5,min(input$range),max(input$range))
    grille.x <- seq_abs(ech,input$ech5)
    y <- dunif(grille.x,min(input$range),max(input$range))
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins3) + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="red") +
      labs(title="Fonction de densité d'une loi Uniforme continue",x="echantillon",y="densité") + 
      scale_fill_brewer(palette = "Greens")
  })
  ## fonction de repartition
  output$dunif2 <- renderPlot({
    ech <-runif(input$ech5,min(input$range),max(input$range))
    grille.x <- seq_abs(ech,input$ech5)
    y <- punif(grille.x,min(input$range),max(input$range))
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="blue") + 
      geom_line(aes(x=grille.x, y=y), col="red") +
      labs(title = "Fonction de répartition d'une loi Uniforme continue",x="echantillon",y="Fn(x)")
  })
  

  #loi gamma
  ## fonction de densite
  output$dgamma1 <- renderPlot({
    ech <-rgamma(input$ech6,shape = input$p, scale = input$teta)
    grille.x <- seq_abs(ech,input$ech6)
    y <- dgamma(grille.x,shape = input$p, scale = input$teta)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins4) + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="red") +
      labs(title="Fonction de densité d'une loi Gamma",x="echantillon",y="densité") + 
      scale_fill_brewer(palette = "Greens")
  })
  ## fonction de repartition
  output$dgamma2 <- renderPlot({
    ech <-rgamma(input$ech6,shape = input$p, scale = input$teta)
    grille.x <- seq_abs(ech,input$ech6)
    y <- pgamma(grille.x,shape = input$p, scale = input$teta)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="blue") + 
      geom_line(aes(x=grille.x, y=y), col="red") +
      labs(title = "Fonction de répartition d'une loi Gamma",x="echantillon",y="Fn(x)")
  })
  
  # loi du khi-deux
  ## fonction de densite
  output$dchisq1 <- renderPlot({
    ech <- rchisq(input$ech7, df = input$ddl)
    grille.x <- seq_abs(ech,input$ech7)
    y <- dchisq(grille.x, df = input$ddl)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins5) + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="red") +
      labs(title="Fonction de densité d'une loi Khi-deux",x="echantillon",y="densité") + 
      scale_fill_brewer(palette = "Greens")
  })
  ## fonction de repartition
  output$dchisq2 <- renderPlot({
    ech <- rchisq(input$ech7, df = input$ddl)
    grille.x <- seq_abs(ech,input$ech7)
    y <- pchisq(grille.x, df = input$ddl)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="blue") +
      geom_line(aes(x=grille.x, y=y), col="red") +
      labs(title = "Fonction de répartition d'une loi Khi-deux",x="echantillon",y="Fn(x)")
  })
  
  # loi student
  ## fonction de densite
  output$dt1 <- renderPlot({
    ech <-rt(input$ech8, df = input$ddl2)
    grille.x <- seq_abs(ech,input$ech8)
    y <- dt(grille.x, df = input$ddl2)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins6) + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="red") +
      labs(title="Fonction de densité d'une loi Student",x="echantillon",y="densité") + 
      scale_fill_brewer(palette = "Greens")
  })
  ## fonction de repartition
  output$dt2 <- renderPlot({
    ech <-rt(input$ech8, df = input$ddl2)
    grille.x <- seq_abs(ech,input$ech8)
    y <- pt(grille.x, df = input$ddl2)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="blue") + 
      geom_line(aes(x=grille.x, y=y), col="red") +
      labs(title = "Fonction de répartition d'une loi Student",x="echantillon",y="Fn(x)")
  })
  
  # loi Fisher
  ## fonction de densite
  output$df1 <- renderPlot({
    ech <-rf(input$ech9, df1 = input$ddl3, df2 = input$ddl4)
    grille.x <- seq_abs(ech,input$ech9)
    y<-df(grille.x, df1 = input$ddl3, df2 = input$ddl4)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins7) + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="red") +
      labs(title="Fonction de densité d'une loi Fisher",x="echantillon",y="densité") + 
      scale_fill_brewer(palette = "Greens")
  })
  ## fonction de repartition
  output$df2 <- renderPlot({
    ech <-rf(input$ech9, df1 = input$ddl3, df2 = input$ddl4)
    grille.x <- seq_abs(ech,input$ech9)
    y<-pf(grille.x, df1 = input$ddl3, df2 = input$ddl4)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="blue") + 
      geom_line(aes(x=grille.x, y=y), col="red") +
      labs(title = "Fonction de répartition d'une loi Fisher",x="echantillon",y="Fn(x)")
  })
}
