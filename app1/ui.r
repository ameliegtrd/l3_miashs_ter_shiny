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

delta<-function(fct){
    print(fct)
    xn<-sub("x", "xn", fct)
    mu<- sub("x", "lambda", fct)
    
    a<-paste(xn,mu,sep=" - ")
    a
}

# il faut separer les elements par des virgules

# contenu de la section accueil
baccueil <- fluidRow(
    box(title = "Présentation TER", background = "light-blue", height = "50%",
        "Cette application, avec l'aide des packages nécessaires, est développée par :", br(),
        " - BRIGNON Léa", br(), "- CHU Hoang Viet", br(), "- GOUTARD Amélie" , br(),"- GUINARD Florian.", br(),
        "Elle fait partie du projet de travail de recherche encadré par Laurent Rouvière."
        ),
    tabBox(
        title = "Sujet",
        tabPanel("Sujet",
                 "Cette application est l'application principale de notre projet TER. Elle est axée sur le Théorème Central Limite (TCL).",br(),
                 "Il permet de savoir vers quelle loi normale une somme tend en loi selon la loi que suivent les \\(X_i\\) de la moyenne.", br(),
                 "Ce théorème permet plusieurs choses, notamment de trouver un intervalle de confiance (IC) ou encore d'approximer une intégrale.
                 Cette application est plus 'théorique' que la seconde application portant sur les lois usuelles et qui est là comme support. 
                 Dans la section 'Définition du TCL' vous trouverez le TCL d'un point de vue assez global avec une définition et une preuve.
                 Dans la section 'Application aux lois' nous appliquons le TCL aux différentes lois usuelles de façon à voir clairement les TCL pour chaque loi.
                 Dans la section 'Intervalle de confiance' nous expliquons comment le TCL sert pour les IC et approximations d'intégrales.",br(),
                 "Pour plus de précisions sur les lois, vous pouvez aller voir la deuxième application."
                 ),
        tabPanel("Motivations", 
                 "La première démonstration du Théorème Central Limite, publiée en 1809, est due à Pierre-Simon de Laplace. 
                 Ce théorème est un modèle fondamental car sans lui, il serait par exemple compliqué de trouver un intervalle de confiance.",br(),
                 "En effet, l'intervalle de confiance est très utile car il permet, par exemple, de mesurer l'incertitude pendant une enquête ou 
                 étude de marché à partir d'un échantillon représentatif.",br(),
                 "Le TCL est ainsi très utile car il nous aide pour estimer la valeur de la moyenne inconnue d'une population à partir d'observation d'un échantillon.",br(),
                 "C'est pourquoi, outre le fait que nous avons pu retrouver ce théorème tout au long de notre cursus, nous avons choisi ce sujet."
                 )
    ),
    tabBox(
        title = "Shiny",
        tabPanel("Qu'est ce que Shiny",
                 "Shiny est un package développé par les équipes de RStudio et qui permet de créer des applications dynamiques pour le web. 
                 Une application Shiny est séparée en deux éléments : une partie 'UI' et une autre 'Server'. Pour mieux comprendre à quoi servent
                 ces parties, vous pouvez aller voir la première vidéo de la section 'Source' de cette application.",br(),
                 "Il est ainsi possible avec Shiny de réaliser toutes les analyses et actions qui sont disponibles sous R et de les afficher dans une
                 application sur le web ... sans avoir besoin de connaître les languages HTML, CSS et Javascript.",br(), ""
        ),
        tabPanel("TCL avec Shiny", 
            "Dans la section 'Application aux lois' nous avons créer des boxes à choix multiples ce qui rend le rendu des TCL à chaque lois usuelles
            plus interactif en laissant le choix de la fonction à l'internaute. Egalement, et toujours dans cette section, y figure un histogramme 
            permettant de voir vers quoi converge chaque fonction en faisant varier les paramètres \\( \\mu \\) et \\( \\sigma \\). ", br(),
            "A COMPLETER : SECTION INTERVALLE DE CONFIANCE, GRAPHIQUE"
        )
    ),
    box(title = "Explications et difficultés", background = "light-blue", height = "50%",
        "Nous avons rencontré quelques difficultés lors de la conception de cette application et il paraît intéressant de les lister. 
        Cette application, de nature plus 'théorique' que la seconde nous a posé des problèmes quant à son manque de dynamisme et d'interactivité
        avec l'utilisateur.", br(),
        "En effet, nous trouvions que parler du TCL pouvait être très intéressant sachant que la seconde application pouvait apporter des informations 
        plus précise sur chaque loi citée. Cependant, le TCl n'est pas un outil qui s'illustre facilement de façon dynamique.", br(),
        "Nous avons par exemple rencontré des difficultés avec la delta méthode. EXPLIQUER LES DIFFICULTES LORSQU'ON AURA FINI CETTE METHODE"
    )
)


