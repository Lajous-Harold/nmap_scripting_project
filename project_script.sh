#!/bin/bash
#fonction1 : fast_scan
#fonction2 : full_scan
#fonction3 : custom_scan

#fonction 4 : toggle_os_detect
#fonction 5 : toggle_version_detect

#fonction 6 :

source ./scripts/cron.sh

detect_os="off"
detect_version="off"

fast_scan(){
    echo "Entrez une adresse ip ou une URL"
    read user_scan
    if [[ $detect_os == "on" ]]; then 
        if [[ $detect_version == "on" ]]; then 
            nmap -O -sV $user_scan
        else
            nmap -O $user_scan
        fi
    else
        if [[ $detect_version == "on" ]]; then
            nmap -sV $user_scan
        else 
            nmap -F $user_scan
        fi
    fi
}

full_scan(){
    echo "Entrez une adresse ip ou une URL"
    read user_scan
    if [[ -n $user_scan  ]]; then
        nmap -p 1-65535 "$user_scan"
    else 
        echo "Le champs est vide"
    fi
}

custom_scan(){
    read -p "Entrez une adresse ip ou une URL : " user_scan
    read -p "Entrez un ou des ports spécifiques (Ex: 22,80)" ports
    if [[ $detect_os == "on" ]]; then 
        if [[ $detect_version == "on" ]]; then 
            nmap -O -sV -p $ports $user_scan
        else
            nmap -O -p $ports $user_scan
        fi
    else
        if [[ $detect_version == "on" ]]; then
            nmap -sV -p $ports $user_scan
        else 
            nmap -p $ports $user_scan
        fi
    fi    
}

toggle_os_detect(){
    if [[ $detect_os == "off" ]]; then
        detect_os="on"
        echo "Detection d'OS active."
    else
        detect_os="off"
        echo "Detection d'OS desactive."
    fi
}

toggle_version_detect(){
    if [[ $detect_version == "off" ]]; then
        detect_version="on"
        echo "Detection des services et versions logiciel activée."
    else
        detect_version="off"
        echo "Detection des services et versions logiciels desactivée."
    fi
}

single_scan(){
    :
}

batch_scan(){
    :
}

multiple_scan(){
    :
}

planifier_scan(){
    echo "Choisissez la fréquence de planification :"
    echo "1. Quotidien"
    echo "2. Hebdomadaire"
    echo "3. Mensuel"
    echo "4. Retour"
    read -p "Choisissez une option : " choix_planif

    case $choix_planif in
        1) 
        echo "Planification quotidienne."
        echo "Entrez l'adresse IP ou URL à scanner :"
        read user_scan
        echo "Entrez l'adresse email pour recevoir les rapports :"
        read user_email
        # Ajouter une tâche cron pour un scan quotidien à 2h du matin
        (crontab -l 2>/dev/null; echo "0 2 * * * /path/to/nmap_scan.sh $user_scan $user_email") | crontab -
        echo "Scan quotidien planifié à 2h du matin."
        ;;

        2) 
        echo "Planification hebdomadaire."
        echo "Entrez l'adresse IP ou URL à scanner :"
        read user_scan
        echo "Entrez l'adresse email pour recevoir les rapports :"
        read user_email
        # Ajouter une tâche cron pour un scan hebdomadaire chaque lundi à 2h du matin
        (crontab -l 2>/dev/null; echo "0 2 * * 1 /path/to/nmap_scan.sh $user_scan $user_email") | crontab -
        echo "Scan hebdomadaire planifié chaque lundi à 2h du matin."
        ;;

        3) 
        echo "Planification mensuelle."
        echo "Entrez l'adresse IP ou URL à scanner :"
        read user_scan
        echo "Entrez l'adresse email pour recevoir les rapports :"
        read user_email
        # Ajouter une tâche cron pour un scan mensuel le 1er de chaque mois à 2h du matin
        (crontab -l 2>/dev/null; echo "0 2 1 * * ./scripts/cron.sh $user_scan $user_email") | crontab -
        echo "Scan mensuel planifié le 1er de chaque mois à 2h du matin."
        ;;

        4)
        clear
        return
        ;;

        *)
        clear
        echo "Choix invalide. Réessayez."
        planifier_scan
        ;;
    esac
}

sous_menu_scans(){
    while true; do
        echo "1. Scan rapide"
        echo "2. Scan complet"
        echo "3. Scan personalisé"
        echo "4. Back"
        read -p "Choisissez une option : " choix_scan
        case $choix_scan in

            1) 
            clear
            fast_scan
            ;;

            2) 
            clear
            full_scan
            ;;

            3) 
            clear
            custom_scan
            ;;

            4) 
            clear
            break
            ;;

            *) 
            clear
            echo "Choix invalide. Essayez de nouveau :"
            ;;
        esac
    done
}

sous_menu_detection(){
    while true; do
        echo "1. Activer/Désactiver la detection OS (actuellement $detect_os)"
        echo "2. Activer/Désactiver la détection des services et logiciels (actuellement $detect_version)"
        echo "3. Back"
        read -p "Choisissez une option : " choix_detect
        case $choix_detect in

            1) 
            clear
            toggle_os_detect
            ;;

            2) 
            clear
            toggle_version_detect
            ;;

            3) 
            clear
            break;;

            *) 
            clear
            echo "Choix invalide. Essayez de nouveau :"
            ;;
        esac
    done
}

sous_menu_planification(){
    while true; do
        echo "1. Planifier un scan"
        echo "2. Voir les scans planifiés"
        echo "3. Retour"
        read -p "Choisissez une option : " choix_plan

        case $choix_plan in
            1) 
                clear
                planifier_scan
                ;;
            2)
                clear
                crontab -l
                ;;
            3) 
                clear
                break
                ;;
            *) 
                clear
                echo "Choix invalide. Essayez de nouveau."
                ;;
        esac
    done
}


while true; do
    echo "1. Tous les scans"
    echo "2. Option de détection des OS, services et versions logiciels"
    echo "3. Planification des scans [WIP]"
    echo "4. Quit"
    read -p "Choisissez une option par son numéro associé: " choix 

    case $choix in

        1) 
        clear
        sous_menu_scans
        ;;

        2)
        clear
        sous_menu_detection
        ;;

        3)
        clear
        sous_menu_planification
        ;;

        4) 
        clear
        echo "Sortie du programme..."
        sleep 1
        clear
        exit
        ;;

        *) 
        clear
        echo "Choix invalide. Essayez de nouveau :"
        ;;
    esac
done

