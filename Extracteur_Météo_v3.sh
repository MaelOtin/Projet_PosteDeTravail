#!/bin/sh

# Vérification nombre de paramètres
if [ $# -eq 0 ]; then
    ville="Toulouse"
else
    ville=$1
fi

# Exportation des données brutes dans un fichier .txt
curl -s wttr.in/$ville?format=j2 > local.txt

# Récupération de la température actuelle
tempact=$(grep -oE '"temp_C": "[0-9]+"' local.txt | grep -oE '[0-9]+')°C


# Récupération de la température du lendemain
templen=$(grep -oE '"avgtempC": "[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')°C

# Récupération de l'heure et de la date
heure=$(date +"%H:%M")
date=$(date +"%Y-%m-%d")


# Création du fichier d'historique journalier
nom_fichier="meteo_$(date +%Y%m%d).txt"
echo "$date - $heure - $ville : $tempact - $templen" >> "$nom_fichier"

# Écriture également dans le fichier meteo.txt pour suivi global
echo "$date - $heure - $ville : $tempact - $templen" >> meteo.txt

exit 0
