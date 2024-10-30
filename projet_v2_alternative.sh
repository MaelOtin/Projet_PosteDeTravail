#!/bin/sh

# Définir la ville par défaut si aucun paramètre n'est fourni
if [ $# -eq 0 ]; then
    ville="Toulouse"
else
    ville=$1
fi

# Vérifier si l'option -json est présente pour choisir le format
if [ "$1" = "-json" ]; then
    format="json"
    ville=$2
else
    format="txt"
fi

# Utiliser la ville par défaut si aucun argument n'est fourni
if [ -z "$ville" ]; then
    ville="Toulouse"
fi

# URL de la source des données météo
url="https://wttr.in/${ville}?format=j1"

# Exporter les données brutes directement dans un fichier .txt
curl -s "$url" > local.txt

# Extraction des données actuelles
tempact=$(grep -oE '"temp_C": *"[0-9]+"' local.txt | grep -oE '[0-9]+')°C
ventact=$(grep -oE '"windspeedKmph": *"[0-9]+"' local.txt | head -n 1 | grep -oE '[0-9]+')" km/h"
humidact=$(grep -oE '"humidity": *"[0-9]+"' local.txt | head -n 1 | grep -oE '[0-9]+')%
visibact=$(grep -oE '"visibility": *"[0-9]+"' local.txt | head -n 1 | grep -oE '[0-9]+')" km"

# Prévision actuelle
previsionact=$(grep -oE '"weatherDesc": *\[ *\{"value": *"[^"]+"' local.txt | head -n 1 | sed 's/.*"value": *"\([^"]*\)".*/\1/')

# Extraction des données du lendemain
templendemain=$(grep -oE '"avgtempC": *"[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')°C
ventlendemain=$(grep -oE '"windspeedKmph": *"[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')" km/h"
humidlendemain=$(grep -oE '"humidity": *"[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')%
visiblendemain=$(grep -oE '"visibility": *"[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')" km"

# Prévision du lendemain
previsionlendemain=$(grep -oE '"weatherDesc": *\[ *\{"value": *"[^"]+"' local.txt | sed -n '2p' | sed 's/.*"value": *"\([^"]*\)".*/\1/')

# Récupération de la date et de l'heure actuelles
heure=$(date +"%H:%M")
date=$(date +"%Y-%m-%d")

if [ "$format" = "json" ]; then
    # Création du fichier JSON avec les informations actuelles et du lendemain
    nom_fichier="meteo_$(date +%Y%m%d).json"
    echo "{
    \"date\": \"$date\",
    \"heure\": \"$heure\",
    \"ville\": \"$ville\",
    \"actuel\": {
        \"temperature\": \"$tempact\",
        \"prevision\": \"$previsionact\",
        \"vent\": \"$ventact\",
        \"humidite\": \"$humidact\",
        \"visibilite\": \"$visibact\"
    },
    \"lendemain\": {
        \"temperature\": \"$templendemain\",
        \"prevision\": \"$previsionlendemain\",
        \"vent\": \"$ventlendemain\",
        \"humidite\": \"$humidlendemain\",
        \"visibilite\": \"$visiblendemain\"
    }
}" > "$nom_fichier"
    echo "Les données météorologiques pour ${ville} ont été enregistrées dans $nom_fichier."

else
    # Création du fichier texte journalier avec les informations dans le format demandé
    nom_fichier="meteo_$(date +%Y%m%d).txt"
    echo "$date - $heure - $ville : Actuel [Température: $tempact, Prévision: $previsionact, Vent: $ventact, Humidité: $humidact, Visibilité: $visibact] - Demain [Température: $templendemain, Prévision: $previsionlendemain, Vent: $ventlendemain, Humidité: $humidlendemain, Visibilité: $visiblendemain]" >> "$nom_fichier"
    echo "$date - $heure - $ville : Actuel [Température: $tempact, Prévision: $previsionact, Vent: $ventact, Humidité: $humidact, Visibilité: $visibact] - Demain [Température: $templendemain, Prévision: $previsionlendemain, Vent: $ventlendemain, Humidité: $humidlendemain, Visibilité: $visiblendemain]" >> meteo.txt
    echo "Les données météorologiques pour ${ville} ont été enregistrées dans $nom_fichier et meteo.txt."
fi

# Suppression du fichier temporaire
rm -f local.txt

exit 0

