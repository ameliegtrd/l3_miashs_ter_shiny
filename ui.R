# ui cree des variables disponibles dans le server, il declare des inputs
# il gere la structure de la page, avec le placement des outputs
# regroupe les elements de mise en forme et d'affichage, affiche des inputs et outputs

# install.packages("anyLib")
# anyLib::anyLib(c("shiny", "shinydashboard", "shinyWidgets", "DT", "plotly", "ggplot2", "googleVis", "colourpicker"))

library(shiny)
library(shinydashboard)

# il faut separer les elements par des virgules
body_exemple <- fluidRow(
    box(title = "Présentation",background="maroon",width = 12, # le systeme de disposition de grille Boostrap
        # dispose d'un corps divise en 12 colonnes de largeur egale, ici 12 veut dire que la box occupe 
        # toute la place
        "Box content"),
    box(title = "Présentation",background="teal",width = 6,
        "Box content"),
    box(title = "Présentation",background="teal",width = 6,
        "Box content")
)

body <- fluidRow(
    box(
        title = "Titre", width = 4, solidHeader = TRUE,
        "Box content"
    ),
    box(
        title = "Title 5", width = 4, background = "light-blue",
        "A box with a solid light-blue background"
    )
)

# contenu de la section definition de la loi normale
bnorm <- fluidRow(
    box(title = "Loi Normale",status="danger",solidHeader = T,width=6,
        "\\(X\\) suit une loi normale d'espérance \\(\\mu\\)  et de variance \\(\\sigma^2\\) si 
        sa densité par rapport à \\(\\lambda\\) est donnée par la fonction : 
        $$ f_X(x) =\\frac{1}{\\sqrt{2\\pi\\sigma^2}} \\cdot \\frac{-(x-\\mu)^2}{2\\sigma^2} $$
        On note \\(X\\) \\(\\sim\\)  \\(\\mathcal{N}(\\mu,\\sigma^2)\\).
        Attention, on ne peut pas calculer explicitement la fonction de répartition. C'est pour cela
        qu'on se ramène à la loi normale centrée-réduite."
        ),
    box(title = "Loi Normale centrée réduite", status = "warning", solidHeader = T,width=6,withMathJax(),
        "Soit \\(\\Phi\\) une fonction de répartition de \\(\\mathcal{N}(0,1)\\). On a \\(\\Phi(-x)\\) = \\(-\\Phi(x)\\), 
        \\(\\forall\\) \\(x\\) \\(\\in\\) \\(\\mathbb{R}\\). Soient \\(X\\) \\(\\sim\\) \\(\\mathcal{N}(\\mu,\\sigma^2)\\),
        \\(a\\) \\(\\in\\) \\(\\mathbb{R}^+\\) et \\(b\\) \\(\\in\\) \\(\\mathbb{R}\\). Alors  \\(aX+b\\) \\(\\sim\\) 
        \\(\\mathcal{N}(a\\mu +b,a^2\\sigma^2)\\). En particulier, avec \\(a\\) = \\( \\frac{1}{\\sigma}\\ \\) et
        \\(b\\) = \\( \\frac{-\\mu}{\\sigma^2}\\ \\), on a : $$ Z = \\frac{X -\\mu}{\\sigma}\\ \\sim  \\mathcal{N}(0,1)$$
        La varible aléatoire \\(Z\\) suit une loi normale d'espérance nulle et de variance 1, dite loi normale centrée réduite,
        de densité : $$ f_Z(z) =\\frac{1}{\\sqrt{2\\pi}} \\cdot \\exp{(\\frac{-z^2}{2})} , \\forall z \\in \\mathbb{R} $$"
        ),
    box(title = "Représentation graphique",background="black",width = 12,status = "info",solidHeader = T,
        "Test couleur de fond")
)

# contenu de la section definition de la loi binomiale
bbin <- fluidRow(
    box(title = "Loi Binomiale",status="danger",solidHeader = T,width=12,
        "On considère \\(n\\) tirages équiprobables indépendants dans une population composée de deux types d'éléments,
        le premier en proportion \\(p\\), le second en proportion \\(q = 1-p\\). Soit \\(X\\) le nombre d'éléments du
        premier type présents dans l'échantillon de taille \\(n\\) ainsi obtenu ; \\(X\\) est une variable aléatoire à
        valeurs dans \\(\\{0,1, ..., n\\}\\). La loi de \\(X\\) est appelée loi binomiale de paramètres \\(n\\) et \\(p\\),
        et est notée \\(X\\) \\(\\sim\\)  \\(\\mathcal{B}(n,p)\\). Autrement dit, la probabilité pour que \\(k\\) variables aléatoire
        parmi les \\(Xi\\) prennent la valeur \\(1\\) et \\((n-k)\\) la valeur \\(0\\) est :  
        $$ P(X = k) = C^{k}_{n}  \\cdot p^k \\cdot (1-p)^{n-k} $$
        Moments : \\(\\mathbb{E}(X) = np \\)  et  \\(\\mathbb{V}(X) = npq \\) "
    ),
    box(title = "Représentation graphique",background="black",width = 12,status = "info",solidHeader = T,
        "Test couleur de fond")
)

