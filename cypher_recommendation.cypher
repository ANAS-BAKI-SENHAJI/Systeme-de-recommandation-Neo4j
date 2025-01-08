// Recommandations basées sur le filtrage collaboratif
MATCH (user:User {id: '1238354'})-[:LIKED]->(item:Item)<-[:LIKED]-(similar:User)
MATCH (similar)-[:LIKED]->(recommendedItem:Item)
WHERE NOT (user)-[:LIKED]->(recommendedItem)
RETURN recommendedItem.id AS RecommendedItem, COUNT(*) AS Score
ORDER BY Score DESC
LIMIT 5;
