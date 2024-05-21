# System-Programming-and-Administration
projet todo tasks

Ce script vous aide à gérer vos tâches à faire. Il fournit une interface guidée par menu ainsi que des options de ligne de commande directe pour créer, mettre à jour, supprimer, afficher, lister et rechercher des tâches.

## Choix de Conception

### Stockage des Données
- **Stockage basé sur un fichier** : Les tâches sont stockées dans un fichier texte nommé `todo_tasks.txt` avec chaque tâche sur une ligne distincte (si il n'existe pas il sera creer automatiquement).
- **Format des données** : Chaque tâche est stockée sous forme de chaîne délimitée par des pipes (`|`) avec les champs suivants :
  - ID de la tâche
  - Titre
  - Description
  - Localisation
  - Date et heure d'échéance (format : YYYY-MM-DD HH:MM)
  - Statut d'achèvement (Y/N)

### Organisation du Code
- Le script est organisé en fonctions, chacune gérant une opération de tâche spécifique (créer, mettre à jour, supprimer, afficher, lister, rechercher).
- Les fonctions sont définies en haut du script pour une référence et une réutilisation faciles.
- La logique principale du script est contrôlée par une boucle `while` qui affiche un menu et traite les entrées utilisateur.
---------------------------------------------------------------------------------------------------------------------------------
# Prérequis
Shell Bash
Système d'exploitation compatible avec Bash

Assurez-vous que le script todo.sh est exécutable. Sinon, exécutez la commande suivante pour le rendre exécutable :

    chmod +x todo.sh
    
Exécutez le script en utilisant la commande suivante :

    ./todo.sh

---------------------------------------------------------------------------------------------------------------------------------
# Avec le menu :
Création d'une nouvelle tâche :

Choisissez l'option create dans le menu.
Suivez les instructions pour fournir les détails de la tâche.
Mise à jour d'une tâche existante :

Choisissez l'option update dans le menu.
Suivez les instructions pour fournir l'identifiant de la tâche et les nouvelles informations.
Suppression d'une tâche :

Choisissez l'option delete dans le menu.
Suivez les instructions pour fournir l'identifiant de la tâche à supprimer.
Affichage d'informations sur une tâche :

Choisissez l'option show dans le menu.
Suivez les instructions pour fournir l'identifiant de la tâche.
Liste des tâches du jour :

Choisissez l'option list dans le menu.
Recherche de tâches par titre :

Choisissez l'option search dans le menu.
Suivez les instructions pour fournir le titre à rechercher.

Choisissez l'option help dans le menu :
Suivez les instructions pour savoir la syntaxe de chaque option.

---------------------------------------------------------------------------------------------------------------------------------
# Sans le menu :
Création d'une nouvelle tâche :

Exécutez la commande ./todo.sh create.
Suivez les instructions pour fournir les détails de la tâche.

Mise à jour d'une tâche existante :
Exécutez la commande ./todo.sh update.
Suivez les instructions pour fournir l'identifiant de la tâche et les nouvelles informations.

Suppression d'une tâche :
Exécutez la commande ./todo.sh delete.
Suivez les instructions pour fournir l'identifiant de la tâche à supprimer.

Affichage d'informations sur une tâche :
Exécutez la commande ./todo.sh show.
Suivez les instructions pour fournir l'identifiant de la tâche.

Liste des tâches du jour :
Exécutez la commande ./todo.sh list.

Recherche de tâches par titre :
Exécutez la commande ./todo.sh search.
Suivez les instructions pour fournir le titre à rechercher.

Besoin d'aide ? :
Exécutez la commande ./todo.sh help.
Suivez les instructions pour savoir la syntaxe de chaque option.

  Merci.
