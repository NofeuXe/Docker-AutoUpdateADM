# Script pour automatiser la mise à jour de Docker Desktop sur Windows

# Chemin vers l'installation de Docker Desktop
$dockerPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"

# Fonction pour vérifier la version actuelle de Docker
function Get-CurrentDockerVersion {
    $dockerVersionOutput = & "$dockerPath" --version
    $dockerVersionOutput -match "([0-9]+\.[0-9]+\.[0-9]+)"
    return $matches[1]
}

# Fonction pour télécharger et installer la dernière version de Docker Desktop
function Update-DockerDesktop {
    Write-Output "Vérification de la dernière version de Docker Desktop..."
    $latestReleaseUrl = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
    $tempInstallerPath = "$env:TEMP\DockerDesktopInstaller.exe"

    # Télécharger le dernier installateur de Docker
    Write-Output "Téléchargement de Docker Desktop..."
    Invoke-WebRequest -Uri $latestReleaseUrl -OutFile $tempInstallerPath

    # Exécuter l'installateur sans demande de confirmation
    Write-Output "Installation de la mise à jour Docker Desktop..."
    Start-Process -FilePath $tempInstallerPath -ArgumentList "--quiet" -Wait -NoNewWindow

    # Supprimer l'installateur temporaire
    Remove-Item -Path $tempInstallerPath -Force

    Write-Output "Mise à jour de Docker Desktop terminée."
}

# Récupérer la version actuelle
$currentVersion = Get-CurrentDockerVersion
Write-Output "Version actuelle de Docker Desktop : $currentVersion"

# Exécuter la mise à jour de Docker Desktop
Update-DockerDesktop