# contenu de la section sources
bsources <- fluidRow(
    box(
        title = "Shiny en 2 minutes", background = "light-blue",
        HTML('<iframe width="100%" height="350" src="https://www.youtube.com/embed/HVa42mJYppE?t=25" 
             title="Shiny" frameborder="0" allow="accelerometer; autoplay; clipboard-write; 
             encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
    ),
    box(
        title = "Shiny Dashboards", background = "light-blue",
        HTML('<iframe width="100%" height="350" src="https://www.youtube.com/embed/41jmGq7ALMY" 
             title="Shiny" frameborder="0" allow="accelerometer; autoplay; clipboard-write; 
             encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
    ),
    box(
        title = "Documentation", background = "black",
        "RStudio documentation pour Shiny Dashboard : ",
        a("ici",href="https://rstudio.github.io/shinydashboard/structure.html",target="_blank"), br(),
        "RStudio documentation pour MathJax :", a("ici",href="https://shiny.rstudio.com/gallery/mathjax.html",target="_blank"),br(),
        "Moodle documentation pour notation Tex : ", a("ici",href="https://docs.moodle.org/3x/fr/Utilisation_de_la_notation_TeX",target="_blank"),br(),
        "DataStorm documentation pour rAmCharts :",a("ici",href="https://datastorm-open.github.io/introduction_ramcharts/index.html",target="_blank")
    )
)


body_deftcl <- fluidRow(
    box(title = "Définition du TCL",status="warning",solidHeader = T,width=6,
            "Le TCL (Théorème Central Limite) est le suivant :", br(),
            "Soit \\( (X_n)_{n \\in N}\\) une suite de variables aléatoires indépendantes de même loi, et telles que 
            \\( \\mathbb{E} \\left(X_{i}^{2} \\right) < +\\infty \\).",br(), 
            "On note \\( \\mathbb{E}(X_i) = \\mu, \\mathbb{V}(X_i) = \\sigma^2 \\) et \\( \\bar{X_n} = \\sum_{i=1}^{n} x_i \\).", br(), 
            "On a alors , quand \\( n \\rightarrow \\infty \\) : 
            $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n} - \\mu} \\sigma \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$"
        ),
    box(title ="Eléments de preuve",status="danger",solidHeader = T,width=12,
            "- On note \\( \\varphi \\) la fonction caractéristique des variables aléatoires \\( {X_n} - \\mu \\) et 
            $$Y_{n}=\\sqrt{n} \\cdot \\frac{\\bar{X_n}-\\mu}{\\sigma}$$
            - On obtient des propriétés de la fonction caractéristique :
            $$ \\varphi_{Y_{n}}(t) = \\left(\\varphi \\cdot \\left(\\frac{t}{\\sigma\\sqrt{n}} \\right) \\right)^{n} $$
            - De plus:  
            $$ \\varphi(0)=1,\\quad\\varphi^{\\prime}=0\\quad\\text{et}\\quad\\varphi{\\prime\\prime}(0)=-\\sigma^{2} $$
            - On deduit  
            $$ \\varphi(u)=1-\\frac{\\sigma^{2}u^{2}}{2}+ 0 \\left(u^{2} \\right) $$
            et 
            $$ \\varphi_{Y_{n}}(t)= \\exp \\left(n \\cdot  \\log \\left[ \\frac{1-t^{2}}{2n} + 0 \\left(\\frac{1}{n}\\right)\\right] \\right) $$  
            - Par consequent
            $$ \\lim\\limits _{n \\rightarrow \\infty} \\varphi_{Y_{n}}(t)= \\exp \\left( \\frac{-t^{2}}{2} \\right) $$
            et 
            $$ t\\mapsto \\exp \\left(-\\frac{t^{2}}{2} \\right) \\quad \\textrm{est la fonction caracteristique de la loi} \\quad \\mathcal{N}(0,1) $$ 
            - Dapres le theoreme de Paul Levy, on conclut :
            $$ Y_{n} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$"
        )
)

