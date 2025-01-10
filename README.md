
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
- Bibliothèques nécessaires :
  - pandas (pour le traitement des données)
- Neo4j Desktop ou Serveur
- Fichiers de données :
  - `Behance_appreciate_1M`
  - `Behance_Item_to_Owners`

### Étapes
1. **Cloner ce dépôt :**
   ```bash
   git clone <URL-du-dépôt>
   ```

2. **Installer les bibliothèques nécessaires :**
   installez les dépendances manuellement :
   ```bash
   pip install pandas
   ```

3. **Prétraiter les données :**
   - Téléchargez les fichiers de données originaux (`Behance_appreciate_1M` et `Behance_Item_to_Owners`).
   - Placez-les dans le répertoire du projet.
   - Exécutez le script de prétraitement pour nettoyer et diviser les fichiers :
     ```bash
     python recommendation_preprocessing.py
     ```
   - Cela génère des fichiers nettoyés et découpés dans le même répertoire, notamment :
     - `cleaned_Behance_appreciate_part_1.csv`, `cleaned_Behance_appreciate_part_2.csv`, etc.
     - `cleaned_Behance_Item_to_Owners_part_1.csv`, `cleaned_Behance_Item_to_Owners_part_2.csv`.

4. **Charger les données dans Neo4j :**
   - Placez les fichiers CSV générés dans le répertoire `import` de Neo4j.
   - Ouvrez Neo4j Desktop ou connectez-vous à votre serveur Neo4j.
   - Importez les fichiers dans Neo4j en exécutant les requêtes Cypher suivantes dans Neo4j Browser :
     - **Création des nœuds User** :
       ```cypher
       LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_1.csv' AS row
       MERGE (user:User {id: row.user_id});
       ```
       Répétez cette commande pour les autres parties.

     - **Création des relations LIKED** :
       ```cypher
       LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_1.csv' AS row
       MATCH (user:User {id: row.user_id})
       MATCH (item:Item {id: row.item_id})
       CREATE (user)-[:LIKED {timestamp: row.timestamp}]->(item);
       ```
       Répétez cette commande pour toutes les parties.

     - **Création des nœuds Item et Owner** :
       Utilisez des requêtes similaires pour les fichiers `cleaned_Behance_Item_to_Owners`.

5. **Exécuter les recommandations :**
   - Lancez la requête Cypher pour générer des recommandations :
     ```cypher
     MATCH (user:User {id: '1238354'})-[:LIKED]->(item:Item)<-[:LIKED]-(similar:User)
     MATCH (similar)-[:LIKED]->(recommendedItem:Item)
     WHERE NOT (user)-[:LIKED]->(recommendedItem)
     RETURN recommendedItem.id AS RecommendedItem, COUNT(*) AS Score
     ORDER BY Score DESC
     LIMIT 5;
     ```
   - Remplacez `1238354` par l'ID de l'utilisateur cible.

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
