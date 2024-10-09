#!/bin/bash

# Variables
user_scan=$1  # IP ou URL à scanner (passée en argument)
user_email=$2  # Adresse email pour recevoir le rapport

# Exécuter le scan Nmap et sauvegarder le résultat dans un fichier
output_file="../rapports/rapport_nmap_$(date +%F).txt"
nmap -O -sV $user_scan > $output_file

# Envoyer le rapport par email
mail -s "Rapport Nmap pour $user_scan" $user_email < $output_file
