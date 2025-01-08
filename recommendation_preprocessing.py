
import pandas as pd

# Chemins des fichiers bruts
appreciates_path = "Behance_appreciate_1M"
owners_path = "Behance_Item_to_Owners"

# Chemins des fichiers de sortie
appreciates_cleaned_path = "cleaned_Behance_appreciate_1M.csv"
owners_cleaned_path = "cleaned_Behance_Item_to_Owners.csv"

# Étape 1 : Nettoyage des fichiers
print("Chargement et nettoyage des fichiers...")

# Charger appreciates
appreciates_df = pd.read_csv(appreciates_path, sep=" ", names=["user_id", "item_id", "timestamp"])
appreciates_df.dropna(inplace=True)
appreciates_df['timestamp'] = pd.to_datetime(appreciates_df['timestamp'], unit='s')

# Charger owners
owners_df = pd.read_csv(owners_path, sep=" ", names=["item_id", "owner_id"])
owners_df.dropna(inplace=True)

# Sauvegarder les fichiers nettoyés
appreciates_df.to_csv(appreciates_cleaned_path, index=False)
owners_df.to_csv(owners_cleaned_path, index=False)

print(f"Fichier nettoyé et sauvegardé : {appreciates_cleaned_path}")
print(f"Fichier nettoyé et sauvegardé : {owners_cleaned_path}")

# Étape 2 : Découpage des fichiers
print("\nDécoupage des fichiers en parties...")

# Découper appreciates en 4 parties
num_parts_appreciates = 4
rows_per_part_appreciates = len(appreciates_df) // num_parts_appreciates

for i in range(num_parts_appreciates):
    start_idx = i * rows_per_part_appreciates
    end_idx = (i + 1) * rows_per_part_appreciates if i < num_parts_appreciates - 1 else len(appreciates_df)
    part = appreciates_df.iloc[start_idx:end_idx]
    part.to_csv(f"cleaned_Behance_appreciate_part_{i+1}.csv", index=False)
    print(f"Partie {i+1} de appreciates enregistrée : {len(part)} lignes")

# Découper owners en 2 parties
split_idx_owners = len(owners_df) // 2
owners_df.iloc[:split_idx_owners].to_csv("cleaned_Behance_Item_to_Owners_part_1.csv", index=False)
owners_df.iloc[split_idx_owners:].to_csv("cleaned_Behance_Item_to_Owners_part_2.csv", index=False)

print("Découpage du fichier owners terminé.")
print("Parties créées :")
print("- cleaned_Behance_Item_to_Owners_part_1.csv")
print("- cleaned_Behance_Item_to_Owners_part_2.csv")

print("\nProcessus terminé. Les fichiers sont prêts pour Neo4j.")
