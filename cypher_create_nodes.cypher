// Création des nœuds User
LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_1.csv' AS row
MERGE (user:User {id: row.user_id});

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_2.csv' AS row
MERGE (user:User {id: row.user_id});

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_3.csv' AS row
MERGE (user:User {id: row.user_id});

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_4.csv' AS row
MERGE (user:User {id: row.user_id});

// Création des nœuds Item
LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_1.csv' AS row
MERGE (item:Item {id: row.item_id});

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_2.csv' AS row
MERGE (item:Item {id: row.item_id});

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_3.csv' AS row
MERGE (item:Item {id: row.item_id});

LOAD CSV WITH HEADERS FROM 'file:///cleaned_Behance_appreciate_part_4.csv' AS row
MERGE (item:Item {id: row.item_id});
