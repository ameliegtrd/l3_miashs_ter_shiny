
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
baccueil <- fluidRow(
    box(title = "Présentation TER", "Cette application, avec l'aide des packages nécessaires, est développée par :", br(),
        "BRIGNON Léa, CHU Hoang Viet, GOUTARD Amélie et GUINARD Florian.", br(),
        "Elle fait partie du projet de travail de recherche encadré par Laurent Rouvière.",status = "info",solidHeader = T,width=6),
    tabBox(
        title = "Sujet",
        height = "70vh",
        tabPanel("Sujet",
                 helpText("Cette application est l'application principale de notre projet TER. Elle est axée sur le Théorème Central Limite (TCL).",br(),
                 "Il permet de savoir vers quelle loi normal une somme tend en loi selon la loi que suivent les Xi de la moyenne."),
                 helpText("Il nous a parru intéressant de parler du TCL et de parler des outils qu'il permet de développer
        tels que l'interval de confiance par exemple.En effet, le TCL est très utile en Statistique mais pas seulement. Nous avons pû le retrouver tous au long de l'année 
        dans de différentes matières ce qui montre son importance.
        De plus, le TCL est utilisé pour trouver un interval de confiance ou encore pour approximer une intégrale.Nous nous sommes vites rendu compte que la 
        première application traiterait un peu plus de théorie que la seconde qui serait là en renfort de la première. Nous avons donc pris le parti de décrire le TCL d'un point de vu assez global
        avec une définition et une preuve. Nous avons ensuite, appliquer le TCL aux différentes lois usuelles de façon à voir clairement les TCL pour chaque loi. Nous avons ensuite réfléchi à 
        la façon d'étendre l'idée du TCL. Nous avons donc choisi de parler des intervals de confiance en sachant que le TCL est un outil indispensable pour les trouver."),
                 helpText("Pour plus de précisions sur les lois, vous pouvez aller voir la deuxième application.")),
        tabPanel("Motivations", 
                 "La première démonstration du Théorème Central Limite publiée en 1809 est due à Pierre-Simon de Laplace. Ce théorème est un modèle fondamental, sans lui il serait par exemple compliqué de trouver un intevral de confiane. 
                 Ce sont ces raisons qui nous ont motivé à choisir ce sujet plutôt qu'un autre")
        ),
    tabBox(
        title = "Shiny",
        height = "50vh",
        tabPanel("Qu'est ce que Shiny",
                 helpText("Shiny est un package qui permet de créer des applications pour le web dynamiques.En effet, à l'aide de d'un fichier ui et d'un fichier server il est possible de créer
                 une application comme celle que nous vous proposons. Il est également (et c'est le plus intéressant) de créer des outils intéractifs tels que des diagrammes ou des 
                 choix multiples qui enraînent différentes réponses"),
                 helpText("En outre, il est facile de mettre l'application en ligne et donc de la partager facilement ce qui rend l'utilité de ce package vraiment intéressant.")
        ),
        tabPanel("TCL avec shiny", 
            "Dans un premier temps, il a bien sûr fallu construire la base de l'application et réfléchir au contenu. Nous avons ensuite pu créer un histogramme permettant de voir 
            vers quoi convergeait chaque fonction en indiquant certains paramètres. Nous avons également pu créer des boxes  choix multiples ce qui rendaient le rendu des TCL plus intéractif en laissant
            le choix de la fonction à l'internaute. "
        )
    ),
    box(title = "Explications et difficultés", 
        helpText("Nous avons rencontrer quelques difficultées lors de la conception de cette application et il paraît intéressant de les lister. Tout d'abord,
                 il a fallut un temps d'adaptation pour comprendre comment fonctionnait Shiny. De plus, cette application nous a posé des problèmes particuliers."),
        helpText("En effet, nous trouvions que parler du TCL pouvait être très intéressant sachant que la seconde application pouvait apporter des informations plus précise sur chaque loi citée. Cependant, le TCl n'est pas un outils qui s'illustre 
        facilement. C'était donc la difficultée de cette application : trouver comment la rendre intéractive. Nous avons donc choisi de privilégier différents input pour les affichages et de mettre
        un histogramme lorsque c'était possible. Bien sûr,nous n'avons pas réussi à rendre cette application totalement intéractive, mais le but était de rendre une application à l'image de ce que nous avions 
        en tête"),status = "info",solidHeader = T,width=6)
)

body_source <- fluidRow(
    box(title = "Source", "Nous avons utilisés les sites suivants pour créer notre application :"),
    box(status = "warning", "Box content")
)


body_deftcl <- fluidRow(
    box(
        title = "Définition du TCL",status="warning",solidHeader = T,width=6,
        fluidPage(
            title = 'TCL définition',
            withMathJax(),
            helpText("Le TCL (Théoreme Central Limite) est le suivant :"),
            helpText("Soit (Xn)n∈N une suite de variables aléatoires indépendantes, 
            de même loi, et telles que \\(E(X_i^2)< +∞\\). On note \\(E(X_i)= \\mu\\ \\), \\(V(X_i)= \\sigma^2\\),
            \\(\\bar{X_n}\\) = \\(\\sum_{i=1}^nx_i\\). On a alors , quand \\(n \\rightarrow \\infty\\): "),
            helpText("$$\\sqrt{n}\\ \\cdot \\frac{\\bar{X_n}-\\mu}\\sigma \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1)\\!$$"))
    ),
    
    box(title ="Eléments de preuve",status="danger",solidHeader = T,width=12,
        fluidPage(
            title = 'MathJax TCL',
            withMathJax(),
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
    )
)


body_application_loi<-fluidRow(
    box(
        title = "Application aux lois",status="warning",solidHeader = T,width=10,
        fluidPage(
            Applicationloi("checkbox1","La loi de Bernoulli","input.checkbox1 == true","Exemple1"),
            Applicationloi("checkbox2","loi Exponentielle","input.checkbox2 == true","Exemple2"),
            Applicationloi("checkbox3","La loi Poisson","input.checkbox3 == true","Exemple3"),
            Applicationloi("checkbox4","La loi Uniforme continue","input.checkbox4 == true","Exemple4"),
            Applicationloi("checkbox5","La loi Gamma","input.checkbox5 == true","Exemple5"),
            Applicationloi("checkbox6","La loi du Khi-deux","input.checkbox6 == true","Exemple6"),
            Applicationloi("checkbox7","La loi Student","input.checkbox7 == true","Exemple7"),
            Applicationloi("checkbox8","La loi Fisher","input.checkbox8 == true","Exemple8")
        )
    ),
    box(title = "Preuve empirique",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dnorm"),solidHeader = T),
        box(title="Contrôle :",solidHeader = T,
            sliderInput(inputId = "moyenne",label = "Valeur de mu",min=-20,max=20, value = 0),
            sliderInput(inputId = "ecart_type",label = "Valeur de sigma",min=1,max=50, value = 1)
        )),
    
    box(
        title = "Delta méthode",status="warning",solidHeader = T,width=10,
        box(textInput(inputId = "idText", label = "Entrez une fonction appliquée à X barre", value = "")),
        box(selectInput(inputId = "idSelect", label = "Les variables de X barre suivent une loi: ", selected = 1,
                        choices = c("1" = 1, "2" = 2, "3" = 3))),
        fluidPage(
        helpText('Le TCL de Y est donc :'),
        conditionalPanel(condition = "input.idSelect==1", uiOutput(outputId = "selection"))
        )
        
    )
)

body_application_IC <- fluidRow(
    box(title = "A quoi peut sevir le TCL",width = 12,status = "info",solidHeader = T),
    box(title = "Pour les intervals de confiance",width = 6,status = "warning",solidHeader = T),
    box(title = "Pour les approximation d'intégrale",width = 6,status = "warning",solidHeader = T)
)





ui <- dashboardPage(skin = "red",
                    dashboardHeader(title="Application Shiny"),
                    # contenu de la barre de navigation
                    dashboardSidebar( 
                        sidebarMenu(
                            menuItem("Accueil", tabName = "accueil", icon = icon("chess")),
                            menuItem("Définition du TCL", tabName = "Définition_TCL", icon = icon("arrow-right")),
                            menuItem("Application aux lois", tabName = "Application_lois", icon = icon("arrow-right")),
                            menuItem("Interval de confiance", tabName = "Interval_confiance", icon = icon("arrow-right")),
                            menuItem("Sources", tabName = "sources", icon = icon("file"))
                        )
                    ),
                    # contenu de la page
                    dashboardBody(tags$link(rel = "stylesheet", type = "text/css", href = "style1.css"),
                                  tabItems(
                                      # page accueil
                                      tabItem(tabName = "accueil",baccueil
                                      ),
                                      
                                      # page tcl
                                      tabItem(tabName = "Définition_TCL",body_deftcl
                                      ),
                                      
                                      # page Application aux lois
                                      tabItem(tabName = "Application_lois",body_application_loi
                                      ),
                                      
                                      #page Application du TCL
                                      tabItem(tabName = "Interval_confiance",body_application_IC
                                      ),
                                      
                                      # page sources
                                      tabItem(tabName = "sources",body_source
                                      )
                                  )
                    )
)


