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
        sa densité est donnée par la fonction : 
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
        La variable aléatoire \\(Z\\) suit une loi normale d'espérance nulle et de variance 1, dite loi normale centrée réduite,
        de densité : $$ f_Z(z) =\\frac{1}{\\sqrt{2\\pi}} \\cdot \\exp{(\\frac{-z^2}{2})} , \\forall z \\in \\mathbb{R} $$"
        ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
        box(plotOutput("dnorm")),
        box(title="Contrôle :", 
            sliderInput(inputId = "bins",
                        label = "Number of bins:",
                        min=1, max = 50,value = 30),
            sliderInput(inputId = "moyenne",label = "Valeur de mu",min=-20,max=20, value = 0),
            sliderInput(inputId = "ecart_type",label = "Valeur de sigma",min=1,max=50, value = 1)
        )
    ),

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
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
    #    box(plotOutput("dnorm")),
    #    box(title="Contrôle :",
    #        sliderInput(inputId = "bins",
    #                    label = "Number of bins:",
    #                    min=1, max = 50,value = 30),
    #        sliderInput(inputId = "moyenne",label = "Valeur de mu",min=-20,max=20, value = 0),
    #        sliderInput(inputId = "ecart_type",label = "Valeur de sigma",min=1,max=50, value = 1)
    #    )
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
        Moments : \\(\\mathbb{E}(X) = \\) \\( \\frac{1}{\\lambda}\\ \\)  et  \\(\\mathbb{V}(X) = \\)\\( \\frac{1}{\\lambda^2}\\ \\)
        "
    ),
    box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
    #    box(plotOutput("dexp")),
    #    box(title="Contrôle :",
    #        sliderInput(inputId = "bins2",
    #                    label = "Number of bins:",
    #                    min=1, max = 50,value = 30),
    #        sliderInput(inputId = "lambda2",label = "Valeur de lambda", min = 0.001, max = 20, value = 1,step = 0.001)
    #    )    
    )
)

# contenu de la section definition de la loi de poisson
bpoiss <- fluidRow(
    box(title = "Loi de Poisson",status="danger",solidHeader = T,width=12,
        "Soit \\(X\\) une variable aléatoire. Elle suit une loi de Poisson de paramètre \\(\\lambda > 0\\) lorsque
        \\(X\\) prend ses valeurs dans \\(\\mathbb{N} \\) , et pour tout \\(k\\) \\(\\in\\)  \\(\\mathbb{N}\\) :
         $$ P(X = k) = \\exp{(-\\lambda)}  \\cdot \\frac{\\lambda^k}{k!} $$
        Moments : \\(\\mathbb{E}(X) = \\mathbb{V}(X) = \\lambda\\) "
    ),
    box(title = "Représentation graphique",width = 12,status = "info",solidHeader = T,
    #    box(plotOutput("dpois")),
    #    box(title="Contrôle :",
    #        sliderInput(inputId = "lambda3",label = "Valeur de lambda",min=0.01,max=20, value = 1,step=0.01)
    #    )
    )
)

# contenu de la section definition de la loi uniforme continue
bunifc <- fluidRow(
    box(title = "Loi Uniforme Continue",status="danger",solidHeader = T,width=12,
        "Soit \\(X\\) une variable aléatoire. Elle suit une loi uniforme sur le segment \\([a,b]\\),
        \\(a < b\\), si sa densité est donnée par : 
        $$ f_X(x) = \\frac{1}{b-a} \\cdot \\mathbb{1}_{]a,b}(x)$$
        On note \\(X\\) \\(\\sim\\) \\(\\mathcal{U}([a,b])\\). Si \\(\\mathbb{P}(X \\in [a,b] = 1) \\), 
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
        Moments : \\(\\mathbb{E}(X) =  \\frac{a + b}{2}\\ \\) et \\(\\mathbb{V}(X) = \\frac{(b-a)^2}{12}\\ \\) "
    ),
    box(title = "Représentation graphique",width = 12,status = "info",solidHeader = T,
        #    box(plotOutput("dpois")),
        #    box(title="Contrôle :",
        #        sliderInput(inputId = "lambda3",label = "Valeur de lambda",min=0.01,max=20, value = 1,step=0.01)
        #    )
    )
)

# contenu de la section definition de la loi gamma
bgamma <- fluidRow(
    box(title = "Loi Gamma",status="danger",solidHeader = T,width=12,
        "Soit \\(X\\) une variable aléatoire. Elle suit une loi gamma de paramètres \\(p\\) et \\(\\theta\\) 
        si sa densité est donnée par la fonction :
        $$ f_X(x) = \\frac{\\theta^{ p}}{\\Gamma(p)} \\cdot \\exp{(-\\theta x)}  \\cdot x^{p-1} \\cdot
        \\mathbb{1}_{\\mathbb{R^+}}(x),  p > 0, \\theta > 0$$
        Où
        $$ \\Gamma(p) = \\int_{0}^{+\\infty} \\exp{(-x)} \\cdot x^{p-1} dx $$
        On note \\(X\\) \\(\\sim\\) \\(\\gamma (p,\\theta)\\).
        Moments : \\(\\mathbb{E}(X^r) =  \\frac{\\Gamma(p+r)}{\\theta^r \\Gamma (p)}\\ \\). On en déduit alors :
        \\(\\mathbb{E}(X) =  \\frac{p}{\\theta}\\ \\) et \\(\\mathbb{V}(X) = \\frac{p}{\\theta^2}\\ \\) "
    ),
    box(title = "Représentation graphique",width = 12,status = "info",solidHeader = T,
        #    box(plotOutput("dpois")),
        #    box(title="Contrôle :",
        #        sliderInput(inputId = "lambda3",label = "Valeur de lambda",min=0.01,max=20, value = 1,step=0.01)
        #    )
    )
)

