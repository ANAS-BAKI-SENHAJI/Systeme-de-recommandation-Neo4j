// Création des relations LIKED
LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_1.csv' AS row
MATCH (user:User {id: row.user_id})
MATCH (item:Item {id: row.item_id})
CREATE (user)-[:LIKED {timestamp: row.timestamp}]->(item);

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_2.csv' AS row
MATCH (user:User {id: row.user_id})
MATCH (item:Item {id: row.item_id})
CREATE (user)-[:LIKED {timestamp: row.timestamp}]->(item);

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_3.csv' AS row
MATCH (user:User {id: row.user_id})
MATCH (item:Item {id: row.item_id})
CREATE (user)-[:LIKED {timestamp: row.timestamp}]->(item);

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_4.csv' AS row
MATCH (user:User {id: row.user_id})
MATCH (item:Item {id: row.item_id})
CREATE (user)-[:LIKED {timestamp: row.timestamp}]->(item);

// Création des relations CREATED
LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_Item_to_Owners_part_1.csv' AS row
MATCH (item:Item {id: row.item_id})
MERGE (owner:Owner {id: row.owner_id})
CREATE (owner)-[:CREATED]->(item);

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_Item_to_Owners_part_2.csv' AS row
MATCH (item:Item {id: row.item_id})
MERGE (owner:Owner {id: row.owner_id})
CREATE (owner)-[:CREATED]->(item);
