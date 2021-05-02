# install.packages("anyLib")
# anyLib::anyLib(c("shiny", "shinydashboard", "shinyWidgets", "DT", "plotly", "ggplot2", "googleVis", "colourpicker"))

# library
library(shiny)
library(shinydashboard)


# fonctions
# box application aux lois
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

# box delta methode
Deltamethode<- function(z, k){
    fluidRow(
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



# contenu de la section accueil
baccueil <- fluidRow(
    box(
        title = "Présentation du TER", status = "primary", solidHeader = TRUE, width = 12,
        collapsible = TRUE, align="justify",
        "Nous sommes quatre étudiants en troisième année de licence MIASHS (Mathématiques et 
        Informatique Appliquées aux Sciences Humaines et Sociales) à l'Université de Rennes 1 et Rennes 2.",br(),br(),
        box(
            status="primary",solidHeader = TRUE,align="center",
            "BRIGNON Léa"
        ),
        box(
            status="primary",solidHeader = TRUE,align="center",
            "CHU Hoang Viet"
        ),
        box(
            status="primary",solidHeader = TRUE,align="center",
            "GOUTARD Amélie"
        ),
        box(
            status="primary",solidHeader = TRUE,align="center",
            "GUINARD Florian"
        ),
        "Cette application fait partie du projet de travail de recherche encadré par Laurent Rouvière.
        Il consiste au développement d'une application web avec RShiny afin de présenter un thème statistique."
    ),
    box(
        title = "Qu'est-ce que Shiny", status = "warning", solidHeader = TRUE, width = 12,
        collapsible = TRUE, align="justify",
        "Shiny est un package R, développé par RStudio et qui permet de créer des applications web dynamiques et interactives. 
        Il est ainsi possible de réaliser les mêmes analyses et actions disponibles sous R. Sa principale force est qu'il devient 
        alors possible de représenter sur le web les données obtenues avec un programme R sans avoir a connaître les languages HTML, CSS et Javascript.", br(),
        "Une application Shiny a besoin d'une partie 'UI' et d'une partie 'Server' pour fonctionner. La partie UI regroupe les éléments de 
        mise en forme et d'affichage de l'interface utilisateur. Elle affiche donc des entrées, appellées 'inputs' et des sorties, appelées 'outputs'. 
        La partie Server execute les codes R qui servent à produire les outputs. C'est cette même partie qui met à jour les valeurs d'inputs 
        en cas de changement de celle-ci. C'est pour cela que les résultats qui sont fournis sont réactifs.",br(), br(),
        box(background="yellow", width = 12, solidHeader = TRUE,
            textInput("ex_input", label = h4("Par exemple"), value = "Ecrivez quelque chose ..."),
            h4("Vous avez écrit :  ") ,textOutput("ex_input")
        ),
        "Vous avez saisi une entrée (input) qui a été envoyé au serveur. Le serveur a produit la sortie (output) et l'a renvoyé à l'UI qui l'a affiché.",br(),
        "Plus généralement, l'UI prend en entrée des inputs et des valeurs qui sont envoyées au serveur. Celui-ci les créer, les mets à jour,
        les calculs si nécessaire et les renvoie à l'UI. L'UI peut donc afficher les outputs et les objets."
    ),
    box(
        title = "Sujet appliqué à Shiny", status = "success", solidHeader = TRUE, width = 12,
        collapsible = TRUE, align="justify",
        "Cette application est l'application principale de notre projet TER. Cette application est axée sur le Théorème Centrale Limite (TCL). Il parait donc intéressant 
        de définir ce qu’est ce théorème et à quoi il sert. Le TCL permet  de savoir vers quelle loi normale tend un vecteur de moyennes en fonction de la loi que suivent ses \\(X_i\\) 
        Il sert notamment à trouver un intervalle de confiance (IC) ou encore à approximer une intégrale. En outre, la première démonstration du Théorème Central Limite, publiée en 1809, 
        est due à Pierre-Simon de Laplace.",br() , br(),
        "Le TCL est ainsi très utile car il nous aide pour estimer la valeur de la moyenne inconnue d'une population à partir d'observation 
        d'un échantillon. C'est pourquoi, outre le fait que nous avons pu retrouver ce théorème tout au long de notre cursus, nous avons choisi ce sujet.",br() , br(),
        "Dans la vie courante le TCL peut être utile. Par exemple, si on relève un grand échantillon de salaires dans une entreprise, la représentation 
        graphique ne correspondrait pas à une loi gaussienne car la fonction de densité serait étirée vers la droite. Il est donc intéressant de représenter 
        les salaires moyens qui donneront une représentation d’une loi vraisemblablement gaussienne. ",br() , br(),
        "Nous allons maintenant d’écrire le contenu de l’application. Dans la section 'Définition du TCL' vous trouverez le TCL d'un point de vue assez 
        global avec une définition, un contre-exemple et une preuve. Dans la section 'Application aux lois', nous appliquons le TCL aux différentes lois 
        usuelles de façon à voir clairement les TCL pour chaque loi. Nous avons également décidé de mettre une preuve empirique du TCL pour la loi de Bernoulli 
        dans le but de prouver à l’aide d’une représentation graphique qu’un vecteur contenant les moyennes de \\(X_i\\) suivant une loi de Bernoulli tend vers une loi normale. 
        Il nous a ensuite paru intéressant de faire quelques rendu de TCL à l’aide de la delta méthode qui est très liée avec le TCL. En effet, cela permet de savoir vers quelle 
        loi normale tend une fonction appliquée à \\(\\bar{X_n}\\) ",br() , br(),
        "Enfin, nous avons pris le parti de développer l’Intervalle de Confiance et son lien avec le TCL. En effet, le TCL est un outil très utile pour trouver des intervalles 
        de confiances (développer).En effet, il permet quelque soit les lois de se ramener à des règles gaussiennes et de trouver des intervalles de confiance asymptotique de façon plus simple.
        Dans le quotidien, les intervalles de confiances sont très utiles et servent pas exemple à mesurer l’incertitude dans des enquêtes ou des études de marché à partir d’échantillons. (rajouter difficultées)"
        ,br() , br(),
        "Enfin, nous avons rencontrer quelques difficultés lors de la conception de cette application. Dans un premier temps, il a fallu nous abituer à travailler avec Shiny, un package que nous n'avions
        encore jamais utilisé. Dans un second temps, il a fallu réfléchir à une façon de rendre notre application intéractive. En effet, Le TCL n'est pas le sujet le plus simple à illustrer si l'on veut rendre cela intéractif. 
        Il a par exemple fallu construire la première page qui n'est que théorique mais indispensable pour la suite. Nous avons ensuite pû faire une preuve empirique du TCL de façon intéractive. Il n'était pas facile de toruver 
        comment démontrer cela mais nous nous sommes basée sur une seule loi et le résultat final était intéractif comme nous le voulions. Il y a également une partie sur la delta méthode qui permet de montrer ce que peut donner le TCL
        en fonction de différentes fonctions appliquées à XNbarre. PARLER IC"
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


# contenu de la section definition du tcl
body_def_tcl <- fluidRow(
    box(
        title = "Définition du TCL",status="warning",solidHeader = T,width=6, align="justify",
        "Le TCL (Théorème Central Limite) est le suivant :", br(),
        "Soit \\( (X_n)_{n \\in N}\\) une suite de variables aléatoires indépendantes de même loi, et telles que 
            \\( \\mathbb{E} \\left(X_{i}^{2} \\right) < +\\infty \\).",br(), 
        "On note \\( \\mathbb{E}(X_i) = \\mu, \\mathbb{V}(X_i) = \\sigma^2 \\) et \\( \\bar{X_n} = \\frac{1}{n} \\sum_{i=1}^{n} X_i \\).", br(), 
        "On a alors , quand \\( n \\rightarrow \\infty \\) : 
            $$ \\sqrt{n} \\cdot \\frac{\\bar{X_n} - \\mu} \\sigma \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$"
        ),
    
    box(
        title ="Eléments de preuve",status="info",solidHeader = T,width=6, 
        "contre exemple"
        ),
    
    box(
        title ="Eléments de preuve",status="danger",solidHeader = T,width=12, align="justify",
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
            Applicationloi("checkbox1","La loi de Bernoulli","input.checkbox1 == true","ex_bernoulli"),
            Applicationloi("checkbox2","loi Exponentielle","input.checkbox2 == true","ex_exp"),
            Applicationloi("checkbox3","La loi Poisson","input.checkbox3 == true","ex_poisson"),
            Applicationloi("checkbox4","La loi Uniforme continue","input.checkbox4 == true","ex_unif"),
            Applicationloi("checkbox5","La loi Gamma","input.checkbox5 == true","ex_gamma"),
            Applicationloi("checkbox6","La loi du Khi-deux","input.checkbox6 == true","ex_khid"),
            Applicationloi("checkbox7","La loi Student","input.checkbox7 == true","ex_student"),
            Applicationloi("checkbox8","La loi Fisher","input.checkbox8 == true","ex_fisher")
            )
        ),
    box(
        title = "Preuve empirique avec la loi exponentielle",width = 12,status = "info",solidHeader = T,
        box(
            plotOutput("preuve"),solidHeader = T
            ),
        box(
            title="Contrôle :", solidHeader = T,
            sliderInput(inputId = "lambda",label = "Valeur de \\( \\lambda \\) ",min=0.1,max=20, value = 0),
            sliderInput(inputId = "n",label = "Nombre d'obervations dans chaque échantillon ",min=2,max=10000, value = 100)
            ),
        box(
            title="Explication :",solidHeader = T, align="justify",
            "Nous avons pris le parti de montrer graphiquement la preuve empirique du TCL à l'aide de la loi exponentielle.
            Nous avons construit une matrice composée de différents échantillons aléatoires de la loi exponentielle puis nous avons créer
            un vecteur composé des moyennes de chaque ligne de la matrice (donc de différents échantillons). 
            L'intérêt ici est que vous pouvez faire varier \\(\\lambda \\) et le nombre d'observations \\( n\\) qu'il y a dans chaque échantillon. 
            Vous remarquerez que le TCL marche que quand \\( n\\) est grand.",br(),
            "En effet, il faut avoir un grand nombre d'échantillons pour que les moyennes suivent une loi normale. 
            Si nous faisons la moyenne que d'une variable par exemple, alors celle-ci ne sera pas significative et vaudra la valeur de départ, 
            qui elle ne suit pas une loi normale."
            )
        ),
    tabBox(
        title = "Qu'est-ce que la delta méthode ?",
        id = "tabdelta", width=12,
        tabPanel(
            "Définition", 
            "Texte def",br(),
            "Expliquer à quoi elle sert en language français ? 
            Parce que la définition c'est bien mais c'est cool si on explique avec des mots aussi non ? "
            ),
        tabPanel(
            "Exercice", 
            "Texte exo"
            )
    ),
    box(
        title = "Application de la Delta méthode",status="warning",solidHeader = T,width=12,
        fluidPage(
            box(
                solidHeader = T, width=6,
                selectInput(
                    inputId = "id1", label = "Choisissez une fonction à appliquer à \\( \\bar{X}\\) :", selected = 1, 
                    choices = c("1/x" = 1, "x^2" = 2, "ln(x)" = 3)
                ),
                selectInput(
                    inputId = "id2", label = "Les variables de \\(\\bar{X}\\) suivent une loi :", selected = 1, 
                    choices = c("Loi binomiale" = 1, "Loi exponentielle" = 2)
                )
            ),
            box(
                solidHeader = T,width=6, align="center",
                Deltamethode("input.id1 == 1 & input.id2==1 ","inv_bin"), 
                Deltamethode("input.id1 == 1 & input.id2==2 ","inv_exp"), 
                Deltamethode("input.id1 == 2 & input.id2==1 ","carre_bin"), 
                Deltamethode("input.id1 == 2 & input.id2==2 ","carre_exp"), 
                Deltamethode("input.id1 == 3 & input.id2==1 ","ln_bin"), 
                Deltamethode("input.id1 == 3 & input.id2==2 ","ln_exp")
                )
        )
    )
)

# contenu de la section Interval de Confiance
body_application_IC <- fluidRow(
    box(
        title = "Le lien entre le TCL et les Intervalles de Confiances", width = 12,status = "info",solidHeader = T
        ),
    box(
        title = "Pour les intervalles de confiance",width = 12,status = "warning",solidHeader = T
        ),
    box(
        title = "Représentation graphique de l'évolution du TCL",width = 12,status = "info",solidHeader = T,
        box(
            plotOutput("IC"),solidHeader = T
            ),
        box(
            title="Contrôle :", solidHeader = T,
            sliderInput(
                inputId = "risque",label ="Le rique : 1-\\( \\alpha \\) ",min=0.1,max=0.99, value = 0.95
                ),
            sliderInput(
                inputId = "nb",label = "Nombre d'obervations",min=1,max=1000, value = 100
                )
            )
        )
)





ui <- dashboardPage(skin = "red",
                    dashboardHeader(
                        title="Théorème Central Limite",
                        titleWidth = 300
                        ),
                    # contenu de la barre de navigation
                    dashboardSidebar( 
                        sidebarMenu(
                            menuItem(
                                "Accueil", tabName = "accueil", icon = icon("chess")
                                ),
                            menuItem(
                                "Définition du TCL", tabName = "def_tcl", icon = icon("arrow-right")
                                ),
                            menuItem(
                                "Application aux lois", tabName = "applications_lois", icon = icon("arrow-right")
                                ),
                            menuItem(
                                "Intervalle de confiance", tabName = "interval_confiance", icon = icon("arrow-right")
                                ),
                            menuItem(
                                "Sources", tabName = "sources", icon = icon("file")
                                ),
                            menuItem(
                                "Application lois usuelles", icon = icon("file-code"),href="https://ter-shiny-miashs.shinyapps.io/app2/"
                            )
                        )
                    ),
                    # contenu de la page
                    dashboardBody(tags$link(rel = "stylesheet", type = "text/css", href = "style1.css"), withMathJax(),
                                  tabItems(
                                      # page accueil
                                      tabItem(tabName = "accueil",baccueil
                                              ),
                                      
                                      # page tcl
                                      tabItem(tabName = "def_tcl",body_def_tcl
                                              ),
                                      
                                      # page Application aux lois
                                      tabItem(tabName = "applications_lois",body_application_loi
                                              ),
                                      
                                      #page Application du TCL
                                      tabItem(tabName = "interval_confiance",body_application_IC
                                              ),
                                      
                                      # page sources
                                      tabItem(tabName = "sources",bsources
                                              )
                                  )
                    )
)