# contenu de la section definition de la loi du khi-deux
bkhid <- fluidRow(
    box(title = "Loi du Khi-Deux",status="danger",solidHeader = T,width=12,
        "On considère \\(n\\) variables aléatoires \\(X_1, ..., X_n\\) indépendantes suivant toutes la loi 
        normale \\(\\mathcal{N}(0,1)\\). 
        La variable \\(U_n = \\sum\\limits_{i=1}^n  X_i{^2} \\) suit une loi du khi-deux à \\(n\\) degrés
        de liberté, notée \\(\\chi^2 (n)\\).
        Sa fonction de densité est :
        $$ f_{U_n} (x) = \\frac{1}{2^{\\frac{n}{2}} \\cdot \\Gamma(\\frac{n}{2})} \\cdot \\exp{(\\frac{-x}{2})}  
        \\cdot x^{\\frac{n}{2}-1} \\cdot \\mathbb{1}_{\\mathbb{R^+}}(x)$$
        Moments : \\(\\mathbb{E}(X) = n\\) et \\(\\mathbb{V}(X) = 2n \\) "
    ),
    box(title = "Représentation graphique",width = 12,status = "info",solidHeader = T,
        #    box(plotOutput("dpois")),
        #    box(title="Contrôle :",
        #        sliderInput(inputId = "lambda3",label = "Valeur de lambda",min=0.01,max=20, value = 1,step=0.01)
        #    )
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
        $$ f(x) = \\frac{\\Gamma (\\frac{n+1}{2})}{\\sqrt{n\\pi} \\cdot \\Gamma (\\frac{n}{2})}
        \\cdot (1+\\frac{x^2}{n})^{-(\\frac{n+1}{2})} $$
        Moments : \\(\\mathbb{E}(T_n) = 0, n>1 \\) et \\(\\mathbb{V}(T_n) = \\frac{n}{n-2}, n>2 \\)  "
    ),
    box(title = "Représentation graphique",width = 12,status = "info",solidHeader = T,
        #    box(plotOutput("dpois")),
        #    box(title="Contrôle :",
        #        sliderInput(inputId = "lambda3",label = "Valeur de lambda",min=0.01,max=20, value = 1,step=0.01)
        #    )
    )
)

# contenu de la section definition de la loi de fisher
bfisher <- fluidRow(
    box(title = "Loi de Fisher",status="danger",solidHeader = T,width=12,
        "Soient \\(X\\) et \\(Y\\) deux variables aléatoires réelles indépendantes de loi \\(\\chi^2 (m)\\)
        et \\(\\chi^2 (n)\\). Alors la variable aléatoire réelle 
        \\( F = \\frac{X/n}{Y/m} \\) suit une loi de Fisher à \\(m\\) et \\(n\\) degrés de liberté. 
        On note \\(\\mathcal{F}(m,n)\\).
        Si \\( F \\sim \\mathcal{F}(m,n) \\) alors \\(\\frac{1}{F} \\sim \\mathcal{F}(m,n) \\).
        Elle admet pour densité :
        $$ f(x) = \\frac{\\Gamma (\\frac{m+n}{2})}{\\Gamma (\\frac{m}{2}) \\Gamma (\\frac{n}{2})} \\cdot 
        n^{\\frac{n}{2}} \\cdot m^{\\frac{m}{2}} \\cdot \\frac{x^{- \\frac{n}{2}-1}}{(m+nx)^{m+\\frac{n}{2}}}
        \\cdot \\mathbb{1}_{\\mathbb{R^+}}(x) $$
        Moments : \\(\\mathbb{E}(X) = \\frac{m}{m-2} ,m>2 \\) et
        \\(\\mathbb{V}(X) = \\frac{2m^{2} \\cdot (n+m-2)}{n(m-4) \\cdot (m-2)^2} ,m>4 \\)"
    ),
    box(title = "Représentation graphique",width = 12,status = "info",solidHeader = T,
        #    box(plotOutput("dpois")),
        #    box(title="Contrôle :",
        #        sliderInput(inputId = "lambda3",label = "Valeur de lambda",min=0.01,max=20, value = 1,step=0.01)
        #    )
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
    dashboardBody(tags$link(rel = "stylesheet", type = "text/css", href = "style1.css"),
        tabItems(
        # page accueil
            tabItem(tabName = "accueil",body_exemple
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
            tabItem(tabName = "sources",body
            )
        )
    )
)

