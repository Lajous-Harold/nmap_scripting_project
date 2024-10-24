# Nmap Scripting Project

Ce projet est un ensemble de scripts Bash automatisant différentes tâches de scan réseau avec **Nmap**. Il permet d'effectuer des scans rapides, complets ou personnalisés, avec la possibilité de planifier des scans réguliers via **cron**. Les rapports sont ensuite envoyés par email.

## Fonctionnalités

- **Scan rapide** : Effectue un scan des 1000 premiers ports sur une IP ou URL avec détection optionnelle de l'OS et des services/versions.
- **Scan complet** : Scan de tous les ports (1 à 65535) sur une IP ou URL.
- **Scan personnalisé** : L'utilisateur spécifie les ports à scanner ainsi que l'IP ou l'URL.
- **Planification de scans via cron** : Planifie des scans (quotidien, hebdomadaire, mensuel, ou test) et envoie les rapports par email.
- **Gestion des options de détection** : Activer ou désactiver la détection de l'OS et des services/versions lors des scans.

## Installation

1. Clonez ce dépôt :
    ```bash
    git clone https://github.com/votre_utilisateur/nmap_scripting_project.git
    ```

2. Assurez-vous d'avoir **Nmap** installé :
    ```bash
    sudo apt-get install nmap
    ```

3. Assurez-vous d'avoir **mailutils** installé pour l'envoi d'emails :
    ```bash
    sudo apt-get install mailutils
    ```

4. Donnez les droits d'exécution aux scripts :
    ```bash
    chmod +x ./scripts/cron.sh
    chmod +x project_script.sh
    ```

## Utilisation

Lancez le script principal :
```bash
bash project_script.sh

nmap_scripting_project/
│
├── LICENSE
├── README.md               # Documentation du projet
├── project_script.sh        # Script principal du projet
├── scripts/                 # Contient les scripts exécutés automatiquement
│   └── cron.sh              # Script exécuté par cron pour les scans et l'envoi des rapports
└── rapports/                # Contient les rapports de scan générés
