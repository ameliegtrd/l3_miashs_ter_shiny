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
        "Dans le cadre du TER, nous avons réalisé deux applications. Vous pouvez aller voir la deuxième à partir du menu de naviguation de celle-ci.",br(),
        "Cette application aborde le Théorème Central Limite (TCL). La première démonstration du Théorème Central Limite, publiée en 1809, est due à Pierre-Simon de Laplace.
        Ce théorème permet de savoir vers quelle loi normale tend un vecteur de moyennes en fonction de la loi que suivent ses Xi.
        Ainsi, même si les échantillons suivent individuellement une autre loi de probabilité, nous savons que leur moyennes suivent une loi normale 
        Il est alors très utile car il nous aide pour estimer la valeur de la moyenne inconnue d'une population à partir d'observation d'un échantillon.",br(),
        "Prenons un exemple de la vie courante. Si on relève les salaires dans un grand nombre d'entreprises, la représentation graphique de leurs densités ne correspondrait pas à une loi gaussienne 
        car les valeures élevées étireraient la fonction de densité vers la droite. Or, si on représente la densité des moyennes des salaires de chaque entreprise,
        alors la courbe debrait ressembler à une courbe gaussienne.",
        br() , br(),
        "Dans la première section de l'application 'Définition du TCL' vous trouverez la définition du TCL et une preuve.", br(),
        "Dans la seconde section 'Application aux lois', la première box présente le TCL appliqué à chaque loi usuelles proposées. Il vous suffira de cocher la loi que vous voulez regarder pour voir son TCL. 
        Dans la seconde box, nous avons représenté la preuve empirique avec un histogramme pour la loi exponentielle. Vous pourrez faire varier la valeur du paramètre lambda et le nombre d'observations dans
        chaque échantillon. Vous remarquerez que plus le nombre d'observations est grand, plus la densité s'approche de celle d'une loi normale. 
        Dans la dernière box de cette section, nous appliquons la delta méthode à un nombre restreint de fonctions. Vous pourrez choisir parmis 3 fonctions et choisir quelle loi suivent les \\(X_i\\).
        Nous vous laissons le choix entre les lois : loi Binomiale et loi exponentielle. En effet, la delta méthode premet d'étendre le TCL. Entre outre, elle permet de savoir vers quelle loi normale tend une fonction appliquée à \\(\\bar{X_n}\\)."
        ,br() , br(),
        "Le TCL sert aussi à trouver un intervalle de confiance (IC). 
        En effet, il permet quelque soit les lois de se ramener à des règles gaussiennes et de trouver des intervalles de confiance asymptotique de façon plus simple.
        Dans le quotidien, les intervalles de confiances sont très utiles et servent pas exemple à mesurer l’incertitude dans des enquêtes ou des études de marché à partir d’échantillons.", br(),
        "Ainsi, la troisième section de cette application est porté sur le lien entre le TCL et les IC. 
        Vous y trouverez dans la première box une explication de ce lien. Dans la seconde ....
        Enfin, dans la dernière box nous avons représenté graphiquement l'évolution du TCL avec l'IC. (a developper quand on aura fini cette partie)"
        
    ),
    box(
        title = "Difficultés rencontrées", status = "warning", solidHeader = TRUE, width = 12,
        collapsible = TRUE, align="justify",
        "Enfin, nous avons rencontrer quelques difficultés lors de la conception de cette application.", br(),
        "Dans un premier temps, il a fallu nous habituer à travailler avec Shiny, un package que nous n'avions encore jamais utilisé. 
        Dans un second temps, il a fallu réfléchir à une façon de rendre notre application intéractive. 
        La première section n'est que théorique et pas intéractive mais indispensable pour la suite. ",br() , br(),
        "Ensuite, nous avons du réfléchir à une façon d'illuster le TCL car celui-ci n'est pas facile à illustrer.", br(),
        "Nous avons donc choisi d'illustrer la preuve empirique de TCL avec une loi et avons laisser le contrôle à l'utilisateur sur la valeur du paramètre et sur la taille des échantillons. 
        La partie sur la delta méthode nous a posé quelques problèmes car nous avions comme idée au départ de demandé à l'utilisateur de rentrer une fonction et de choisir qu'elle loi suivent les  \\(X_i\\)
        parmis 2 lois proposés. Cependant, cela aurait nécéssité au préalable que l'utilisateur utilise la même notation que nous utilisons dans R pour déclarer une fonction. 
        Nous avons finalement décidé de proposer 3 fonctions à l'utilasteur et de le laisser choisir parmis ces 3 fonctions.",br() , br(),
        "PARLER IC"
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
        id = "tabset1", height = "400px",
        tabPanel("Définition", "La delta méthode peut être très utile lorsque nous voulons trouver non pas vers vers qu'elle loi gaussienne
                 \\(\\bar{X_n}\\) tend lorsqu'on lui applique une fonction g(x). En effet, lorsque aucune fonction n'est appliquée à  \\(\\bar{X_n}\\), il suffit
                 de chercher le TCL comme nous l'avons vu précédemment. Dans le cas plus complexe, nous devons utiliser la Delta Méthode.",br() , br(),
                 "Voici donc la définition du TCL :",br() , br(),
                 "Soit \\( (X_n)_{n \\in N}\\) une suite de variables aléatoires et \\( (V_n\\)) une suite de réels tendant vers + \\(\\infty \\). Supposons qu'il existe un réel a et une vaiable X
                  tels que :
                 $$ V_n (X_n -a) \\stackrel{\\mathcal{L}}{\\rightarrow} X$$",
                 "Si g est une fonction dérivable au point a, alors :
                 $$ V_n (g(X_n) -g(a)) \\stackrel{\\mathcal{L}}{\\rightarrow}g'(a) X$$"
        ),
        tabPanel("Exemple détaillé", 
                 "- Comment obternier un TCL pour \\(\\frac{1}{\\bar{X_n}}\\) : la delta méthode permet d'y parvenir",br() , br(),
                 "On cherche donc le TCL pour \\(\\lambda\\) et non pas pour \\(\\frac{1}{\\lambda}\\)?", br(),
                 "$$\\sqrt{n}\\ \\cdot (\\frac{1}{\\bar{X_n}}-\\lambda) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(?,?)) $$", 
                 "$$\\sqrt{n}\\ \\cdot (g(\\bar{X_n})-g(\\frac{1}{\\lambda}))  \\stackrel{\\mathcal{L}}{\\rightarrow} g^{\\prime}(\\frac{1}{\\lambda})Y $$", 
                 "- Comme \\(\\lambda\\) ~ \\(\\mathcal{N}(0,\\frac{1}{\\lambda^{2}})\\) : on en déduit :", br(),
                 "\\(E(-\\lambda^{2}Y)= -\\lambda^{2} E(Y) = 0 \\)", br(),
                 "\\(V(-\\lambda^{2}Y)= \\lambda^4 V(Y) = \\lambda^{2} \\)", br(),
                 "$$ \\sqrt{n}\\ \\cdot (\\frac{1}{\\bar{X_n}}-\\lambda) \\stackrel
                 {\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,\\lambda^{2})\\ $$"
                 
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
        title = "Définition de l'intervalle de confiance", width = 12,status = "info",solidHeader = T,
        "Soit un échantillon de variables indépendantes et identiquement distribuées de loi \\(P_\\theta\\) avec \\(\\theta\\) \\(\\in\\) \\(\\Theta\\) inconnu et un risque \\(\\alpha\\) \\(\\in\\) ]0,1[.", br(),
        "On appelle intervalle de confiance pour \\(\\theta\\) tout intervalle de la forme \\([A_n,B_n]\\), où \\(A_n\\) et \\(B_n\\) sont des fonctions telles que : ",
        "$$ P( \\theta \\in [A_n,B_n])= 1- \\alpha$$",
        "Si la limite de \\(P(\\theta \\in [A_n,B_n])\\)  vaut \\(1-\\alpha\\), on dit que \\([A_n,B_n]\\) est un intervalle de confiance asymptotique pour \\(\\theta\\) au niveau \\(1-\\alpha\\)"
    ),
    box(
        title = "Intervalle de confiance asymptotique et lien avec le TCL",width = 12,status = "warning",solidHeader = T,
        "Nous avez décrit ce qu'est l'intervalle de confiance. Il faut maintenant décrire le lien en l'intervalle de confiance et le TCL.
        En effet, le TCL d'une loi permet de déduire l'intervalle de confiance asymptotique de cette loi.", br(),
        "Dans un premier temps, le TCL nous permet d'avoir une base de départ. Grâce à l'estimateur nous savons que nous pouvons remplacer \\(\\bar{X_n}\\) par son estimateur.
        Par exemple, si nous cherchons l'intervalle de confiance pour des \\(X_i\\) qui suivent une loi de Bernoulli l'estimateur est Pnchap.
        Nous pouvons voir ci-dessous le développement qui permet de trouver cet intervalle de confiance. 
        Nous voyons bien que le TCL est l'élément principal qui permet de commencer la construction de l'intervalle de confiance.",br(),
        "Dans un second temps, les \\(X_i\\) suivant une loi de Bernoulli dans notre exemple, alors nous pouvons utiliser l'approximation donnée par le TCL.
        Nous cherchons donc le quantile d'ordre \\( 1-\\alpha/2 \\) de la loi normale centrée réduite.",br(), br(),
        
        "Si nous regardons un exemple de construction d'un Intervalle de confiance asymptotique pour une proportion p",br(),
        "Soit \\({X_1}...{X_n}\\) i.i.d de loi \\(\\mathcal{B}(p)\\)",br(),br(),

        "Contruction de l'IC",br(),
        "On sait que l'estimateur est \\(\\hat{p}_{n}=\\bar{X}_{n}\\) et donc grâce au TCL on peut dire que :",
        "$$ \\sqrt{n}\\ \\cdot \\frac{\\hat{p}_{n} -p}{\\sqrt{p(1-p)}} \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,1) $$",
        
    
        "On trouve facilement la loi asymtotique de l'estimateur:",br(),
        "$$\\sqrt{n}\\ \\cdot (\\hat{p}_{n}-{p}) \\stackrel{\\mathcal{L}}{\\rightarrow} \\mathcal{N}(0,p(1-p))$$",br(),
        "On en déduit",
        "$$\\mathcal{P}\\ (\\hat{p}_{n}-{q}_{1-\\frac{\\alpha}{2}}{\\sqrt{\\frac{p(1-p)}{n}}} \\leq \\mu \\leq
        \\hat{p}_{n}+{q}_{1-\\frac{\\alpha}{2}}{\\sqrt{\\frac{p(1-p)}{n}}}) \\stackrel{\\mathcal{}}{\\rightarrow} 1-\\alpha $$",
        "Grâce à Slutsky (que nous ne détaillerons pas), nous pouvons conclure qu'un intervalle de confiance asymtotique de niveau 1-\\(\\alpha\\) est donné par :",
        "$$[\\hat{p}_{n}-{q}_{1-\\frac{\\alpha}{2}}{\\sqrt{\\frac{\\hat{p}_{n}(1-\\hat{p}_{n})}{n}}},\\hat{p}_{n}+{q}_{1-\\frac{\\alpha}{2}{\\sqrt{\\frac{\\hat{p}_{n}(1-p)}{n}}})]$$",
        "n = 500 observation issues d'une loi \\(\\mathcal{B}(p)\\)"
    ),
    box(
        title = "Représentation graphique de l'évolution du TCL",width = 12,status = "info",solidHeader = T,
        box(
            plotOutput("IC"),solidHeader = T
        ),
        box(
            title="Contrôle :", solidHeader = T,
            sliderInput(
                inputId = "risque",label ="Le rique : \\(\\alpha \\) ",min=0.05,max=0.99, value = 0.05
            ),
            sliderInput(
                inputId = "nb",label = "Nombre d'obervations",min=1,max=1000, value = 1
            ),
            box(
                title="Explication :",solidHeader = T, align="justify",width = 12,
                "Nous avons décider de représenter l'intervalle de confiance pour une proportion lorsque les \\(X_i\\) suivent une loi de Bernoulli.", br(),br(),
                "Nous avons décrit ci-dessus la façon de trouver cet intervalle de confiance. Il paraissait donc intéressant de montrer comment ce dernier évolue en 
                fonction du nombre d'observations et du risque \\(\\alpha \\).", br(),
                "Nous remarquons donc que plus le risque est grand, plus l'intervalle est petit. En effet, plus le risque est grand, plus nous autorisons le risque que
                \\(\\mu \\) soit en dehors de l'intervalle.", br(),
                "Le pénomène est le même lorsque le nombre d'échantillons est grand. "
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
