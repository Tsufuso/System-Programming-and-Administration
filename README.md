# System-Programming-and-Administration
projet todo tasks


Script de Gestion de Tâches
Ce script Bash permet de gérer facilement les tâches à faire (todo tasks). Il offre plusieurs fonctionnalités telles que la création, la mise à jour, la suppression, l'affichage, la recherche et la liste des tâches.

---------------------------------------------------------------------------------------------------------------------------------
Fonctionnalités
Création de tâches: Permet de créer une nouvelle tâche avec un titre, une description, une date d'échéance, un lieu et un statut de complétion.

Mise à jour de tâches: Permet de mettre à jour les informations d'une tâche existante, y compris son titre, sa description, sa date d'échéance, son lieu et son statut de complétion.

Suppression de tâches: Permet de supprimer une tâche existante en fonction de son identifiant unique.

Affichage d'informations sur une tâche: Affiche les informations détaillées d'une tâche spécifique en fonction de son identifiant unique.

Liste des tâches du jour: Affiche les tâches complétées et non complétées pour la journée en cours.

Recherche de tâches par titre: Permet de rechercher des tâches en fonction de leur titre.
---------------------------------------------------------------------------------------------------------------------------------
Prérequis
Shell Bash
Système d'exploitation compatible avec Bash

Assurez-vous que le script todo.sh est exécutable. Sinon, exécutez la commande suivante pour le rendre exécutable :
    chmod +x todo.sh

Exécutez le script en utilisant la commande suivante :
    ./todo.sh
---------------------------------------------------------------------------------------------------------------------------------
Avec le menu :
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
---------------------------------------------------------------------------------------------------------------------------------
Sans le menu :
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


Ces deux méthodes offrent une flexibilité dans l'utilisation du script, en fonction des préférences de l'utilisateur ou des besoins spécifiques.
