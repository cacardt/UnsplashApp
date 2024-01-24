2 - Grid : 
Exercice 1 - 3 : 
  un lazyGrid est un élément qui permet de gérer tous les éléments d'une liste ou pas verticalement et qui ajoute des éléments en fonction du nombre d'éléments dans la liste
  Il existe aussi des lazyHGrid qui permet de faire la même chose qu'un lazyVGrid mais en horizontal. flixeble() est utilisé pour donner la taille des éléments dans le lazyVgrid ou le LazyHGrid
Exercice 2 : 
self
.resizable() // permet à la taille de l'image d'être redéfinie
.scaledToFill() // demande à l'image de se caler pour qu'elle rentre entièrement
.frame(width: geo.size.width, height: geo.size.height) // Met donne sa taille d'origine à l'image
.clipped() // permet de couper ce qui dépasse de l'image.

4 - Appel réseaux :
Exercice 3 :
Le async/await offre une syntaxe lisible et concise, permettant de traiter l'asynchronisme de manière déclarative. Combine, un framework réactif, utilise des éditeurs et des opérateurs pour manipuler les flux de données asynchrones de manière déclarative. Enfin, l'utilisation de completionHandler avec Grand Central Dispatch (GCD) offre une approche manuelle plus bas niveau, adaptée aux tâches concurrentes.