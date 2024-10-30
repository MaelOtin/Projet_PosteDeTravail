# README **Extracteur Météo**

Ce projet contient plusieurs versions d'un script d'extraction de données météo depuis le service en ligne wttr.in.
Chaque version enregistre des informations météorologiques dans un fichier, en utilisant une ville spécifiée en paramètre ou une ville par défaut.

### 🟢 Version 1 : Extracteur_Météo_v1.sh
**Description**

Cette version nécessite que l’utilisateur fournisse le nom d'une ville comme argument lors de l'exécution. Si aucun argument n'est spécifié, le script affiche un message d'erreur et se termine sans extraire de données.

**Fonctionnalités :**

Demande le nom d'une ville comme argument obligatoire.
Affiche un message d'erreur en l’absence de ville spécifiée.
Utilise curl pour récupérer les données brutes depuis wttr.in.
Enregistre la date, l’heure et la température actuelle dans le fichier meteo.txt.
Exemple d'utilisation :


./Extracteur_Météo_v1.sh "Nom_Ville"
                           
### 🟢 Version 2 : Extracteur_Météo_v2.sh

**Description**

Cette version utilise "Toulouse" comme ville par défaut si aucun argument n'est fourni. Les données sont extraites, traitées et enregistrées dans meteo.txt.

**Fonctionnalités :**

Vérifie si un argument de ville est fourni ; sinon, utilise "Toulouse" par défaut.
Extrait la température actuelle et la température moyenne du lendemain depuis wttr.in.
Enregistre les informations avec la date et l’heure dans meteo.txt.
Exemple d'utilisation :

./Extracteur_Météo_v2.sh            # Utilise Toulouse par défaut

./Extracteur_Météo_v2.sh Paris       # Utilise Paris comme ville

### 🟢 Version 3 : Extracteur_Météo_v3.sh

**Description**

Cette version enregistre la météo à la fois dans un fichier journalier et dans meteo.txt pour un suivi global. Elle est similaire à la version 2 mais ajoute un fichier d'historique journalier.

**Fonctionnalités :**

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

**Notes**

Ces scripts utilisent le format JSON pour récupérer et traiter les données météorologiques.
Les erreurs de connexion à wttr.in ne sont pas gérées dans les versions 1 et 2 mais peuvent être ajoutées pour une meilleure gestion des erreurs dans les futures versions.

# **Extracteur Météo - Versions Alternatives**

## Description des versions alternatives

Ce projet contient plusieurs versions alternatives d'un script pour extraire des données météorologiques de [wttr.in](https://wttr.in/). 

---

## 📄 Versions Alternatives

### 🟢 Version 1 Alternative : `Extracteur_Météo_v1_alternative.sh`

**Description**

Cette version alternative utilise "Toulouse" comme ville par défaut si aucun paramètre n’est fourni. Elle extrait les données météorologiques actuelles et les prévisions du lendemain pour une ville donnée, et les enregistre dans deux fichiers : un fichier journalier et un fichier de suivi global (`meteo.txt`).

**Fonctionnalités** :

- Utilisation de "Toulouse" par défaut si aucun paramètre n’est fourni.
- Extraction des informations actuelles : température, vitesse du vent, taux d'humidité, et visibilité.
- Extraction des prévisions pour le lendemain.
- Création d’un fichier journalier avec un nom basé sur la date (`meteo_YYYYMMDD.txt`).
- Enregistrement des données dans `meteo.txt` pour un suivi global.

#### Exemple d'utilisation :

./Extracteur_Météo_v1_alternative.sh        # Utilise Toulouse par défaut

./Extracteur_Météo_v1_alternative.sh Paris   # Utilise Paris comme ville

### 🟢 Version 2 Alternative : Extracteur_Météo_v2_alternative.sh

**Description**

Cette version permet d'extraire les données météorologiques dans deux formats : texte ou JSON. En spécifiant -json comme premier argument, le script enregistre les données dans un fichier JSON structuré ; sans cette option, il utilise le format texte par défaut.

**Fonctionnalités :**

Vérification du nombre de paramètres, utilisation de "Toulouse" par défaut.
Prend en charge l'option -json pour choisir le format de sortie (JSON ou texte).
Extraction des informations actuelles et des prévisions : température, prévisions météorologiques, vent, humidité, et visibilité.
Création d’un fichier de sortie journalier (en JSON ou texte) selon la date.
Enregistrement des informations dans meteo.txt si le format texte est sélectionné.

**Exemple d'utilisation :**

./Extracteur_Météo_v2_alternative.sh Marseille          # Enregistre les données en texte

./Extracteur_Météo_v2_alternative.sh -json Marseille    # Enregistre les données en JSON

### 🟢 Version 3 Alternative : Extracteur_Météo_v3_alternative.sh

**Description**

Cette version améliore la gestion des erreurs en ajoutant un fichier de log (meteo_error.log) pour enregistrer les erreurs de connexion avec des timestamps. Si la connexion à wttr.in échoue, le script consigne l'erreur dans le log, avec l'heure et la date, sans tenter d'extraire d'autres données.

**Fonctionnalités :**

Vérification de la connexion à wttr.in ; en cas d’échec, enregistrement d’un message d'erreur horodaté dans meteo_error.log.
Extraction des informations actuelles et des prévisions du lendemain : température, vent, humidité et visibilité.
Création d’un fichier journalier pour chaque jour d'exécution.
Enregistrement dans un fichier de suivi global (meteo.txt) pour un suivi continu.
Exemple d'utilisation :

./Extracteur_Météo_v3_alternative.sh                # Utilise Toulouse par défaut

./Extracteur_Météo_v3_alternative.sh Lyon           # Utilise Lyon comme ville

Pré-requis
Connexion Internet pour accéder à wttr.in.
curl doit être installé sur le système.

**Notes**
Les versions alternatives offrent des fonctionnalités supplémentaires par rapport aux versions de base, notamment la gestion des erreurs (version 3 alternative) et la sélection du format de sortie (version 2 alternative).