# contenu de la section definition de la loi exponentielle
bexp <- fluidRow(
    box(title = "Loi Exponentielle",status="danger",solidHeader = T,width=12,
        " On dit que \\(X\\) suit une loi exponentielle de paramètre \\(\\lambda > 0\\) si sa densité est donnée
        par la fonction : $$ f_X(x) = \\lambda \\cdot \\exp{(-\\lambda x)} \\cdot \\mathbb{1}_{]0,+\\infty[}(x) $$
        On note \\(X\\) \\(\\sim\\) \\(\\mathcal{E}(\\lambda)\\). Si \\(\\mathbb{P}(X \\geq{0}) = 1\\), alors la fonction 
        de répartition est : 
        \\begin{align}
        \\mathbb{P}(X \\leq x) = \\int_{-\\infty}^{x} f_{X}(x) \\\\
        \\end{align}
        \\begin{equation*}
        \\mathbb{P}(X \\leq x) = 
        \\begin{cases}
        1 - \\exp{(-\\lambda x)} & \\text{si } x \\geq{0} \\\\
        0 & \\text{sinon} \\\\
        \\end{cases}
        \\end{equation*}
        Moments : \\(\\mathbb{E}(X) = \\) \\( \\frac{1}{\\lambda}\\ \\)  et  \\(\\mathbb{V}(X) = \\)\\( \\frac{1}{\\lambda^2}\\ \\)
        "
    ),
    box(title = "Représentation graphique",background="black",width = 12,status = "info",solidHeader = T,
        "Test couleur de fond")
)

# contenu de la section definition de la loi de poisson
bpoiss <- fluidRow(
    box(title = "Loi de Poisson",status="danger",solidHeader = T,width=12,
        "Soit \\(X\\) une variable aléatoire. Elle suit une loi de Poisson de paramètre \\(\\lambda > 0\\) lorsque
        \\(X\\) prend ses valeurs dans \\(\\mathbb{N} \\) , et pour tout \\(k\\) \\(\\in\\)  \\(\\mathbb{N}\\) :
         $$ P(X = k) = \\exp{(-\\lambda)}  \\cdot \\frac{\\lambda^k}{k!} $$
        Moments : \\(\\mathbb{E}(X) = \\mathbb{V}(X) = \\lambda\\) "
    ),
    box(title = "Représentation graphique",background="black",width = 12,status = "info",solidHeader = T,
        "Test couleur de fond")
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
            menuItem("Loi Uniforme Continue", tabName = "lunifc", icon = icon("arrow-right")),
            menuItem("Loi Gamma", tabName = "lgamma", icon = icon("arrow-right")),
            menuItem("Loi du Khi-Deux", tabName = "lkhid", icon = icon("arrow-right")),
            menuItem("Loi Student", tabName = "lstudent", icon = icon("arrow-right")),
            menuItem("Loi Fisher", tabName = "lfisher", icon = icon("arrow-right")),
            menuItem("Sources", tabName = "sources", icon = icon("file"))
            )
        ),
    # contenu de la page
    dashboardBody(tags$link(rel = "stylesheet", type = "text/css", href = "style1.css"),
        tabItems(
        # page accueil
            tabItem(tabName = "accueil",body_exemple
            ),
                                      
        # page de la loi normale
            tabItem(tabName = "def_lnorm",bnorm
            ),
        
            tabItem(tabName = "def_lbin",bbin
            ),
        
            tabItem(tabName = "def_lexp",bexp
            ),
        
            tabItem(tabName = "def_lpoiss",bpoiss
            ),
        
            tabItem(tabName = "lunifc",body
            ),
        
            tabItem(tabName = "lgamma",body
            ), 
        
            tabItem(tabName = "lkhid",body
            ),
        
            tabItem(tabName = "lstudent",body
            ),
        
            tabItem(tabName = "lfisher",body
            ),
        
        # page sources
            tabItem(tabName = "sources",body
            )
        )
    )
)

