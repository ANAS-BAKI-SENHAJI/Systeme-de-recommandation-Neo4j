
# Système de recommandation avec Neo4j

## Description
Ce projet implémente un système de recommandation en utilisant des graphes avec Neo4j, basé sur les données de la plateforme Behance. 
L'objectif est de recommander des projets artistiques aux utilisateurs en fonction de leurs interactions passées avec la plateforme.

## Objectifs
- Prétraitement et manipulation de données volumineuses avec Python.
- Modélisation des relations utilisateur-item avec Neo4j.
- Implémentation d'une approche de filtrage collaboratif pour générer des recommandations.

## Données
Les données utilisées proviennent du Behance Dataset Repository :
- **Behance_appreciate_1M** : Relations entre utilisateurs et projets appréciés.
- **Behance_Item_to_Owners** : Créateurs des projets.

## Étapes principales
1. **Prétraitement des données :**
   - Nettoyage des fichiers pour supprimer les données manquantes.
   - Découpage des fichiers volumineux en parties gérables.

2. **Chargement dans Neo4j :**
   - Création des nœuds (utilisateurs, projets, créateurs).
   - Création des relations (`LIKED`, `CREATED`) pour représenter les interactions.

3. **Recommandation :**
   - Utilisation d'un filtrage collaboratif basé sur les relations pour recommander des projets.

## Installation et Exécution
### Prérequis
- Python (3.8 ou supérieur)
- Bibliothèques : pandas
- Neo4j Desktop ou Serveur

### Étapes
1. Clonez ce dépôt : `git clone <URL-du-dépôt>`
2. Installez les dépendances : `pip install -r requirements.txt`
3. Téléchargez les fichiers de données originaux et placez-les dans le répertoire du projet.
4. Exécutez le script de prétraitement :
   ```bash
   python preprocessing.py
   ```
5. Importez les fichiers résultants dans Neo4j à l'aide des commandes Cypher fournies.

## Résultats
Les recommandations générées sont basées sur des relations d'utilisateur à utilisateur, en exploitant les interactions passées.

## Rapport du projet

Un rapport détaillé expliquant toutes les étapes du projet, y compris :
- Le contexte et les objectifs.
- La méthodologie utilisée pour le prétraitement des données.
- Les requêtes Cypher pour la création des nœuds et relations.
- L'approche adoptée pour les recommandations.

Ce rapport est disponible dans le fichier nommé **Rapport_Projet_Recommandation.pdf**. Il contient des explications approfondies et des exemples pour mieux comprendre les décisions et les résultats du projet.

## Auteur
Anas Baki-Senhaji


