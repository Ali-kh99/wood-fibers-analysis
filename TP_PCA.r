# Installing necessary packages to run pca
#install.packages("factoextra")
#install.packages("FactoMineR")

# Import FactoMineR Library
library('FactoMineR')

# Chargement des données
wood <- read.csv("wood-fibres.csv")

# Affichage des données
head(wood)

# Calcule de l'ACP
wood.pca <-PCA(wood[,-1], scale.unit=TRUE, graph=F)

# Affichage des nuages des points par couples de variables 
plot(wood[,-1], pch=16, cex=0.8)

# summary of our PCA (wood.pca) Object
summary(wood.pca)

# Appelons str() pour voir l'objet ACP 
str(wood.pca)

# import des bibliothèques 'factoextra' pour le calcul des valeurs propres et/variances 
# et 'ggplot2' pour tracer des graphes 2D
library("factoextra")
library("ggplot2")

# le calcul des valeurs propres et le % des variances 
eig.val <- get_eigenvalue(wood.pca) 
eig.val

# visualisation des pourcentage des variances
fviz_eig(wood.pca, addlabels = TRUE, ylim = c(0, 70))

# Résultats de l'analyse en composantes principales pour les variables
wood.var <- get_pca_var(wood.pca) 
wood.var

# Coordinates of variables
wood.var$coord

wood.var$cor

# Qualité de représentation
wood.var$cos2

wood.var$contrib

# Visualusation de variable
# Graphique de corélation des variables
fviz_pca_var(wood.pca, col.var = "blue")

# Visualisation des individus par la fonction plot().
plot(wood.pca)

# Visualisation des individus par la fonction fviz_pca_ind().
fviz_pca_ind(wood.pca, repel = TRUE )

# Visualisation des variables et individus sur le même graphique :
fviz_pca_biplot(wood.pca, repel=TRUE)


