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
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins, fill="#85BFE6",color="#5C87A4") + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="#F36A60") +
      labs(title="Fonction de densité d'une loi normale",x="échantillon",y="densité")
  })
  ## fonction de repartition
  output$dnorm2 <- renderPlot({
    ech <- rnorm(input$ech1, input$moyenne, input$ecart_type)
    grille.x <- seq_abs(ech, input$ech1)
    y <- pnorm(grille.x, input$moyenne, input$ecart_type)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="#85BFE6") + 
      geom_line(aes(x=grille.x, y=y), col="#F36A60") +
      labs(title = "Fonction de répartition d'une loi normale",x="échantillon",y="Fn(x)")
    
  })
  
  # loi binomiale
  ## fonction de masse
  output$dbinom1 <- renderPlot({
    ech <- rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
    grille_x <- min(ech):max(ech)
    ech1 <- table(factor(ech,levels = min(ech):max(ech)))
    dat <- data.frame(x = grille_x, ech1, prob = dbinom(grille_x, size = input$nb_tirages , prob = input$proba))
    dat2 <- data.frame(type = rep(c("empirique","théorique"),each = length(dat$x)), x = rep(grille_x,2),
                       len_y = c(dat$Freq/input$ech2, dat$prob))
    ggplot(data=dat2, aes(x=x, y=len_y, fill=type)) + geom_bar(stat="identity", position=position_dodge()) +
      scale_fill_manual("légende", values = c("théorique" = "#F36A60", "empirique" = "#85BFE6")) +
      labs(title="Fonction de masse empirique et théorique d'une loi Binomiale", x = "Nombre de succès", y = "Probabilité de succès")
  })
  
  # ## fonction de masse theorique
  # output$dbinom1 <- renderPlot({
  #   ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
  #   grille_x <- min(ech):max(ech)
  #   dat <- data.frame(x = grille_x, prob = dbinom(grille_x, size = input$nb_tirages , prob = input$proba))
  #   ggplot(dat, aes(x = x, y = prob))+ 
  #     geom_segment(aes(xend = x, yend = 0),col="#F36A60") + 
  #     labs(title="Fonction de masse théorique d'une loi Binomiale", x = "Nombre de succes", y = "Proba de succès")
  # })
  # ## fonction de masse empirique
  # output$dbinom2 <-renderPlot({
  #   ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
  #   grille_x<- min(ech):max(ech)
  #   # transformation pour faire appaitre des 0 la ou il y a rien entre le min et le max de l'echantillon
  #   # pour avoir la meme longueur que la grille_x et pouvoir les rassembler en data.frame
  #   ech<-table(factor(ech,levels = min(ech):max(ech)))
  #   dat <- data.frame(x = grille_x, prob = ech)
  #   ggplot(dat, aes(x = x, y = prob.Freq/input$ech2))+ 
  #     geom_segment(aes(xend = x, yend = 0),col="#85BFE6") + 
  #     labs(title="Fonction de masse empirique d'une loi Binomiale", x = "Nombre de succes", y = "Proba de succès")
  # })
  
  ## fonction de repartition
  output$dbinom2 <-renderPlot({
    ech <-rbinom(n=input$ech2,size = input$nb_tirages, prob = input$proba)
    grille.x = seq(min(ech), max(ech),length=input$ech2)
    y = pbinom(grille.x,input$nb_tirages,input$proba)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df, aes(ech)) + stat_ecdf(col="#85BFE6") + geom_line(aes(x=grille.x,y=y),col="#F36A60") +
      labs(title = "Fonction de répartition d'une loi Binomiale",x="échantillon",y="Fn(x)")
  })
  
  # loi exponentielle
  ## fonction de densite
  output$dexp1 <- renderPlot({
    ech <- rexp(input$ech3,input$lambda2)
    grille.x <- seq(min(ech),max(ech),length=input$ech3)
    y <- dexp(grille.x,input$lambda2)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins2,fill="#85BFE6",color="#5C87A4") + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="#F36A60") +
      labs(title="Fonction de densité d'une loi Exponentielle",x="échantillon",y="densité")
  })
  ## fonction de repartition
  output$dexp2 <- renderPlot({
    ech <- rexp(input$ech3,input$lambda2)
    grille.x <- seq(min(ech),max(ech),length=input$ech3)
    y <- pexp(grille.x,input$lambda2)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="#85BFE6") + 
      geom_line(aes(x=grille.x, y=y), col="#F36A60") + 
      labs(title = "Fonction de répartition d'une loi Exponentielle",x="échantillon",y="Fn(x)")
  })
  
  
  # loi poisson
  ## fonction de masse 
  output$dpois1 <- renderPlot({
    ech <- rpois(input$ech4, input$lambda3)
    grille_x <- min(ech):max(ech)
    ech1 <- table(factor(ech,levels = min(ech):max(ech)))
    dat <- data.frame(x = grille_x, ech1, prob = dpois(grille_x, lambda = input$lambda3))
    dat2 <- data.frame(type = rep(c("empirique","théorique"),each = length(dat$x)),x = rep(grille_x,2),
                       len_y = c(dat$Freq/input$ech4,dat$prob))
    ggplot(data=dat2, aes(x=x, y=len_y, fill=type)) + geom_bar(stat="identity", position=position_dodge()) +
      scale_fill_manual("légende", values = c("théorique" = "#F36A60", "empirique" = "#85BFE6")) +
      labs(title="Fonction de masse empirique et théorique d'une loi de Poisson", x = "échantillon", y = "P(X = k)")
  })
  
  # ## fonction de masse theorique
  # output$dpois1 <- renderPlot({
  #   ech <- rpois(input$ech4, input$lambda3)
  #   grille_x <- min(ech):max(ech)
  #   dat <- data.frame(x = grille_x, prob = dpois(grille_x, lambda = input$lambda3))
  #   ggplot(dat, aes(x = x, y = prob)) +
  #     geom_segment(aes(xend = x, yend = 0),col="#F36A60") + 
  #     labs(title="Fonction de masse théorique d'une loi de Poisson", x = "echantillon", y = "P(x=k)")
  # })
  # ## fonction de masse empirique
  # output$dpois2 <- renderPlot({
  #   ech <- rpois(input$ech4, input$lambda3)
  #   grille_x <- min(ech):max(ech)
  #   # transformation pour faire appaitre des 0 la ou il y a rien entre le min et le max de l'echantillon
  #   # pour avoir la meme longueur que la grille_x et pouvoir les rassembler en data.frame
  #   ech<-table(factor(ech,levels = min(ech):max(ech)))
  #   dat <- data.frame(x = grille_x, prob = ech)
  #   ggplot(dat, aes(x = x, y = prob.Freq/input$ech4)) +
  #     geom_segment(aes(xend = x, yend = 0),col="#85BFE6") + 
  #     labs(title="Fonction de masse empirique d'une loi de Poisson", x = "echantillon", y = "P(x=k)")
  # })
  
  ## fonction de repartition
  output$dpois2 <- renderPlot({
    ech <-rpois(input$ech4, input$lambda3)
    grille.x = seq(min(ech), max(ech),length=input$ech4)
    y = ppois(grille.x, input$lambda3)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df, aes(ech)) + stat_ecdf(col="#85BFE6") + 
      geom_line(aes(x=grille.x,y=y),col="#F36A60") +
      labs(title = "Fonction de répartition d'une loi Poisson",x="échantillon",y="Fn(x)")
  })

  # loi uniforme  
  ## fonction de densite
  output$dunif1 <- renderPlot({
    ech <-runif(input$ech5,min(input$range),max(input$range))
    grille.x <- seq_abs(ech,input$ech5)
    y <- dunif(grille.x,min(input$range),max(input$range))
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins3,fill="#85BFE6",color="#5C87A4") + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="#F36A60") +
      labs(title="Fonction de densité d'une loi Uniforme continue",x="échantillon",y="densité")
  })
  ## fonction de repartition
  output$dunif2 <- renderPlot({
    ech <-runif(input$ech5,min(input$range),max(input$range))
    grille.x <- seq_abs(ech,input$ech5)
    y <- punif(grille.x,min(input$range),max(input$range))
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="#85BFE6") + 
      geom_line(aes(x=grille.x, y=y), col="#F36A60") +
      labs(title = "Fonction de répartition d'une loi Uniforme continue",x="échantillon",y="Fn(x)")
  })
  

  #loi gamma
  ## fonction de densite
  output$dgamma1 <- renderPlot({
    ech <-rgamma(input$ech6,shape = input$p, scale = input$teta)
    grille.x <- seq_abs(ech,input$ech6)
    y <- dgamma(grille.x,shape = input$p, scale = input$teta)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins4,fill="#85BFE6",color="#5C87A4") + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="#F36A60") +
      labs(title="Fonction de densité d'une loi Gamma",x="échantillon",y="densité")
  })
  ## fonction de repartition
  output$dgamma2 <- renderPlot({
    ech <-rgamma(input$ech6,shape = input$p, scale = input$teta)
    grille.x <- seq_abs(ech,input$ech6)
    y <- pgamma(grille.x,shape = input$p, scale = input$teta)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="#85BFE6") + 
      geom_line(aes(x=grille.x, y=y), col="#F36A60") +
      labs(title = "Fonction de répartition d'une loi Gamma",x="échantillon",y="Fn(x)")
  })
  
  # loi du khi-deux
  ## fonction de densite
  output$dchisq1 <- renderPlot({
    ech <- rchisq(input$ech7, df = input$ddl)
    grille.x <- seq_abs(ech,input$ech7)
    y <- dchisq(grille.x, df = input$ddl)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins5,fill="#85BFE6",color="#5C87A4") + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="#F36A60") +
      labs(title="Fonction de densité d'une loi Khi-deux",x="échantillon",y="densité")
  })
  ## fonction de repartition
  output$dchisq2 <- renderPlot({
    ech <- rchisq(input$ech7, df = input$ddl)
    grille.x <- seq_abs(ech,input$ech7)
    y <- pchisq(grille.x, df = input$ddl)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="#85BFE6") +
      geom_line(aes(x=grille.x, y=y), col="#F36A60") +
      labs(title = "Fonction de répartition d'une loi Khi-deux",x="échantillon",y="Fn(x)")
  })
  
  # loi student
  ## fonction de densite
  output$dt1 <- renderPlot({
    ech <-rt(input$ech8, df = input$ddl2)
    grille.x <- seq_abs(ech,input$ech8)
    y <- dt(grille.x, df = input$ddl2)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins6,fill="#85BFE6",color="#5C87A4") + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="#F36A60") +
      labs(title="Fonction de densité d'une loi Student",x="échantillon",y="densité")
  })
  ## fonction de repartition
  output$dt2 <- renderPlot({
    ech <-rt(input$ech8, df = input$ddl2)
    grille.x <- seq_abs(ech,input$ech8)
    y <- pt(grille.x, df = input$ddl2)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="#85BFE6") + 
      geom_line(aes(x=grille.x, y=y), col="#F36A60") +
      labs(title = "Fonction de répartition d'une loi Student",x="échantillon",y="Fn(x)")
  })
  
  # loi Fisher
  ## fonction de densite
  output$df1 <- renderPlot({
    ech <-rf(input$ech9, df1 = input$ddl3, df2 = input$ddl4)
    grille.x <- seq_abs(ech,input$ech9)
    y<-df(grille.x, df1 = input$ddl3, df2 = input$ddl4)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + geom_histogram(aes(y=..density..),bins=input$bins7,fill="#85BFE6",color="#5C87A4") + 
      geom_line(aes(x=grille.x,y=y),size=1.5,linetype="dashed",col="#F36A60") +
      labs(title="Fonction de densité d'une loi Fisher",x="échantillon",y="densité")
  })
  ## fonction de repartition
  output$df2 <- renderPlot({
    ech <-rf(input$ech9, df1 = input$ddl3, df2 = input$ddl4)
    grille.x <- seq_abs(ech,input$ech9)
    y<-pf(grille.x, df1 = input$ddl3, df2 = input$ddl4)
    df <- cbind(data.frame(ech),data.frame(grille.x),data.frame(y))
    ggplot(df,aes(ech)) + stat_ecdf(geom = "step", col="#85BFE6") + 
      geom_line(aes(x=grille.x, y=y), col="#F36A60") +
      labs(title = "Fonction de répartition d'une loi Fisher",x="échantillon",y="Fn(x)")
  })
}