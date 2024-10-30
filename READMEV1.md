# Version 1 :

Cette version permet de récupérer les données météorologiques d'une ville passée en arguments.
Donc dans un premier dans j'aie réaliser les étapes de codages pour vérifier si la ville était bien en arguments. Pour cela, j'ai réalisé un If en trois partis la première qui s'il n'y a pas d'argument la ville de Toulouse passe directement en arguments. Puis dans une seconde parti qui prend l'argument et qui le stock dans une variable ville.

Ensuite, pour stocker les données brutes météorologiques, je suis allé sur le github de wttr.in pour chercher comment récupérer les valeurs brutes et donc les récupérer plus facilement après. Pour cela, j'ai rajouté le format JSON avec j2 cette option indique que la réponse doit être en JSON. 

Pour extraire les données, j'ai donc réalisé un grep sur le fichier local pour retrouver les valeurs de température actuelle et celle prévisionnelle. Pour les stockés j'ai juste récupéré la date et l'heure pour le renvoyer dans le format qui était demandé .
