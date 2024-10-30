Ce script récupère et enregistre la température actuelle et les prévisions du jour suivant pour une ville spécifiée. Les données météo sont récupérées à l'aide de la curlcommande du service wttr.in.

Usage:

frapper

Copier le code
./weather.sh [ville]
Remplacez [ville]par le nom de la ville souhaitée. Par exemple :

frapper

Copier le code
./weather.sh Paris
Sortie :
Le script crée une entrée dans le meteo.txtfichier contenant :

Date et heure de récupération des données
Nom de la ville
Température actuelle
Prévisions de température pour le lendemain
