#! /bin/sh
#vérification nombre de paramètres
if [ $# -eq 0 ]
then
    ville="Toulouse"
else
    ville=$1
fi

#exportation données brutes dans fichier .txt
curl -s wttr.in/$ville?format=j2 > local.txt

#récupération température actuelle
tempact=$(grep -oE '"temp_C": "[0-9]+"' local.txt | grep -oE '[0-9]+')°C

#récupération température du lendemain
templen=$(grep -oE '"avgtempC": "[0-9]+"' local.txt | sed -n '2p' | grep -oE '[0-9]+')°C

#meteo en une ligne
heure=$(date +"%H:%M")
date=$(date +"%Y-%m-%d")
meteo="$date - $heure - $ville : $tempact - $templen"
echo $meteo >> meteo.txt

exit 0
