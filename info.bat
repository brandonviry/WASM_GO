@echo off
setlocal enabledelayedexpansion

REM Chemin vers le répertoire du projet
set "PROJET=%CD%"

REM Fichier de sortie pour enregistrer les commentaires et la structure du répertoire
set "SORTIE=%PROJET%\rapport.txt"

REM Effacer le fichier de sortie s'il existe déjà
if exist "%SORTIE%" del "%SORTIE%"

REM Enregistrer la structure du répertoire dans le fichier de sortie
echo Structure du répertoire du projet: >> "%SORTIE%"
tree /F /A "%PROJET%" >> "%SORTIE%"
echo -------------------------------------------- >> "%SORTIE%"

REM Définir le motif de recherche pour les commentaires dans les fichiers JS et Go
set "JS_COMMENT_PATTERN=\/\/.*"
set "GO_COMMENT_PATTERN=\/\/.*|\/\*[\s\S]*?\*\/"

REM Parcourir tous les fichiers JS du projet, enregistrer leur contenu et les commentaires dans le fichier de sortie
for /r "%PROJET%" %%f in (*.js) do (
    set "f=%%f"
    REM Vérifier si le chemin est absolu
    if "!f:~1,1!"==":" (
        set "f=!f:%PROJET%=!"
    ) else (
        set "f=.!f:%PROJET%=!"
    )
    echo Contenu du fichier: !f! >> "%SORTIE%"
    type "%%f" >> "%SORTIE%"
    echo -------------------------------------------- >> "%SORTIE%"
    echo Commentaires dans le fichier: !f! >> "%SORTIE%"
    findstr /R /C:"%JS_COMMENT_PATTERN%" "%%f" >> "%SORTIE%"
    echo -------------------------------------------- >> "%SORTIE%"
)

REM Parcourir tous les fichiers Go du projet, enregistrer leur contenu et les commentaires dans le fichier de sortie
for /r "%PROJET%" %%f in (*.go) do (
    set "f=%%f"
    REM Vérifier si le chemin est absolu
    if "!f:~1,1!"==":" (
        set "f=!f:%PROJET%=!"
    ) else (
        set "f=.!f:%PROJET%=!"
    )
    echo Contenu du fichier: !f! >> "%SORTIE%"
    type "%%f" >> "%SORTIE%"
    echo -------------------------------------------- >> "%SORTIE%"
    echo Commentaires dans le fichier: !f! >> "%SORTIE%"
    findstr /R /C:"%GO_COMMENT_PATTERN%" "%%f" >> "%SORTIE%"
    echo -------------------------------------------- >> "%SORTIE%"
)

echo Les contenus des fichiers, les commentaires et la structure du répertoire ont été enregistrés dans "%SORTIE%"

