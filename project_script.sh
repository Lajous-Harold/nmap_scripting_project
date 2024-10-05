#!/bin/bash
#fonction1 : fast_scan
#fonction2 : full_scan
#fonction3 : custom_scan

#fonction 4 : os_detect_on
#fonction 4 : detection_system_off
#fonction 5 : version_detect_on
#fonction 6 : version_detect_off

#fonction 6 :

fast_scan(){
    :
}

full_scan(){
    :
}

custom_scan(){
    :
}

os_detect_on(){
    :
}

os_detect_off(){
    :
}

version_detect_on(){
    :
}

version_detect_off(){
    :
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

while true; do
    echo "1. Tous les scans"
    echo "2. Option de detection des OS, services et versions logiciels"
    echo "3. Planification des scans"
    echo "4. Quit"
    read -p "Choisissez une option : " choix 

    case $choix in
        1) clear
        echo "1. WIP"
        echo "2. WIP"
        echo "3. WIP"
        echo "4. WIP"
        read -p "Choisissez une option : " choix_1
        case $choix_1 in
            1) fast_scan #echo "WIP"
            ;;
            2) echo "WIP"
            ;;
            3) echo "WIP"
            ;;
            4)  echo "WIP" #Back
            ;;
            *) echo "Choix invalide. Essayez de nouveau.";;
        esac;;

        2)read -p "Choisissez une option : " choix_1
        case $choix_1 in
            1) echo "WIP"
            ;;
            2) echo "WIP"
            ;;
            3) echo "WIP"
            ;;
            4)  echo "WIP" #Back
            ;;
            *) echo "Choix invalide. Essayez de nouveau.";;
        esac;;

        3)read -p "Choisissez une option : " choix_1
        case $choix_1 in
            1) echo "WIP"
            ;;
            2) echo "WIP"
            ;;
            3) echo "WIP"
            ;;
            4)  echo "WIP" #Back
            ;;
            *) echo "Choix invalide. Essayez de nouveau.";;
        esac;;

        4) 
        echo "Sortie du programme."
        sleep 1
        clear
        exit;;

        *) echo "Choix invalide. Essayez de nouveau.";;
    esac
done
        