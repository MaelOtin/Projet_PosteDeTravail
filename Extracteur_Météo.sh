#!/bin/bash

echo "Veuillez entrer le nom d'une ville :"
read nom_ville

#Recup de la meteo actuelle
temperature_aujourdhui=$(curl -s "wttr.in/$nom_ville?format=%t")

#Recup prevision demain
temperature_demain=$(curl -s "wttr.in/$nom_ville?format=%t&tomorrow")

#Date et heure 
jour_actuel=$(date '+%Y-%m-%d')
heure_actuelle=$(date '+%H:%M')

#Enregistrer les infos 
echo "$jour_actuel - $heure_actuelle - $nom_ville : $temperature_aujourdhui - $temperature_demain" >> meteo.txt
