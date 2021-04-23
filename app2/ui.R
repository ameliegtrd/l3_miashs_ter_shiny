# ui cree des variables disponibles dans le server, il declare des inputs
# il gere la structure de la page, avec le placement des outputs
# regroupe les elements de mise en forme et d'affichage, affiche des inputs et outputs

# install.packages("anyLib")
# anyLib::anyLib(c("shiny", "shinydashboard", "shinyWidgets", "DT", "plotly", "ggplot2", "googleVis", "colourpicker"))

library(shiny)
library(shinydashboard)

# il faut separer les elements par des virgules

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

# contenu de la section accueil
baccueil <- fluidRow(
    tabBox(
        title = "Présentation du TER",
        height = "45vh",
        tabPanel("Nous", "Cette application, avec l'aide des packages nécessaires, est développée par :", br(),
                 "- BRIGNON Léa", br(), "- CHU Hoang Viet", br(), "- GOUTARD Amélie", br(), "- GUINARD Florian", br(),
                 "Elle fait partie du projet de travail de recherche encadré par Laurent Rouvière."
                 )
    ),
    tabBox(
        title = "Sujet",
        height = "45vh",
        tabPanel("Sujet", 
                 "Cette application est la deuxième de notre projet TER. Elle a été pensée comme \"support\" à la
                 première application, qui est axée sur le Théorème Central Limite (TCL).
                 En effet, ce théorème permet d'établir la convergence en loi de la somme d'une suite de 
                 variables aléatoires vers la loi normale.",br(),
                 "C'est pour cette raison que cette application porte principalement sur les lois. 
                 Elle recense les différentes lois usuelles. Pour chacune d'entre elles,
                 il est renseigné sa définition et ses moments d'ordre 1 et 2.", br(),
                 "Egalement, il est possible de voir comment elles évoluent graphiquement en fonction
                 de leur paramètres et du nombre d'observations. Ces informations sont dans la sous-section
                 intitulée 'Définition'.", br(), "Aussi, dans la première application on explique que le TCL 
                 permet de trouver un intervalle de confiance. Nous avons donc, pour compléter cette information,
                 une section sur les Intervalles de Confiance."
        ),
        tabPanel("Motivations", "Une loi de probabilité décrit le comportement aléatoire d'un phénomène dépendant
                 du hasard.",br(), "Plusieurs définitions du hasard sont possibles. Si on s'intéresse à son origine
                 étymologique, alors le hasard est un mot d'origine arabe qui signifie \"dés \" .",br(),
                 "Ainsi, les probabilités ont commencé avec les jeux de hasards (les fameux exercices sur les jets de dés)."
                 ,br(), "Mais aujourd'hui l'utilisation de lois de probabilité n'est pas restreinte aux jeux de hasard.
                 Elles sont utilisées dans divers domaines du quotidien, comme par exemple pour prédire les votes lors 
                 du second tour d'une élection présidentielle, ou plus généralement pour prédire les caractéristiques
                 d'une population inconnue à partir des statistiques déterminées dans un échantillon représentatif de
                 la popualtion en question.",br(),
                 "C'est pourquoi, outre le fait que nous utilisons constamment les lois dans notre cursus, nous avons 
                 trouvé pertinent de s'y intéresser car elles permettent d'illustrer des situations du quotiden."
        )
    ),
    tabBox(
        title = "Sujet appliqué à Shiny",
        height = "45vh",
        tabPanel("Lois", 
                 "Le principal intérêt avec Shiny est son côté dynamique et interactif.", br(),
                 "Pour chaque loi, nous avons illustré un échantillon de variables aléatoires suivant la loi en question.
                 On peut faire varier la taille de l'échantillon, en l'augmentant (pour augmenter sa précision) 
                 ou en la diminuant (pour baisser la précision).
                 On peut également modifier les paramètres de la loi en question, ce qui permet de voir son comportement.", br(),
                 "Pour les lois continues on a représenté avec un histogramme la densité théorique de la loi suivant la valeur
                 des paramètres choisis.",br(),
                 "Pour les lois discrètes, nous avons illustré avec deux graphiques ; un représentant la fonction de masse
                 et l'autre la fonction de répartition empirique."
        ),
        tabPanel("Intervalle de Confiance", "Texte"
        )
    ),
    tabBox(
        title = "Programmation",
        height = "45vh",
        tabPanel("Technique", 
                 "Quels packages on a utilisés et pour faire quoi ?",br(),
                 "ramchart --> pour graphiques",br(),
                 "mathjax --> pour ecriture mathematique"
        ),
        tabPanel("Difficultés", "Les difficultés qu'on a rencontrées",br(),
                 "Par exemple l'intéraction entre utilisateur et machine (l'utilsateur rentre une fonction
                 et la machine l'utilise et ajuste ses calculs ect..)"
        )
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
      " Soient \\(X\\) \\(\\sim\\) \\(\\mathcal{N}(\\mu,\\sigma^2)\\),\\(a\\) \\(\\in\\) \\(\\mathbb{R}^+\\) 
        et \\(b\\) \\(\\in\\) \\(\\mathbb{R}\\). Alors  \\(aX+b\\) \\(\\sim\\) \\(\\mathcal{N}(a\\mu +b,a^2\\sigma^2)\\).", br(), 
      "En particulier, avec \\(a\\) = \\( \\frac{1}{\\sigma}\\ \\) et \\(b\\) = \\( \\frac{-\\mu}{\\sigma^2}\\ \\), 
        on a : $$ Z = \\frac{X -\\mu}{\\sigma}\\ \\sim  \\mathcal{N}(0,1)$$
        La variable aléatoire \\(Z\\) suit une loi normale d'espérance nulle et de variance 1, dite loi normale centrée réduite,
        de densité : $$ f_Z(z) =\\frac{1}{\\sqrt{2\\pi}} \\cdot \\exp{\\left (\\frac{-z^2}{2} \\right)} , \\forall z \\in \\mathbb{R} $$"
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
      box(plotOutput("dbinom1"),solidHeader = TRUE,height = 400),
      box(title="Contrôle :",solidHeader = TRUE, height = 400,
          sliderInput(inputId = "ech2", label = "Taille de l'échantillon",min = 1, max = 10000, value = 1000),
          sliderInput(inputId = "nb_tirages",label = "Nombre de tirages",min=0,max=100, value = 10),
          sliderInput(inputId = "proba",label = "Probabilité de succès",min=0,max=1, value = 0.5, step = 0.01)
      ),
      box(plotOutput("dbinom2"),solidHeader = TRUE),
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
          sliderInput(inputId = "lambda3",label = "Valeur de \\(\\lambda\\)",min=0.01,max=20, value = 1,step=0.01)
      ),
      box(plotOutput("dpois2"),solidHeader = TRUE),
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
        Moments :",br(), "\\(\\mathbb{E}(X) =  \\frac{a + b}{2}\\ \\)", br(), 
      "\\(\\mathbb{V}(X) = \\frac{(b-a)^2}{12}\\ \\) "
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
        $$ f_X(x) = \\frac{\\theta^{ p}}{\\Gamma(p)} \\cdot \\exp{(-\\theta x)}  \\cdot x^{p-1} \\cdot
        \\mathbb{1}_{\\mathbb{R^+}}(x),  p > 0, \\theta > 0$$
        Où
        $$ \\Gamma(p) = \\int_{0}^{+\\infty} \\exp{(-x)} \\cdot x^{p-1} dx $$
        On note \\(X\\) \\(\\sim\\) \\(\\gamma (p,\\theta)\\).", br(),
      "Moments :", br(), "\\(\\mathbb{E}(X^r) =  \\frac{\\Gamma(p+r)}{\\theta^r \\Gamma (p)}\\ \\).",br(),
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
        Moments :", br(), "\\(\\mathbb{E}(T_n) = 0, n>1 \\)", br(),"\\(\\mathbb{V}(T_n) = \\frac{n}{n-2}, n>2 \\)"
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
        \\( F = \\frac{X/m}{Y/n} \\) suit une loi de Fisher à \\(m\\) et \\(n\\) degrés de liberté." ,br(), 
      "On note \\(\\mathcal{F}(m,n)\\).", br(),
      "Si \\( F \\sim \\mathcal{F}(m,n) \\) alors \\(\\frac{1}{F} \\sim \\mathcal{F}(m,n) \\).
        Elle admet pour densité :
        $$ f(x) = \\frac{\\Gamma (\\frac{m+n}{2})}{\\Gamma (\\frac{m}{2}) \\Gamma (\\frac{n}{2})} \\cdot 
        n^{\\frac{n}{2}} \\cdot m^{\\frac{m}{2}} \\cdot \\frac{x^{- \\frac{n}{2}-1}}{(m+nx)^{m+\\frac{n}{2}}}
        \\cdot \\mathbb{1}_{\\mathbb{R^+}}(x) $$
        Moments :", br(), "\\(\\mathbb{E}(X) = \\frac{m}{m-2} ,m>2 \\)", br(),
      "\\(\\mathbb{V}(X) = \\frac{2m^{2} \\cdot (n+m-2)}{n(m-4) \\cdot (m-2)^2} ,m>4 \\)"
  ),
  box(title = "Représentation graphique de la densité",width = 12,status = "info",solidHeader = T,
      box(plotOutput("df"),solidHeader = TRUE),
      box(title="Contrôle :",solidHeader = TRUE,
          sliderInput(inputId = "ech9", label = "Taille de l'échantillon",min = 2, max = 10000, value = 1000),
          sliderInput(inputId = "bins7",
                      label = "Nombre de classes",
                      min=1, max = 50,value = 30),
          sliderInput(inputId = "ddl3",label = "Degré de liberté \\(m\\)",min=1,max=200, value = 10),
          sliderInput(inputId = "ddl4",label = "Degré de liberté \\(n\\)",min=1,max=200, value = 10)
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
                    dashboardBody(tags$link(rel = "stylesheet", type = "text/css", href = "style1.css"),withMathJax(),
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
                                    tabItem(tabName = "sources",body
                                    )
                                  )
                    )
)
