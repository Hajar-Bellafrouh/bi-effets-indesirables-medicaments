# Mini-projet BI – Analyse de l'impact et des effets indésirables d'un médicament

ENSA Khouribga – CI IID (2ᵉ année), module Systèmes d'aide à la décision.
Chaîne décisionnelle Microsoft : **SQL Server → SSIS (ETL) → SSAS (cube OLAP) → Power BI**. Énoncé : [`docs/enonce_mini_projet_bi.pdf`](docs/enonce_mini_projet_bi.pdf).

## Architecture

```
OLTP (MedicamentDB)  ──SSIS──▶  Entrepôt (DW_Medicaments)  ──SSAS──▶  Cube "Cube Medicaments"  ──▶  Power BI
 4 tables sources               3 dimensions + 1 table de faits         3 dimensions, 3 mesures        5 visuels
```

## Structure

```
projet-bi-medicaments/
├── docs/enonce_mini_projet_bi.pdf
├── sql/
│   ├── 01_oltp_MedicamentDB.sql      # base source + données de test
│   └── 02_dw_DW_Medicaments.sql      # entrepôt (dimensions + faits)
├── ssis/ETL_Medi_Effets/             # projet SSIS (ouvrir ETL_Medi_Effets.slnx)
├── ssas/cube_mini_tp/                # projet SSAS multidimensionnel (ouvrir cube_mini_tp.slnx)
└── powerbi/mini_tp.pbix              # tableau de bord
```

## Contenu réalisé

- **OLTP** : tables `Medicaments`, `Patients`, `Effets_Indesirables`, `Efficacite`.
- **DW** : `Dim_Medicaments`, `Dim_Patients` (avec `Categorie_Age`), `Dim_Temps`, `Faits_EffetsIndesirables`.
- **SSIS** : `Package 1.dtsx` (version la plus complète, charge dimensions + faits) ; `Package.dtsx` est une version antérieure sans la table de faits.
- **SSAS** : dimensions avec les hiérarchies demandées (Année > Mois > Jour ; Classe thérapeutique > Médicament > Dosage ; Région > Sexe > Catégorie d'âge), mesures `Nombre Effets`, `Gravité Aggrégée` et un compteur.
- **Power BI** : connexion directe au cube ; histogramme empilé par classe thérapeutique, carte par région, courbe temporelle, 2 cartes (nombre d'effets, gravité agrégée).

## Ordre d'exécution

1. Exécuter `sql/01_oltp_MedicamentDB.sql` puis `sql/02_dw_DW_Medicaments.sql` (SSMS).
2. Ouvrir `ssis/ETL_Medi_Effets/ETL_Medi_Effets.slnx` dans Visual Studio (SSDT), adapter les connexions, exécuter `Package 1.dtsx`.
3. Ouvrir `ssas/cube_mini_tp/cube_mini_tp.slnx`, adapter la source de données, déployer et traiter le cube.
4. Ouvrir `powerbi/mini_tp.pbix` (connexion SSAS en direct : adapter le serveur).

## Points d'attention (état du projet)

| Livrable de l'énoncé | État |
|---|---|
| Modèle OLTP et DW | ✅ présent |
| Données : au moins 200 enregistrements par table | ⚠️ 30 enregistrements par table dans le script |
| Package SSIS documenté (capture du workflow) | ⚠️ package présent, aucune capture d'écran |
| Cube SSAS | ✅ présent (voir remarques ci-dessous) |
| Tableau de bord Power BI | ⚠️ partiel : manquent les KPI « taux d'incidence des effets graves par médicament » et « taux de réussite vs effets secondaires » |
| Publication / alertes Power BI | ❓ non vérifiable dans les fichiers |

Remarques techniques :

- **Noms de bases incohérents** : le script SQL crée `MedicamentDB` et `DW_Medicaments`, le cube lit `DW_Medicaments`, mais les connexions SSIS pointent vers `Medi_DB` et `Medi_EffetsDW` (noms de l'énoncé). Aligner les noms avant d'exécuter l'ETL.
- **Table `Efficacite` non chargée** : aucun package SSIS ne la transfère vers le DW, et le DW n'a ni dimension ni fait d'efficacité. Le KPI « taux de réussite » ne peut donc pas être calculé dans le cube.
- **Mesure `Gravité Aggrégée`** : l'énoncé demande une moyenne ; la mesure du cube utilise l'agrégation par défaut (somme).
- Les chaînes de connexion contiennent le nom de la machine d'origine (`DESKTOP-29VQCT4\SQLDEVELOPER`) et doivent être adaptées.
- Les dossiers `.vs/`, `bin/`, `obj/` et les fichiers `.user` (générés par Visual Studio) sont exclus par le `.gitignore`.
