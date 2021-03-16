# install.packages("anyLib")
# anyLib::anyLib(c("shiny", "shinydashboard", "shinyWidgets", "DT", "plotly", "ggplot2", "googleVis", "colourpicker"))

library(shiny)
library(shinydashboard)


## fonctions
Applicationloi<- function(x, y, z, k){
    fluidRow(
        checkboxInput(x, y, value = FALSE),
        column(
            width = 10,
            align = "center",
            conditionalPanel(
                condition = z,
                uiOutput(k)
            )
        )
    )
}


# il faut separer les elements par des virgules
body_exemple <- fluidRow(
    box(title = "Présentation", "Nous sommes Léa Brignon, Amélie Goutard, Florian Guinard et Hoang Viet et nous vous
        présentons notre Travail Encadré de Recherche"),
    box(status = "warning", "Box content")
)

body_source <- fluidRow(
    box(title = "Source", "Nous avons utilisés les sites suivants pour créer notre application :"),
    box(status = "warning", "Box content")
)


body <- fluidRow(
    box(
        title = "Définition du TCL", width = 8, solidHeader = TRUE,
        fluidPage(
            title = 'TCL définition',
            withMathJax(),
            helpText("Le TCL (Théoreme Central Limite) est le suivant :"),
            helpText("Soit (Xn)n∈N une suite de variables aléatoires indépendantes, 
            de même loi, et telles que \\(E(X_i^2)< +∞\\). On note \\(E(X_i)= \\mu\\ \\), \\(V(X_i)= \\sigma^2\\),
            \\(\\bar{X_n}\\) = \\(\\sum_{i=1}^nx_i\\). On a alors , quand \\(n \\rightarrow \\infty\\): "),
            helpText("$$\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-\\mu}\\sigma \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\!$$"))
    ),
    
    box(
        width = 4, background = "light-blue",
        "Pour comprendre le TCL il semble intéressant de comprendre également :"
    ),
    
    box(
        width = 12, solidHeader = TRUE,
        fluidPage(
            title = 'MathJax TCL',
            withMathJax(),
            helpText('- Elements de preuve '),
            helpText('- Bien que ce resultat soit impressionnant, on peut voir la preuve comme un "simple" exercice sur les fonctions la caracteristiques (voir [Jacod and Protter, 2003] pour des complements.'),
            helpText('- On note \\(\\varphi\\)
           la fonction carecteristique des variables aleatoires \\({X_n}-\\mu\\) et 
           $$Y_{n}=\\sqrt{n} \\cdot
            \\frac{\\bar{X_n}-\\mu}{\\sigma}$$'),
            helpText('- On obtient des proprietes de la fonction caracteristique :
           $$\\varphi_{Y_{n}}(\\theta)=(\\varphi \\cdot
          (\\frac{t}{\\sigma\\sqrt{n}}))^n\\cdot\\!$$'),
            uiOutput('ex1'),
            uiOutput('ex2'),
            uiOutput('ex3'),
            uiOutput('ex4'),
            uiOutput('ex5'),
        )
    ),
    
    box(
        title = "Application aux lois", width = 10, solidHeader = TRUE,
        fluidPage(
            Applicationloi("checkbox1","La loi Binomiale","input.checkbox1 == true","Exemple1"),
            Applicationloi("checkbox2","loi 2","input.checkbox2 == true","Exemple2")
        )
    )
)


ui <- dashboardPage(skin = "red",
                    dashboardHeader(title="Application Shiny"),
                    # contenu de la barre de navigation
                    dashboardSidebar( 
                        sidebarMenu(
                            menuItem("Accueil", tabName = "accueil", icon = icon("chess")),
                            menuItem("TCL", tabName = "tcl", icon = icon("arrow-right")), # icon th sinon
                            menuItem("Sources", tabName = "sources", icon = icon("file"))
                        )
                    ),
                    # contenu de la page
                    dashboardBody(tags$link(rel = "stylesheet", type = "text/css", href = "style1.css"),
                                  tabItems(
                                      # page accueil
                                      tabItem(tabName = "accueil",body_exemple
                                      ),
                                      
                                      # page tcl
                                      tabItem(tabName = "tcl",body
                                      ),
                                      
                                      # page sources
                                      tabItem(tabName = "sources",body_source
                                      )
                                  )
                    )
)





