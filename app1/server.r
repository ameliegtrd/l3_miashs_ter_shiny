# le server retourne les objets a ui
# il declare et calcul les outputs
# c'est ici que sont executes les codes R qui servent a produire les outputs
# et a les mettre a jour en cas de changement dans les valeurs d'inputs

library(shiny)
library(shinydashboard)


# Define server logic required to draw a histogram
# les commandes de la fonction sont separees par des retours a la ligne

shinyServer(function(input, output, session) {
  
  output$ex1 <- renderUI({
    withMathJax(helpText('- De plus:  
                         $$\\varphi(0)=1,\\quad\\varphi^{\\prime}=0\\quad\\text{et}\\quad\\varphi{\\prime\\prime}(0)=-\\sigma^{2}$$'))
  })
  output$ex2 <- renderUI({
    withMathJax(
      helpText('- On deduit  
                $$\\varphi(u)=1-\\frac{\\sigma^{2}u^{2}}{2}+o\\left(u^{2}\\right)$$'),
      helpText('et 
               $$\\varphi_{Y_{n}}(t)=\\exp \\left(n \\log \\left(1-t^{2} / 2 n+\\mathrm{o}(1 / n)\\right)\\right)$$')
    )
    
  })
  output$ex3 <- renderUI({
    withMathJax(
      helpText('- Par consequent
               $$\\lim _{n \\rightarrow \\infty} \\varphi_{Y_{n}}(t)=\\exp \\left(-t^{2} / 2\\right)\\!$$'))
  })
  output$ex4 <- renderUI({
    withMathJax(
      helpText('et $$t\\mapsto \\exp \\left(-t^{2} / 2\\right)\\quad\\text{est la fonction caracteristique de la loi}\\quad\\mathcal{N}(0,1)$$ 
           '))
  })
  output$ex5 <- renderUI({
    withMathJax(
      helpText('- Dapres le theoreme de Paul Levy, on conclut 
               $$Y_{n} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\!$$'))
  })
  
  
  
  
  output$Exemple1 <- renderUI({
    withMathJax(
      helpText("Pour la loi de Bernoulli, on a donc un TCL qui est:"),
      helpText("\\(\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-p}{\\sqrt{p(1-p)}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)    ou   \\(\\sqrt{n}\\ \\cdot (\\bar{X_n}-p) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,p(1-p))\\)"),
      helpText("quand \\(n \\rightarrow \\infty\\)"))
    
  })
  output$Exemple2 <- renderUI({
    withMathJax(
      helpText("Pour la loi Exponentielle, on a donc un TCL qui est:"),
      helpText("\\(\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-\\frac{1}{\\lambda}}{\\frac{1}{\\lambda}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)    quand \\(n \\rightarrow \\infty\\) 
              $$ ou $$ \\(\\sqrt{n}\\ \\cdot (\\bar{X_n}-{\\frac{1}{\\lambda}}) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,{\\frac{1}{\\lambda^2}})\\)"),
      helpText(""))
    
  })
  output$Exemple3 <- renderUI({
    withMathJax(
      helpText("Pour la loi Poisson, on a donc un TCL qui est:"),
      helpText("\\(\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-{\\lambda}}{\\sqrt{\\lambda}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)    quand \\(n \\rightarrow \\infty\\) 
              $$ ou $$ \\(\\sqrt{n}\\ \\cdot (\\bar{X_n}-{\\lambda}) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\lambda)\\)"),
      helpText(""))
    
  })
  output$Exemple4 <- renderUI({
    withMathJax(
      helpText("Pour la loi Uniforme continue, on a donc un TCL qui est:"),
      helpText("\\(\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-{E[X]}}{\\sigma_X} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)    quand \\(n \\rightarrow \\infty\\) 
              $$ ou $$ \\(\\sqrt{n}\\ \\cdot \\bar{X_n}-{E[X]} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,V[X])\\)"),
      helpText("Cependant, l'esperance et la variance dependent de l'intervalle [a,b] sur lequel la fonction est definie. Par exemple si, [a,b] = [0,1] alors TCL:
               $$ \\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-{1/2}}{\\sqrt{1/12}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$ "))
    
  })
  output$Exemple5 <- renderUI({
    withMathJax(
      helpText("Pour la loi Gamma, on a donc un TCL qui est:
               $$ si \\quad\\theta = 1 $$"),
      helpText("\\(\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-{r/2}}{\\sqrt{r/2}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)     
              $$ ou $$ \\(\\sqrt{m}\\ \\cdot (\\bar{X_n}-{r/2}) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,r/2)\\)"),
      helpText("$$ si \\quad\\theta \\neq 1 , alors\\quad TCL: $$
               \\(\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-{r/\\theta}}{\\sqrt{r/\\theta}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)     
              $$ ou $$ \\(\\sqrt{n}\\ \\cdot (\\bar{X_n}-{r/\\theta}) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\frac{r}{\\theta^2})\\)"))
  })
  output$Exemple6 <- renderUI({
    withMathJax(
      helpText("Pour la loi Khi deux a m degres de liberte on a donc un TCL qui est:"),
      helpText("\\(\\sqrt{m}\\ \\cdot \\frac{\\bar{X_n}-{m}}{\\sqrt{m}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)    
              $$ ou $$ \\(\\sqrt{m}\\ \\cdot (\\bar{X_n}-{m}) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,2m)\\)"))
  })
  output$Exemple7 <- renderUI({
    withMathJax(
      helpText("Pour la loi Student avec m>2 on a donc un TCL qui est:"),
      helpText("\\(\\sqrt{m}\\ \\cdot \\bar{X_n}\\cdot\\sqrt{m-2} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)    
              $$ ou $$ \\(\\sqrt{m}\\ \\cdot \\bar{X_n} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\frac{m}{m-2})\\)"))
  })
  output$Exemple8 <- renderUI({
    withMathJax(
      helpText("Pour la loi de Fisher a m et m degre de liberte on a donc un TCL qui est:"),
      helpText("\\(\\sqrt{m}\\ \\cdot \\frac{\\bar{X_n}-{\\frac{m}{m-2}}}{\\sqrt{\\frac{2m^2(m+m+2)}{m(m-2)^2(m-4)}}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)    
              $$ ou $$ \\(\\sqrt{m}\\ \\cdot \\bar{X_n}-\\frac{m}{m-2} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\frac{2m^2(m+m+2)}{m(m-2)^2(m-4)})\\)"))
  })
  
  
  
  output$dnorm <- renderPlot({
    moyennes <-rnorm(1000,input$moyenne,((input$ecart_type)^2)/1000)
    bins <- seq(min(moyennes), max(moyennes), length.out = 101)
    hist(moyennes,breaks = bins, main = "Histogramme de la moyenne" ,col = "lightblue", border = "black",freq=FALSE)
    
    grille.x <- seq(min(moyennes), max(moyennes),length=1000)
    y<-dnorm(grille.x,input$moyenne,((input$ecart_type)^2)/1000)
    lines(grille.x,y,col="red",lwd = 2)
  })
  
  output$selection <- renderUI({
    withMathJax(
      helpText("\\(\\sqrt{n}\\ \\cdot (\\bar{X_n}-p) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,p(1-p))\\)"))
  })
  
})

