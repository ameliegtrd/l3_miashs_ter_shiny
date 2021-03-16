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
      helpText("Pour la loi Binomiale, on a donc un TCL qui est:"),
      helpText("\\(\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-p}{\\sqrt{p(1-p)}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\)    ou   \\(\\sqrt{n}\\ \\cdot (\\bar{X_n}-p) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,p(1-p))\\)"),
      helpText("quand \\(n \\rightarrow \\infty\\)"))
    
  })
  output$Exemple2 <- renderUI({
    withMathJax(
      helpText("Ce que tu dois faire"))
  })
})

