# ui cree des variables disponibles dans le server, il declare des inputs
# il gere la structure de la page, avec le placement des outputs
# regroupe les elements de mise en forme et d'affichage, affiche des inputs et outputs

# install.packages("anyLib")
# anyLib::anyLib(c("shiny", "shinydashboard", "shinyWidgets", "DT", "plotly", "ggplot2", "googleVis", "colourpicker"))

library(shiny)
library(shinydashboard)

# il faut separer les elements par des virgules


# contenu de la section accueil
baccueil <- fluidRow(
    box(
        title = "Présentation du TER", status = "primary", solidHeader = TRUE, width = 12,
        collapsible = TRUE,
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
        title = "Qu'est-ce que Shiny", status = "warning", solidHeader = TRUE, width = 12,align="justify",
        collapsible = TRUE,
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
        title = "Sujet appliqué à Shiny", status = "success", solidHeader = TRUE, width = 12, align="justify",
        collapsible = TRUE,
        "Cette application porte sur les Lois Usuelles. 
        Les lois de probabilités décrivent le comportement aléatoire d'un phénomène dépendant du hasard.",br(),
        "On considère une variable aléatoire \\(X\\) comme un objet mesurant le résultat d'une expérience aléatoire.
        Ces variables peuvent être discrètes ou continues.",br(),br(),
        box(
            status="success",solidHeader = TRUE,width=6, height=150,
            "Une variable aléatoire réelle \\(X\\) a valeurs dans un ensemble \\( \\mathcal{X}\\) fini ou dénombrable est appelée variable aléatoire
            réelle discrète. Dans ce cas, la loi de \\(X\\) est déterminée par l'ensemble des probabilités :
            $$ \\mathbb{P}_X(x) = \\mathbb{P}(X = x), \\quad x \\in \\mathcal{X} $$"
        ),
        box(
            status="success",solidHeader = TRUE,width=6,height=150,
            "Soit \\(X\\) une variable aléatoire réelle qui prend un nombre infini non dénombrable de valeurs. 
            Si \\(F_X\\) est une fonction continue, on dit que \\(X\\) est une variable aléatoire réelle continue. 
            Dans ce cas, la loi de \\(X\\) est déterminée par l'ensemble des probabilités :
            $$ \\mathbb{P}(a < X < b), \\quad \\forall \\, a<b $$"
        ),
        "Ainsi, en statistique, on essaie de déterminier de manière plus ou moins précise la loi \\(F\\) de \\(X\\).
        Pour y parvenir, on réalise un nombre de répétitions indépendantes de l'expérience conduisant à \\(X\\). 
        On génère ainsi un échantillon de valeurs issues de la loi de \\(F\\).",br(),
        "De cette façon, les lois de probabilité permettent d'illustrer des situations du quotidien.
        Par exemple, elles sont utilisées pour prédire les caractéristiques d'une population inconnue à partir des 
        statistiques déterminées dans un échantillon représentatif de la popualtion en question.",br(),br(),
        box(title = "Par exemple", width = 12, solidHeader = T, collapsible = T, collapsed = T, background = "green",
            "Prenons l'exemple des élections présidentielles en France. Suite au premier tour, deux candidats s'affrontent lors du second tour. 
            Un sondage auprès d'environ 1000 électeurs est réalisé. Ce sondage génère un échantillon du vote de 1000 électeurs, 
            sur une population de plusieurs millions.L'objectif est de prédire à partir de cet échantillon, quel candidat va remporter le plus de sufrages.
            Pour ce faire, on détermine la loi que suivent les variables aléatoires. On pourrai approximer par la loi binomiale et se reporter grâce 
            au Théorème Central Limite à une loi gaussienne."
            ),
        "Cette application recense les différentes lois usuelles. Pour chacune d'entre elles, il est rensigné sa définition et ses moments d'ordre 1 et 2.
        Pour chaque loi, nous avons représenté un échantillon de variables aléatoires suivant la loi en question.",br(),
        "Pour les lois discrètes (binomiale et poisson),",br(),
        "Pour les lois continues (les autres), ",br(),
        "Pour toutes ces lois, l'intérêt des représentations graphiques est le panneau 'Contrôle'.
        Il permet de faire varier la taille de l'échantillon et les paramètres de la loi en question.
        L'objectif est d'observer le comportement de la loi en fonction de ses paramètres.",br(),
        "Vous pourrez remarquer que plus la taille de l'échantillon est grande, plus vous gagner en précision et plus la densité 
        ressemble une densité gaussienne. Ce phénomène est expliqué dans la seconde application axée sur le Théorème Central Limite, 
        que vous pouvez aller voir à partir du menu de naviguation."
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


# contenu de la section definition de la loi normale
bnorm <- fluidRow(
    box(title = "Loi Normale",status="danger",solidHeader = T,width=6,
        "\\(X\\) suit une loi normale d'espérance \\(\\mu\\)  et de variance \\(\\sigma^2\\) si 
        sa densité est donnée par la fonction : 
        $$ f_X(x) =\\frac{1}{\\sqrt{2\\pi\\sigma^2}} \\cdot \\frac{-(x-\\mu)^2}{2\\sigma^2} $$
        On note \\(X\\) \\(\\sim\\)  \\(\\mathcal{N}(\\mu,\\sigma^2)\\).", br(),
        "Attention, on ne peut pas calculer explicitement la fonction de répartition. C'est pour cela
        qu'on se ramène à la loi normale centrée-réduite."
        ),
    box(title = "Loi Normale centrée réduite", status = "warning", solidHeader = T,width=6,
        " Soit \\(F\\) une fonction de répartition de \\(\\mathcal{N}(0,1)\\). On a \\(F(-x)\\) = 
        \\(-F(x)\\), \\(\\forall\\) \\(x\\) \\(\\in\\) \\(\\mathbb{R}\\).", br(), 
        " Soient \\(X\\) \\(\\sim\\) \\(\\mathcal{N}(\\mu,\\sigma^2)\\), \\(a\\) \\(\\in\\) \\(\\mathbb{R}^+\\) 
        et \\(b\\) \\(\\in\\) \\(\\mathbb{R}\\).  Alors  \\(aX+b\\) \\(\\sim\\) \\(\\mathcal{N}(a\\mu +b,a^2\\sigma^2)\\).", br(), 
        "En particulier, avec \\(a\\) = \\( \\frac{1}{\\sigma} \\) et \\(b\\) = \\( \\frac{-\\mu}{\\sigma^2} \\), 
        on a : $$ Z = \\frac{X -\\mu}{\\sigma} \\sim  \\mathcal{N}(0,1)$$
        La variable aléatoire \\(Z\\) suit une loi normale d'espérance nulle et de variance 1, dite loi normale centrée réduite,
        de densité : $$ f_Z(z) =\\frac{1}{\\sqrt{2\\pi}} \\cdot \\exp{\\left (\\frac{-z^2}{2} \\right)} , \\; \\forall z \\in \\mathbb{R} $$"
        ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dnorm"), solidHeader = TRUE),
        box(title="Contrôle :", solidHeader = TRUE,
            sliderInput(inputId = "ech1", label = "Taille de l'échantillon",min = 2, max = 10000, value = 1000),
            sliderInput(inputId = "bins",
                        label = "Nombre de classes",
                        min=1, max = 50,value = 30),
            sliderInput(inputId = "moyenne",label = "Valeur de \\(\\mu\\)",min=-20,max=20, value = 0),
            sliderInput(inputId = "ecart_type",label = "Valeur de \\(\\sigma\\)",min=1,max=50, value = 1)
        )
    )
)

# contenu de la section definition de la loi binomiale
bbin <- fluidRow(
    box(title = "Loi Binomiale",status="danger",solidHeader = T,width=12,
        "On considère \\(n\\) tirages équiprobables indépendants dans une population composée de deux types d'éléments,
        le premier en proportion \\(p\\), le second en proportion \\(q = 1-p\\). Soit \\(X\\) le nombre d'éléments du
        premier type présents dans l'échantillon de taille \\(n\\) ainsi obtenu ; \\(X\\) est une variable aléatoire à
        valeurs dans \\(\\{0,1, ..., n\\}\\).", br(),
        "La loi de \\(X\\) est appelée loi binomiale de paramètres \\(n\\) et \\(p\\),
        et est notée \\(X\\) \\(\\sim\\)  \\(\\mathcal{B}(n,p)\\).", br(),
        "Autrement dit, la probabilité pour que \\(k\\) variables aléatoire parmi les \\(X_i\\) prennent la valeur \\(1\\) 
        et \\((n-k)\\) la valeur \\(0\\) est :  $$ P(X = k) = C^{k}_{n}  \\cdot p^k \\cdot (1-p)^{n-k} $$
        Moments :" , br(),"\\(\\mathbb{E}(X) = np \\)", br(), "\\(\\mathbb{V}(X) = npq \\) "
    ),
    box(title = "Représentation graphique",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dbinom1"),solidHeader = TRUE, height = 400),
        box(title="Contrôle :",solidHeader = TRUE,height = 400,
            sliderInput(inputId = "ech2", label = "Taille de l'échantillon",min = 1, max = 10000, value = 1000),
            sliderInput(inputId = "nb_tirages",label = "Nombre de tirages",min=0,max=100, value = 10),
            sliderInput(inputId = "proba",label = "Probabilité de succès",min=0,max=1, value = 0.5, step = 0.01)
        ),
        box(plotOutput("dbinom2"),solidHeader = TRUE)
    )
)

# contenu de la section definition de la loi exponentielle
bexp <- fluidRow(
    box(title = "Loi Exponentielle",status="danger",solidHeader = T,width=12,
        " On dit que \\(X\\) suit une loi exponentielle de paramètre \\(\\lambda > 0\\) si sa densité est donnée
        par la fonction : $$ f_X(x) = \\lambda \\cdot \\exp{(-\\lambda x)} \\cdot \\mathbb{1}_{]0,+\\infty[}(x) $$
        On note \\(X\\) \\(\\sim\\) \\(\\mathcal{E}(\\lambda)\\). Si \\(\\mathbb{P}(X \\geq{0}) = 1\\), 
        alors la fonction de répartition est : 
        \\begin{align}
        \\mathbb{P}(X \\leq x) = \\int_{-\\infty}^{x} f_{X}(t) dt \\\\
        \\end{align}
        \\begin{equation*}
        \\mathbb{P}(X \\leq x) = 
        \\begin{cases}
        1 - \\exp{(-\\lambda x)} & \\text{si } x \\geq{0} \\\\
        0 & \\text{sinon} \\\\
        \\end{cases}
        \\end{equation*}
        Moments :", br(), " \\(\\mathbb{E}(X) = \\) \\( \\frac{1}{\\lambda}\\ \\)",br(),
        "\\(\\mathbb{V}(X) = \\)\\( \\frac{1}{\\lambda^2}\\ \\)"
    ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dexp"),solidHeader = TRUE),
        box(title="Contrôle :",solidHeader = TRUE,
            sliderInput(inputId = "ech3", label = "Taille de l'échantillon",min = 2, max = 10000, value = 1000),
            sliderInput(inputId = "bins2",
                        label = "Nombre de classes",
                        min=1, max = 50,value = 30),
            sliderInput(inputId = "lambda2",label = "Valeur de \\(\\lambda\\)", min = 0.001, max = 20, value = 1,step = 0.001)
        )    
    )
)

# contenu de la section definition de la loi de poisson
bpoiss <- fluidRow(
    box(title = "Loi de Poisson",status="danger",solidHeader = T,width=12,
        "Soit \\(X\\) une variable aléatoire. Elle suit une loi de Poisson de paramètre \\(\\lambda > 0\\) lorsque
        \\(X\\) prend ses valeurs dans \\(\\mathbb{N} \\) , et pour tout \\(k\\) \\(\\in\\)  \\(\\mathbb{N}\\) :
         $$ P(X = k) = \\exp{(-\\lambda)}  \\cdot \\frac{\\lambda^k}{k!} $$
        Moments :", br(),  "\\(\\mathbb{E}(X) = \\mathbb{V}(X) = \\lambda\\) "
    ),
    box(title = "Représentation graphique",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dpois1"),solidHeader = TRUE, height = 400),
        box(title="Contrôle :",solidHeader = TRUE, height = 400,
            sliderInput(inputId = "ech4", label = "Taille de l'échantillon",min = 1, max = 10000, value = 1000),
            sliderInput(inputId = "lambda3",label = "Valeur de \\(\\lambda\\)",min=0.01,max=100, value = 1,step=0.01)
        ),
        box(plotOutput("dpois2"),solidHeader = TRUE)
    )
)

# contenu de la section definition de la loi uniforme continue
bunifc <- fluidRow(
    box(title = "Loi Uniforme Continue",status="danger",solidHeader = T,width=12,
        "Soit \\(X\\) une variable aléatoire. Elle suit une loi uniforme sur le segment \\([a,b]\\),
        \\(a < b\\), si sa densité est donnée par : 
        $$ f_X(x) = \\frac{1}{b-a} \\cdot \\mathbb{1}_{[a,b]}(x)$$
        On note \\(X\\) \\(\\sim\\) \\(\\mathcal{U} \\left([a,b] \\right)\\). Si \\(\\mathbb{P}(X \\in [a,b] = 1) \\), 
        alors la fonction de répartition est :
        \\begin{align}
        \\mathbb{P}(X \\leq x) = \\int_{-\\infty}^{x} f_{X}(t) dt \\\\
        \\end{align}
        \\begin{equation*}
        \\mathbb{P}(X \\leq x) = 
        \\begin{cases}
        0 & \\text{si } x \\leq{a} \\\\
        \\frac{x-a}{b-a} & \\text{si } x \\in [a,b] \\\\
        1 & \\text{si } x \\geq{b} \\\\
        \\end{cases}
        \\end{equation*}
        Moments :",br(), "\\(\\mathbb{E}(X) =   \\frac{a + b}{2}  \\)", br(), 
        "\\(\\mathbb{V}(X) = \\frac{(b-a)^2}{12} \\) "
    ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T, 
        box(plotOutput("dunif"),solidHeader = TRUE),
        box(title="Contrôle :",solidHeader = TRUE,
            sliderInput(inputId = "ech5", label = "Taille de l'échantillon",min = 2, max = 10000, value = 1000),
            sliderInput(inputId = "bins3",
                        label = "Nombre de classes",
                        min=1, max = 50,value = 30),
            sliderInput(inputId = "range", label = "Bornes de l'intervalle",min = -200, max = 200,value = c(-20,20))
        )    
    )
)


# contenu de la section definition de la loi gamma
bgamma <- fluidRow(
    box(title = "Loi Gamma",status="danger",solidHeader = T,width=12,
        "Soit \\(X\\) une variable aléatoire. Elle suit une loi gamma de paramètres \\(p\\) et \\(\\theta\\) 
        si sa densité est donnée par la fonction :
        $$ f_X(x) = \\frac{\\theta^{\\, p}}{\\Gamma(p)} \\cdot \\exp{(-\\theta x)}  \\cdot x^{\\, p-1} \\cdot
        \\mathbb{1}_{\\mathbb{R^+}}(x), \\quad p > 0, \\quad \\theta > 0$$
        Où
        $$ \\Gamma(p) = \\int_{0}^{+\\infty} \\exp{(-x)} \\cdot x^{\\, p-1} dx $$
        On note \\(X\\) \\(\\sim\\) \\(\\gamma (p,\\theta)\\).", br(),
        "Moments :", br(), "\\(\\mathbb{E}(X^r) =  \\frac{\\Gamma(p+r)}{\\theta^{\\, r} \\Gamma (p)} \\).",br(),
        "On en déduit alors :",br(),
        "\\(\\mathbb{E}(X) =  \\frac{p}{\\theta}\\ \\)", br(), "\\(\\mathbb{V}(X) = \\frac{p}{\\theta^2}\\ \\) "
    ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dgamma"),solidHeader = TRUE),
        box(title="Contrôle :",solidHeader = TRUE,
            sliderInput(inputId = "ech6", label = "Taille de l'échantillon",min = 2, max = 10000, value = 1000),
            sliderInput(inputId = "bins4",
                        label = "Nombre de classes",
                        min=1, max = 50,value = 30),
            sliderInput(inputId = "p",label = "Valeur de \\(p\\)", min = 0.01, max = 15, value = 0.5,step = 0.02),
            sliderInput(inputId = "teta",label = "Valeur de \\(\\theta\\)", min = 0.01, max = 15, value = 0.5,step = 0.02)
        ) 
    )
)

# contenu de la section definition de la loi du khi-deux
bkhid <- fluidRow(
    box(title = "Loi du Khi-Deux",status="danger",solidHeader = T,width=12,
        "On considère \\(n\\) variables aléatoires \\(X_1, ..., X_n\\) indépendantes suivant toutes la loi 
        normale \\(\\mathcal{N}(0,1)\\). 
        La variable \\(U_n = \\sum\\limits_{i=1}^n  X_i{^2} \\) suit une loi du khi-deux à \\(n\\) degrés
        de liberté, notée \\(\\chi^2 (n)\\).", br(),
        "Sa fonction de densité est :
        $$ f_{U_n} (x) = \\frac{1}{2^{\\frac{n}{2}} \\cdot \\Gamma \\left(\\frac{n}{2} \\right)} \\cdot
        \\exp{\\left(\\frac{-x}{2} \\right)}  
        \\cdot x^{\\frac{n}{2}-1} \\cdot \\mathbb{1}_{\\mathbb{R^+}}(x)$$
        Moments :", br(), "\\(\\mathbb{E}(X) = n\\)", br(), "\\(\\mathbb{V}(X) = 2n \\) "
    ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dchisq"),solidHeader = TRUE),
        box(title="Contrôle :",solidHeader = TRUE,
            sliderInput(inputId = "ech7", label = "Taille de l'échantillon",min = 2, max = 10000, value = 1000),
            sliderInput(inputId = "bins5",
                        label = "Nombre de classes",
                        min=1, max = 50,value = 30),
            sliderInput(inputId = "ddl",label = "Degré de liberté",min=1,max=200, value = 10)
        )
    )
)

# contenu de la section definition de la loi de student
bstudent <- fluidRow(
    box(title = "Loi de Student",status="danger",solidHeader = T,width=12,
        "Soient \\(X\\) et \\(Y\\) deux variables aléatoires réelles indépendantes de loi \\(\\mathcal{N}(0,1)\\)
        et \\(\\chi^2 (n)\\). On appelle loi de Student à n degrés de libertés la loi suivie par le rapport :
        $$ \\mathcal{T}_n = \\frac{X}{\\sqrt{\\frac{Y}{n}}} $$
        On note \\(\\mathcal{T}(n)\\).
        Elle admet pour densité :
        $$ f(x) = \\frac{\\Gamma \\left(\\frac{n+1}{2}\\right)}{\\sqrt{n\\pi} \\cdot \\Gamma (\\frac{n}{2})}
        \\cdot \\left(1+\\frac{x^2}{n}\\right)^{\\left(-\\frac{n+1}{2} \\right)} $$
        Moments :", br(), "\\(\\mathbb{E}(T_n) = 0, \\quad n>1 \\)", br(),"\\(\\mathbb{V}(T_n) = \\frac{n}{n-2}, \\quad n>2 \\)"
    ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dt"),solidHeader = TRUE),
        box(title="Contrôle :",solidHeader = TRUE,
            sliderInput(inputId = "ech8", label = "Taille de l'échantillon",min = 2, max = 10000, value = 1000),
            sliderInput(inputId = "bins6",
                        label = "Nombre de classes",
                        min=1, max = 50,value = 30),
            sliderInput(inputId = "ddl2",label = "Degré de liberté",min=1,max=200, value = 10)
        )
    )
)

# contenu de la section definition de la loi de fisher
bfisher <- fluidRow(
    box(title = "Loi de Fisher",status="danger",solidHeader = T,width=12,
        "Soient \\(X\\) et \\(Y\\) deux variables aléatoires réelles indépendantes de loi \\(\\chi^2 (m)\\)
        et \\(\\chi^2 (n)\\). Alors la variable aléatoire réelle 
        \\( F = \\frac{X/n}{Y/m} \\) suit une loi de Fisher à \\(m\\) et \\(n\\) degrés de liberté." ,br(), 
        "On note \\(\\mathcal{F}(m,n)\\).", br(),
        "Si \\( F \\sim \\mathcal{F}(m,n) \\) alors \\(\\frac{1}{F} \\sim \\mathcal{F}(m,n) \\).
        Elle admet pour densité :
        $$ f(x) = \\frac{\\Gamma (\\frac{m+n}{2})}{\\Gamma (\\frac{m}{2}) \\Gamma (\\frac{n}{2})} \\cdot 
        n^{\\frac{n}{2}} \\cdot m^{\\frac{m}{2}} \\cdot \\frac{x^{- \\frac{n}{2}-1}}{(m+nx)^{m+\\frac{n}{2}}}
        \\cdot \\mathbb{1}_{\\mathbb{R^+}}(x) $$
        Moments :", br(), "\\(\\mathbb{E}(X) = \\frac{m}{m-2} , \\quad m>2 \\)", br(),
        "\\(\\mathbb{V}(X) = \\frac{2m^{2} \\cdot (n+m-2)}{n(m-4) \\cdot (m-2)^2} , \\quad m>4 \\)"
    ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
        box(plotOutput("df"),solidHeader = TRUE),
        box(title="Contrôle :",solidHeader = TRUE,
            sliderInput(inputId = "ech9", label = "Taille de l'échantillon",min = 2, max = 10000, value = 1000),
            sliderInput(inputId = "bins7",
                        label = "Nombre de classes",
                        min=1, max = 50,value = 30),
            sliderInput(inputId = "ddl3",label = "Degré de liberté \\(n\\)",min=1,max=200, value = 10),
            sliderInput(inputId = "ddl4",label = "Degré de liberté \\(m\\)",min=1,max=200, value = 10)
        )
    )
)


ui <- dashboardPage(skin = "red",
    dashboardHeader(title="Lois Usuelles"),
    # contenu de la barre de navigation
    dashboardSidebar( 
        sidebarMenu(
            id="tabs",
            menuItem("Accueil", tabName = "accueil", icon = icon("chess")),
            menuItem("Loi Normale", tabName = "lnormale", icon = icon("arrow-right"), # icon th sinon
                     menuSubItem("Définition", tabName="def_lnorm", icon = icon("chevron-right")),
                     menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))
                     ),
            menuItem("Loi Binomiale", tabName = "lbinomiale", icon = icon("arrow-right"),
                     menuSubItem("Définition", tabName="def_lbin", icon = icon("chevron-right")),
                     menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))                     
                     ),
            menuItem("Loi Exponentielle", tabName = "lexpo", icon = icon("arrow-right"),
                     menuSubItem("Définition", tabName="def_lexp", icon = icon("chevron-right")),
                     menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))                     
                     ),
            menuItem("Loi de Poisson", tabName = "lpoisson", icon = icon("arrow-right"),
                     menuSubItem("Définition", tabName="def_lpoiss", icon = icon("chevron-right")),
                     menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))                      
                     ),
            menuItem("Loi Uniforme Continue", tabName = "lunifc", icon = icon("arrow-right"),
                    menuSubItem("Définition", tabName="def_lunifc", icon = icon("chevron-right")),
                    menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))
                    ),
            menuItem("Loi Gamma", tabName = "lgamma", icon = icon("arrow-right"),
                     menuSubItem("Définition", tabName="def_lgamma", icon = icon("chevron-right")),
                     menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))
            ),                     
            menuItem("Loi du Khi-Deux", tabName = "lkhid", icon = icon("arrow-right"),
                     menuSubItem("Définition", tabName="def_lkhid", icon = icon("chevron-right")),
                     menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))
            ),                     
            menuItem("Loi Student", tabName = "lstudent", icon = icon("arrow-right"),
                     menuSubItem("Définition", tabName="def_lstudent", icon = icon("chevron-right")),
                     menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))
            ),
            menuItem("Loi Fisher", tabName = "lfisher", icon = icon("arrow-right"),
                     menuSubItem("Définition", tabName="def_lfisher", icon = icon("chevron-right")),
                     menuSubItem("Exemple 1", tabName="exemple1", icon = icon("chevron-right"))
            ),                     
            menuItem("Sources", tabName = "sources", icon = icon("file"))
            )
        ),
    # contenu de la page
    dashboardBody(withMathJax(), includeCSS("www/style1.css"),
        tabItems(
        # page accueil
            tabItem(tabName = "accueil",baccueil
            ),
        # page de la loi normale
            tabItem(tabName = "def_lnorm",bnorm
            ),
        # page de la loi binomiale
            tabItem(tabName = "def_lbin",bbin
            ),
        # page de la loi exponentielle
            tabItem(tabName = "def_lexp",bexp
            ),
        # page de la loi de poisson
            tabItem(tabName = "def_lpoiss",bpoiss
            ),
        # page de la loi uniforme continue
            tabItem(tabName = "def_lunifc",bunifc
            ),
        # page de la loi gamma
            tabItem(tabName = "def_lgamma",bgamma
            ), 
        # page de la loi du khi deux
            tabItem(tabName = "def_lkhid",bkhid
            ),
        # page de la loi de student
            tabItem(tabName = "def_lstudent",bstudent
            ),
        # page de la loi de fisher
            tabItem(tabName = "def_lfisher",bfisher
            ),
        # page sources
            tabItem(tabName = "sources",bsources
            )
        )
    )
)
