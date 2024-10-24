#!/bin/bash

# Vérifier si un argument est passé
if [ -z "$1" ]; then
    echo "Usage: $0 [ville]"
    exit 1
fi

VILLE=$1
FICHIER_TEMP="meteo_raw.txt"
FICHIER_RESULTAT="meteo.txt"
DATE=$(date "+%Y-%m-%d")
HEURE=$(date "+%H:%M")

# 1. Utiliser curl pour récupérer les données météorologiques brutes
curl -s "wttr.in/$VILLE?format=%t\n%T" -o $FICHIER_TEMP

# 2. Extraire les informations de température actuelle et prévision pour le lendemain
TEMP_ACTUELLE=$(sed -n '1p' $FICHIER_TEMP)  # Première ligne : température actuelle
TEMP_PREVISION=$(sed -n '2p' $FICHIER_TEMP) # Deuxième ligne : prévision du lendemain

# 3. Vérifier si les données sont disponibles
if [ -z "$TEMP_ACTUELLE" ] || [ -z "$TEMP_PREVISION" ]; then
    echo "Erreur : Impossible de récupérer les données météorologiques pour $VILLE."
    exit 1
fi

# 4. Formater et enregistrer les informations dans meteo.txt
echo "$DATE - $HEURE - $VILLE : $TEMP_ACTUELLE - $TEMP_PREVISION" >> $FICHIER_RESULTAT

# Afficher un message de confirmation
echo "Les informations météorologiques pour $VILLE ont été sauvegardées dans $FICHIER_RESULTAT."
