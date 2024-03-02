# Projet WASM_GO :JavaScript, Go et WebAssembl

Ce projet est une application web expérimentale qui explore les fonctionnalités de WebAssembly avec Go. C'est ma première expérience avec cette technologie, où j'explore comment intégrer du code Go dans une application web à l'aide de WebAssembly.

## Structure du dossier

WASM_GO
│ build.bat
│ index.html
│ info.bat
│
├── go
│ operation.go
│
├── js
│ │ main.js
│ │
│ └── lib
│ wasm_exec.js
│
└── wasm
operation.wasm

## Contenu des fichiers

### `go/operation.go`

Ce fichier contient les fonctions opérationnelles utilisées dans le projet, telles que l'addition, la soustraction, la multiplication et le calcul de la moyenne.

### `js/main.js`

Ce fichier JavaScript est responsable de la récupération des données contenues dans le binaire WebAssembly (`operation.wasm`) et de la gestion des événements associés aux saisies utilisateur.

### `js/lib/wasm_exec.js`

Ce fichier est une bibliothèque JavaScript fournie par Go pour faciliter l'exécution du code WebAssembly dans un environnement JavaScript.

## Scripts utiles

- `build.bat`: Script de construction du projet.
- `info.bat`: Script pour afficher des informations sur le projet.
- `index.html`: Page HTML principale du projet.

## Utilisation

### Méthode 1

1. Cloner le projet sur un serveur web.
2. Accéder au répertoire du projet à l'aide d'un navigateur web pour démarrer l'application.

### Méthode 2

Directement avec se lien : [wasm-go.vercel.app](wasm_go.vercel.app)

## Dépendances

- [Tailwind CSS](https://tailwindcss.com/) : Utilisé pour le style de l'interface utilisateur.

## Licence

AUCUNE licence 
