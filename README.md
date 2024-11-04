# Docker-AutoUpdateADM
this script will allow docker to make these updates without asking you for administrator rights

# Lancer le script à chaque démarrage de Docker Desktop
Vous pouvez configurer le Planificateur de tâches pour surveiller le lancement de Docker et exécuter le script de mise à jour au démarrage.

Ouvrir le Planificateur de tâches :

Appuyez sur Win + R, tapez taskschd.msc et appuyez sur Entrée.
Créer une nouvelle tâche :

Dans le menu de droite, cliquez sur Créer une tâche….
Configurer la tâche :

Dans l’onglet Général, donnez un nom à la tâche, par exemple Mise à jour automatique Docker.
Cochez la case Exécuter avec les autorisations maximales pour que le script dispose des droits nécessaires.
Assurez-vous que la tâche est configurée pour s’exécuter avec votre compte administrateur.
Définir le déclencheur :

Allez dans l’onglet Déclencheurs et cliquez sur Nouveau….
Dans la liste déroulante Début de la tâche, choisissez Au démarrage d’un programme.
Dans Paramètres supplémentaires, sélectionnez Docker Desktop comme programme de démarrage. Cela garantit que le script est lancé à chaque fois que Docker démarre.
Configurer l’action :

Allez dans l’onglet Actions et cliquez sur Nouveau….
Dans Programme/script, entrez powershell.exe.
Dans Arguments, ajoutez :
powershell
Copier le code
-ExecutionPolicy Bypass -File "C:\chemin\vers\Update-DockerDesktop.ps1"
Remplacez "C:\chemin\vers\Update-DockerDesktop.ps1" par le chemin complet où vous avez sauvegardé votre script.
Enregistrer et tester la tâche :

Cliquez sur OK pour sauvegarder la tâche.
La prochaine fois que Docker Desktop démarrera, le script s’exécutera automatiquement.
