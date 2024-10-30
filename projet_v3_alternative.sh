#!/bin/sh

# Définir la ville par défaut si aucun paramètre n'est fourni
if [ $# -eq 0 ]; then
    ville="Toulouse"
else
    ville=$1
fi

# URL de la source des données météo
url="https://wttr.in/${ville}?format=j1"

# Exporter les données brutes directement dans un fichier .txt
curl -s "$url" > local.txt

# Vérifier si la récupération des données a réussi
if [ $? -ne 0 ]; then
    # Si échec, écrire l'erreur avec un timestamp dans meteo_error.log
    echo "$(date +"%Y-%m-%d %H:%M:%S") - Erreur de connexion à wttr.in pour ${ville}" >> meteo_error.log
    echo "Une erreur est survenue lors de la récupération des données météo. Voir meteo_error.log pour plus de détails."
    exit 1
fi

# Extraction des données actuelles
tempact=$(grep -oE '"temp_C": *"[0-9]+"' local.txt | grep -oE '[0-9]+')°C
ventact=$(grep -oE '"windspeedKmph": *"[0-9]+"' local.txt | head -n 1 | grep -oE '[0-9]+')" km/h"
humidact=$(grep -oE '"humidity": *"[0-9]+"' local.txt | head -n 1 | grep -oE '[0-9]+')%
visibact=$(grep -oE '"visibility": *"[0-9]+"' local.txt | head -n 1 | grep -oE '[0-9]+')" km"

# Extraction des données du lendemain
templendemain=$(grep -oE '"avgtempC": *"[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')°C
ventlendemain=$(grep -oE '"windspeedKmph": *"[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')" km/h"
humidlendemain=$(grep -oE '"humidity": *"[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')%
visiblendemain=$(grep -oE '"visibility": *"[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')" km"

# Récupération de la date et de l'heure actuelles
heure=$(date +"%H:%M")
date=$(date +"%Y-%m-%d")

# Création du fichier journalier avec les informations dans le format demandé
nom_fichier="meteo_$(date +%Y%m%d).txt"
echo "$date - $heure - $ville : Actuel [Température: $tempact, Vent: $ventact, Humidité: $humidact, Visibilité: $visibact] - Demain [Température: $templendemain, Vent: $ventlendemain, Humidité: $humidlendemain, Visibilité: $visiblendemain]" >> "$nom_fichier"

# Écriture également dans le fichier meteo.txt pour un suivi global
echo "$date - $heure - $ville : Actuel [Température: $tempact, Vent: $ventact, Humidité: $humidact, Visibilité: $visibact] - Demain [Température: $templendemain, Vent: $ventlendemain, Humidité: $humidlendemain, Visibilité: $visiblendemain]" >> meteo.txt

# Suppression du fichier temporaire
rm -f local.txt

# Confirmation
echo "Les données météorologiques pour ${ville} ont été enregistrées dans $nom_fichier et meteo.txt."

exit 0