# contenu de la section application aux lois
body_application_loi<-fluidRow(
    box(
        title = "Application aux lois",status="warning",solidHeader = T,width=12,
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
        box(plotOutput("dnorm"),solidHeader = T
            ),
        box(title="Contrôle :", solidHeader = T,
            sliderInput(inputId = "moyenne",label = "Valeur de \\( \\mu \\) ",min=-20,max=20, value = 0),
            sliderInput(inputId = "ecart_type",label = "Valeur de \\( \\sigma \\) ",min=1,max=50, value = 1)
            ),
        box(title="Explication :",solidHeader = T,
            "Voici la représentation graphique de \\(X_n\\). Nous avons décider de ne pas laisser choisir le nombre d'observations \\(n\\) car pour 
            que le TCL soit correct il faut que le nombre d'observations \\(n\\) soit grand. Cela se répércute donc sur la représentation graphique 
            puisqu'il faut que \\(n\\) soit grand pour que \\(X_n\\) converge en loi vers une loi normale."
            )
        ),
    box(title = "Delta méthode",status="warning",solidHeader = T,width=12,
        box(solidHeader = T,textInput(inputId = "idText", label = "Entrez une fonction appliquée à \\(\\bar{X}\\)", value = "")
        ),
        box(solidHeader = T,selectInput(inputId = "idSelect", label = "Les variables de \\(\\bar{X}\\) suivent une loi: ", selected = 1,
                        choices = c("1" = 1, "2" = 2, "3" = 3))
        ),
        # pour delta methode recupere dans "selected_var" ce que l'utilisateur a ecrit
        mainPanel(
            textOutput("selected_var"),
            "Le TCL de Y est donc :",
            conditionalPanel(condition = "input.idSelect==1", uiOutput(outputId = "selection"))
        )
    )
)

# contenu de la section Interval de Confiance
body_application_IC <- fluidRow(
    box(title = "A quoi peut sevir le TCL",width = 12,status = "info",solidHeader = T),
    box(title = "Pour les intervalles de confiance",width = 6,status = "warning",solidHeader = T),
    box(title = "Pour les approximations d'intégrales",width = 6,status = "warning",solidHeader = T)
)





ui <- dashboardPage(skin = "red",
                    dashboardHeader(title="Application Shiny"),
                    # contenu de la barre de navigation
                    dashboardSidebar( 
                        sidebarMenu(
                            menuItem("Accueil", tabName = "accueil", icon = icon("chess")),
                            menuItem("Définition du TCL", tabName = "Definition_TCL", icon = icon("arrow-right")),
                            menuItem("Application aux lois", tabName = "Application_lois", icon = icon("arrow-right")),
                            menuItem("Intervalle de confiance", tabName = "Interval_confiance", icon = icon("arrow-right")),
                            menuItem("Sources", tabName = "sources", icon = icon("file"))
                        )
                    ),
                    # contenu de la page
                    dashboardBody(tags$link(rel = "stylesheet", type = "text/css", href = "style1.css"), withMathJax(),
                                  tabItems(
                                      # page accueil
                                      tabItem(tabName = "accueil",baccueil
                                      ),
                                      
                                      # page tcl
                                      tabItem(tabName = "Definition_TCL",body_deftcl
                                      ),
                                      
                                      # page Application aux lois
                                      tabItem(tabName = "Application_lois",body_application_loi
                                      ),
                                      
                                      #page Application du TCL
                                      tabItem(tabName = "Interval_confiance",body_application_IC
                                      ),
                                      
                                      # page sources
                                      tabItem(tabName = "sources",bsources
                                      )
                                  )
                    )
)
