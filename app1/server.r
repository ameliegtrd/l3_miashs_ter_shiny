# le server retourne les objets a ui
# il declare et calcul les outputs
# c'est ici que sont executes les codes R qui servent a produire les outputs
# et a les mettre a jour en cas de changement dans les valeurs d'inputs

# library
library(shiny)
library(shinydashboard)
library("DescTools")



shinyServer(function(input, output, session) {
  
  # exemple de qu'est-ce que shiny dans l'accueil
  output$ex_input <- renderText({
    input$ex_input
    })
  
  # tcl loi bernoulli
  output$ex_bernoulli <- renderUI({
    withMathJax(
      "Pour la loi de Bernoulli, on a donc un TCL qui est :
    $$ \\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-p}{\\sqrt{p(1-p)}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$
    ou
    $$ \\sqrt{n}\\ \\cdot (\\bar{X_n}-p) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,p(1-p)) $$
    quand \\( n \\rightarrow \\infty \\)"
      )
    })
  
  # tcl loi exponentielle
  output$ex_exp <- renderUI({
    withMathJax(
      "Pour la loi Exponentielle, on a donc un TCL qui est :
      $$ \\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-\\frac{1}{\\lambda}}{\\frac{1}{\\lambda}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$
      ou 
      $$ \\sqrt{n} \\cdot \\left(\\bar{X_n}-{\\frac{1}{\\lambda}} \\right) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,{\\frac{1}{\\lambda^2}} \\right) $$
      quand \\( n \\rightarrow \\infty \\)"
      )
    })
  
  # tcl loi de poisson
  output$ex_poisson <- renderUI({
    withMathJax(
      "Pour la loi Poisson, on a donc un TCL qui est :
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n}-\\lambda}{\\sqrt{\\lambda}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$  
      ou 
      $$ \\sqrt{n} \\cdot (\\bar{X_n}-\\lambda) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\lambda) $$
      quand \\( n \\rightarrow \\infty \\)"
      )
    })
  
  # tcl loi uniforme continue
  output$ex_unif <- renderUI({
    withMathJax(
      "Pour la loi Uniforme continue, on a donc un TCL qui est :
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n}-{\\mathbb{E}(X)}}{\\sigma_{X}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$
      ou 
      $$ \\sqrt{n} \\cdot (\\bar{X_n}-{\\mathbb{E}(X)}) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\mathbb{V(X)}) $$
      Cependant, l'espérance et la variance dépendent de l'intervalle [a,b] sur lequel la fonction est définie. Par exemple, si [a,b] = [0,1] alors TCL:
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n}-\\frac{1}{2}}{\\sqrt{\\frac{1}{12}}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$ "
      )
    })
  
  # tcl loi gamma
  output$ex_gamma <- renderUI({
    withMathJax(
      "Pour la loi Gamma, on a donc un TCL qui est :
        \\begin{equation*}
        \\begin{cases}
        \\sqrt{n} \\cdot \\frac{\\bar{X_n} - p}{\\sqrt{p}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) & \\text{si } \\theta = 1 \\\\
        \\sqrt{n} \\cdot ( \\bar{X_n} - p  ) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,p) & \\text{sinon} \\\\
        \\end{cases}
        \\end{equation*}
      alors :
      \\begin{equation*}
        \\begin{cases}
        \\sqrt{n} \\cdot \\frac{\\bar{X_n} - \\frac{p}{\\theta}} {\\sqrt{ \\frac{p}{\\theta^2} }} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) & \\text{si } \\theta = 1 \\\\
        \\sqrt{n} \\cdot \\left( \\bar{X_n} -\\frac{p}{\\theta} \\right) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,\\frac{p}{\\theta^{ 2}} \\right) & \\text{sinon} \\\\
        \\end{cases}
        \\end{equation*} "
      )
    })
  
  # tcl loi du khi-deux
  output$ex_khid <- renderUI({
    withMathJax(
      "Pour la loi Khi-deux à \\(n\\) degrés de liberté on a donc un TCL qui est :
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n} - n}{\\sqrt{2n}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$    
      ou 
      $$ \\sqrt{n} \\cdot (\\bar{X_n} - n) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,2n) $$"
      )
    })
  
  # tcl loi student
  output$ex_student <- renderUI({
    withMathJax(
      "Pour la loi Student à \\(n\\) degrés de liberté (avec \\(n > 2 \\) )  on a donc un TCL qui est :
      $$ \\bar{X_n} \\cdot \\sqrt{n-2} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$    
      ou 
      $$ \\sqrt{n} \\cdot \\bar{X_n} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,\\frac{n}{n-2} \\right) $$"
      )
    })
  
  # tcl loi fisher
  output$ex_fisher <- renderUI({
    withMathJax(
      "Pour la loi de Fisher à \\(m\\) et \\(n\\) degrés de liberté (avec \\(m > 4\\) )  on a donc un TCL qui est :
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n}-{\\frac{m}{m-2}}}{\\sqrt{\\frac{2m^2(n+m+2)}{n(m-2)^2(m-4)}}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$   
      ou 
      $$ \\sqrt{n} \\cdot \\left (\\bar{X_n}-\\frac{m}{m-2} \\right) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,\\frac{2m^2(n+m+2)}{n(m-2)^2(m-4)} \\right) $$"
      )
    })
  
  # preuve empirique TCL
  output$preuve <- renderPlot({
    echantillon <-rexp(1000*input$n, input$lambda)
    matrice<- matrix(echantillon, nrow=input$n, ncol=1000)
    vecteurmoy<- rowMeans(matrice)
    vecteur_de_moyenne<-(vecteurmoy-mean(vecteurmoy))/sd(vecteurmoy)
    hist(vecteur_de_moyenne,breaks = 20, main = "Histogramme de la preuve empirique" ,col = "lightblue", border = "black",freq=FALSE)
    ech<-rnorm(input$n,0,1)
    grille.x <- seq(min(ech), 1.2*max(ech), length.out = input$n)
    y<-dnorm(grille.x,0,1)
    lines(grille.x, y, col="red",  lwd=2)
    legend("topright",legend=c("densité empirique","loi centrée réduite"),
           col=c("lightblue","red"),title="Légende :",lty=1, lwd=2)
  })
  
  # box qu'est-ce que la delta methode
  output$tabdeltaSelected <- renderText({
    input$tabdelta
  })
  
  # fonction inverse et loi binomiale
  output$inv_bin <- renderUI({
    withMathJax(
      "Le TCL est :
      $$ \\sqrt{n} \\left[ \\frac{1}{\\bar{X_n}} - \\frac{1}{p}  \\right] \\stackrel{\\mathcal{L}}{\\rightarrow}
      \\mathcal{N} \\left(0, \\frac{(1-p)}{p^{\\ 3}} \\right) $$"
    )
  })
  
  # fonction inverse et loi exponentielle
  output$inv_exp <- renderUI({
    withMathJax(
      "Le TCL est : 
      $$ \\sqrt{n} \\left[ \\frac{1}{\\bar{X_n}} - \\lambda  \\right] \\stackrel{\\mathcal{L}}{\\rightarrow} 
      \\mathcal{N}(0, \\lambda^2) $$"
    )
  })
  
  # fonction carree et loi binomiale
  output$carre_bin <- renderUI({
    withMathJax(
      "Le TCL est : 
      $$ \\sqrt{n} \\left[ \\bar{X_n}^2 - p^{2}   \\right] \\stackrel{\\mathcal{L}}{\\rightarrow} 
      \\mathcal{N} \\left(0, 4p^{3} (1-p) \\right) $$"
    )
  })
  
  # fonction carree et loi exponentielle
  output$carre_exp <- renderUI({
    withMathJax(
      "Le TCL est : 
      $$ \\sqrt{n} \\left[ \\bar{X_n}^2 - \\frac{1}{\\lambda^2}   \\right] \\stackrel{\\mathcal{L}}{\\rightarrow} 
      \\mathcal{N}(0, \\lambda^4) $$"
    )
  })
  
  # fonction log et loi binomiale
  output$ln_bin <- renderUI({
    withMathJax(
      "Le TCL est : 
      $$ \\sqrt{n} \\left[ ln(\\bar{X_n}) - ln(p)   \\right] \\stackrel{\\mathcal{L}}{\\rightarrow} 
      \\mathcal{N} \\left(0, \\frac{(1-p)}{p} \\right) $$"
    )
  })
  
  # fonction log et loi exponentielle
  output$ln_exp <- renderUI({
    withMathJax(
      "Le TCL est : 
      $$ \\sqrt{n} \\left[ ln(\\bar{X_n}) - ln \\left( \\frac{1}{\\lambda} \\right) \\right] \\stackrel{\\mathcal{L}}{\\rightarrow} 
      \\mathcal{N}(0, 1) $$"
    )
  })

  
  # intervalle de confiance
  output$IC <- renderPlot({
    ech_int <- rbinom(n = input$nb,p = 0.5, size = 1)
    deb <- round(MeanCI(ech_int, conf.level = 1- input$risque)[2],3)
    fin <- round(MeanCI(ech_int, conf.level = 1- input$risque)[3],3)
    # q1<- qnorm(1-(input$risque/2))
    # pchap <- 0.5
    # x<-(pchap*(1-pchap))/input$nb
    # # 
    # deb<-round(pchap-(q1*sqrt(x)),3)
    # fin<- round(pchap+(q1*sqrt(x)),3)
    # on plot 1/2 sans afficher les axes
    plot(1/2,0,xlim=c(deb-0.5,fin+0.5),pch="|",cex=2,axes=F,xlab="",ylab="",font.lab=2)
    # borne inferieure
    points(deb,0,bg="blue",pch="[",col="red",cex=2)
    # borne superieure
    points(fin,0,bg="green",pch="]", col="red",cex=2)
    # on fait apparaitre l'axe qu'on definit nous meme
    axis(side = 1,at = c(deb-1,deb,1/2,fin,fin+1),labels = c("",deb,1/2,fin,"") ,pos=0,xaxt="s")
    })
})