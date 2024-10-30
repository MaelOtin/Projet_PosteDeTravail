README - Extracteur Météo

Ce projet contient plusieurs versions d'un script d'extraction de données météo depuis le service en ligne wttr.in.
Chaque version enregistre des informations météorologiques dans un fichier, en utilisant une ville spécifiée en paramètre ou une ville par défaut.

Version 1 : Extracteur_Météo_v1.sh
Description
Cette version nécessite que l’utilisateur fournisse le nom d'une ville comme argument lors de l'exécution. Si aucun argument n'est spécifié, le script affiche un message d'erreur et se termine sans extraire de données.

Fonctionnalités :

Demande le nom d'une ville comme argument obligatoire.
Affiche un message d'erreur en l’absence de ville spécifiée.
Utilise curl pour récupérer les données brutes depuis wttr.in.
Enregistre la date, l’heure et la température actuelle dans le fichier meteo.txt.
Exemple d'utilisation :


./Extracteur_Météo_v1.sh <Ville
                           
Version 2 : Extracteur_Météo_v2.sh
Description
Cette version utilise "Toulouse" comme ville par défaut si aucun argument n'est fourni. Les données sont extraites, traitées et enregistrées dans meteo.txt.

Fonctionnalités :

Vérifie si un argument de ville est fourni ; sinon, utilise "Toulouse" par défaut.
Extrait la température actuelle et la température moyenne du lendemain depuis wttr.in.
Enregistre les informations avec la date et l’heure dans meteo.txt.
Exemple d'utilisation :

./Extracteur_Météo_v2.sh            # Utilise Toulouse par défaut
./Extracteur_Météo_v2.sh Paris       # Utilise Paris comme ville

Version 3 : Extracteur_Météo_v3.sh

Description
Cette version enregistre la météo à la fois dans un fichier journalier et dans meteo.txt pour un suivi global. Elle est similaire à la version 2 mais ajoute un fichier d'historique journalier.

Fonctionnalités :

Utilise "Toulouse" par défaut si aucune ville n'est spécifiée.
Extrait la température actuelle et la température moyenne du lendemain.
Enregistre les données dans un fichier journalier nommé meteo_YYYYMMDD.txt (selon la date actuelle).
Écrit également les données dans meteo.txt pour un suivi global.
Exemple d'utilisation :


./Extracteur_Météo_v3.sh            # Utilise Toulouse par défaut
./Extracteur_Météo_v3.sh Marseille   # Utilise Marseille comme ville

Pré-requis
Connexion Internet pour accéder à wttr.in.
curl installé sur le système.

Notes
Ces scripts utilisent le format JSON pour récupérer et traiter les données météorologiques.
Les erreurs de connexion à wttr.in ne sont pas gérées dans les versions 1 et 2 mais peuvent être ajoutées pour une meilleure gestion des erreurs dans les futures versions.
