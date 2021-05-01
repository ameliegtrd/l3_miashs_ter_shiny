# le server retourne les objets a ui
# il declare et calcul les outputs
# c'est ici que sont executes les codes R qui servent a produire les outputs
# et a les mettre a jour en cas de changement dans les valeurs d'inputs

library(shiny)
library(shinydashboard)


# Define server logic required to draw a histogram
# les commandes de la fonction sont separees par des retours a la ligne

shinyServer(function(input, output, session) {
  
  output$Exemple1 <- renderUI({
    withMathJax(
      "Pour la loi de Bernoulli, on a donc un TCL qui est :
    $$ \\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-p}{\\sqrt{p(1-p)}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$
    ou
    $$ \\sqrt{n}\\ \\cdot (\\bar{X_n}-p) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,p(1-p)) $$
    quand \\( n \\rightarrow \\infty \\)"
    )
  })
  
  output$Exemple2 <- renderUI({
    withMathJax(
      "Pour la loi Exponentielle, on a donc un TCL qui est :
      $$ \\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-\\frac{1}{\\lambda}}{\\frac{1}{\\lambda}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$
      ou 
      $$ \\sqrt{n} \\cdot \\left(\\bar{X_n}-{\\frac{1}{\\lambda}} \\right) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,{\\frac{1}{\\lambda^2}} \\right) $$
      quand \\( n \\rightarrow \\infty \\)"
    )
  })
  
  output$Exemple3 <- renderUI({
    withMathJax(
      "Pour la loi Poisson, on a donc un TCL qui est :
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n}-\\lambda}{\\sqrt{\\lambda}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$  
      ou 
      $$ \\sqrt{n} \\cdot (\\bar{X_n}-\\lambda) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\lambda) $$
      quand \\( n \\rightarrow \\infty \\)"
    )
  })
  
  output$Exemple4 <- renderUI({
    withMathJax(
      "Pour la loi Uniforme continue, on a donc un TCL qui est :
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n}-{\\mathbb{E}(X)}}{\\sigma_{X}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$
      ou 
      $$ \\sqrt{n} \\cdot (\\bar{X_n}-{\\mathbb{E}(X)}) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\mathbb{V(X)}) $$
      Cependant, l'espérance et la variance dépendent de l'intervalle [a,b] sur lequel la fonction est définie. Par exemple, si [a,b] = [0,1] alors TCL:
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n}-\\frac{1}{2}}{\\sqrt{\\frac{1}{12}}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$ "
    )
  })
  
  output$Exemple5 <- renderUI({
    withMathJax(
      "Pour la loi Gamma, on a donc un TCL qui est :
      $$ si \\quad\\theta = 1 $$ 
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n} - p}{\\sqrt{p}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$    
      $$ ou \\quad si \\quad \\theta \\neq 1 $$
      $$ \\sqrt{n} \\cdot ( \\bar{X_n} - p  ) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,p) $$
      $$ alors \\quad TCL: $$
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n} - \\frac{p}{\\theta}} {\\sqrt{ \\frac{p}{\\theta^2} }} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$   
      $$ ou $$ 
      $$ \\sqrt{n} \\cdot \\left( \\bar{X_n} -\\frac{p}{\\theta} \\right) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,\\frac{p}{\\theta^2} \\right) $$ "
    )
  })
  
  output$Exemple6 <- renderUI({
    withMathJax(
      "Pour la loi Khi-deux à \\(n\\) degrés de liberté on a donc un TCL qui est :
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n} - n}{\\sqrt{2n}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$    
      ou 
      $$ \\sqrt{n} \\cdot (\\bar{X_n} - n) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,2n) $$"
    )
  })
  
  output$Exemple7 <- renderUI({
    withMathJax(
      "Pour la loi Student à \\(n\\) degrés de liberté (avec \\(n > 2 \\) )  on a donc un TCL qui est :
      $$ \\bar{X_n} \\cdot \\sqrt{n-2} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$    
      ou 
      $$ \\sqrt{n} \\cdot \\bar{X_n} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,\\frac{n}{n-2} \\right) $$"
    )
  })
  
  output$Exemple8 <- renderUI({
    withMathJax(
      "Pour la loi de Fisher à \\(m\\) et \\(n\\) degrés de liberté (avec \\(m > 4\\) )  on a donc un TCL qui est :
      $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n}-{\\frac{m}{m-2}}}{\\sqrt{\\frac{2m^2(n+m+2)}{n(m-2)^2(m-4)}}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$   
      ou 
      $$ \\sqrt{n} \\cdot \\left (\\bar{X_n}-\\frac{m}{m-2} \\right) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,\\frac{2m^2(n+m+2)}{n(m-2)^2(m-4)} \\right) $$"
    )
  })
  
  output$preuve <- renderPlot({
    échantillon <-rexp(10*input$n, input$lambda)
    matrice<- matrix(échantillon, nrow=input$n, ncol=10)
    vecteurmoy<- rowMeans(matrice)
    vecteur_de_moyenne<-(vecteurmoy-mean(vecteurmoy))/sd(vecteurmoy)
    hist(vecteur_de_moyenne,breaks = 45, main = "Histogramme de la preuve empirique" ,col = "lightblue", border = "black",freq=FALSE)

    grille.x <- seq(-max(échantillon), max(échantillon), length.out = 1000)
    y<-dnorm(grille.x,0,1)
    lines(grille.x, y, col="red",  lwd=2)
  })
  
  # pour delta methode affiche ce que l'utilisateur a ecrit
  output$selected_var <- renderText({
    paste("Vous avez choisi la fonction : ",input$idText)
  })
  
  output$selection <- renderUI({
    withMathJax(
      "\\( \\sqrt{n}\\ \\cdot (\\bar{X_n}-p) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N} \\left(0,p(1-p) \\right) \\)"
    )
  })
  
  output$ex_input <- renderText({
    input$ex_input
  })
  
  output$IC <- renderPlot({
    q1<- qbinom(input$risque/2,input$nb, 0.5)
    x<-(0.5*(1-0.5))/input$nb
    
    deb<-0.5-(q1*sqrt(x))
    fin<- 0.5+(q1*sqrt(x))
    
    plot(x=rep(2,1000), type="l")
    
    segments(deb,2, fin,2, col="red")
 
    
  })
  
})
