#!/bin/bash
#fonction1 : fast_scan
#fonction2 : full_scan
#fonction3 : custom_scan

#fonction 4 : toggle_os_detect
#fonction 5 : toggle_version_detect

#fonction 6 :

detect_os="off"
detect_version="off"

fast_scan(){
    echo "Entrez une adresse ip ou une URL"
    read user_scan
    if [[ $detect_os == "on" ]]; then 
        if [[ $detect_version == "on" ]]; then 
            nmap -o -sV $user_scan
        else
            nmap -o $user_scan
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
    if [[ -n user_scan  ]]; then
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
            nmap -o -sV $user_scan
        else
            nmap -o $user_scan
        fi
    else
        if [[ $detect_version == "on" ]]; then
            nmap -sV $user_scan
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
        echo "Detection des services et versions logiciel active."
    else
        detect_version="off"
        echo "Detection des services et versions logiciel desactive."
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

sous_menu_scans(){
    while true; do
        #clear
        echo "1. Scan rapide"
        echo "2. Scan complet"
        echo "3. Scan personalise"
        echo "4. Back"
        read -p "Choisissez une option : " choix_1
        case $choix_1 in

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
            echo "Choix invalide. Essayez de nouveau."
            ;;
        esac
    done
}

sous_menu_detection(){
    while true; do
        #clear
        echo "1. Activer/Desactiver la detection OS (actuellement $detect_os)"
        echo "2. Activer/Desactiver la detectionn des services et logiciels (actuellement $detect_version)"
        echo "3. Back"
        read -p "Choisissez une option : " choix_1
        case $choix_1 in

            1) 
            toggle_os_detect
            ;;

            2) 
            toggle_version_detect
            ;;

            3) 
            clear
            break;;

            *) 
            clear
            echo "Choix invalide. Essayez de nouveau."
            ;;
        esac
    done
}

sous_menu_planification(){
    while true; do
        clear
        echo "1. WIP"
        echo "2. WIP"
        echo "3. WIP"
        echo "4. Back"
        read -p "Choisissez une option : " choix_1
        case $choix_1 in

            1) 
            echo "WIP" #A Faire
            ;;

            2) 
            cho "WIP" #A Faire
            ;;

            3) 
            echo "WIP" #A Faire
            ;;

            4) 
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
    echo "2. Option de detection des OS, services et versions logiciels"
    echo "3. Planification des scans [WIP]"
    echo "4. Quit"
    read -p "Choisissez une option : " choix 

    case $choix in

        1) 
        sous_menu_scans
        ;;

        2)
        sous_menu_detection
        ;;

        3)
        sous_menu_planification
        ;;

        4) 
        echo "Sortie du programme."
        sleep 1
        clear
        exit
        ;;

        *) 
        clear
        echo "Choix invalide. Essayez de nouveau."
        ;;
    esac
done

