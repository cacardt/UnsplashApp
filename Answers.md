2 - Grid : 
Exercice 1 - 3 : 
  un lazyGrid est un élément qui permet de gérer tous les éléments d'une liste ou pas verticalement et qui ajoute    des éléments en fonction du nombre d'éléments dans la liste
  Il existe aussi des lazyHGrid qui permet de faire la même chose qu'un lazyVGrid mais en horizontal. flixeble()     est utilisé pour donner la taille des éléments dans le lazyVgrid ou le LazyHGrid
Exercice 2 : 
self
.resizable() // permet à la taille de l'image d'être redéfinie
.scaledToFill() // demande à l'image de se caler pour qu'elle rentre entièrement
.frame(width: geo.size.width, height: geo.size.height) // Met donne sa taille d'origine à l'image
.clipped() // permet de couper ce qui dépasse de l'image.
