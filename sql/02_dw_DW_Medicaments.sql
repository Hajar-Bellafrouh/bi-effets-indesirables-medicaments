CREATE DATABASE DW_Medicaments;
GO
USE DW_Medicaments;
GO

--Tables de dimensions : 
CREATE TABLE Dim_Medicaments ( 
ID_Medicament INT PRIMARY KEY, 
Nom_Medicament VARCHAR(100), 
Classe_Therapeutique VARCHAR(100), 
Dosage VARCHAR(50) 
); 
CREATE TABLE Dim_Patients ( 
ID_Patient INT PRIMARY KEY, 
Sexe CHAR(1), 
Age INT, 
Region VARCHAR(100), 
Antecedents VARCHAR(255) ,
Categorie_Age VARCHAR(50)
); 
CREATE TABLE Dim_Temps ( 
ID_Temps INT PRIMARY KEY, 
Annee INT, 
Mois INT, 
Jour DATE 
); 

--Table des faits : 
CREATE TABLE Faits_EffetsIndesirables ( 
ID_Fait INT  IDENTITY(1,1)  PRIMARY KEY, 
ID_Medicament INT, 
ID_Temps INT, 
ID_Patient INT, 
Nombre_Effets INT, 
Gravite_Aggregée DECIMAL(5,2), 
FOREIGN KEY (ID_Medicament) REFERENCES Dim_Medicaments(ID_Medicament), 
FOREIGN KEY (ID_Temps) REFERENCES Dim_Temps(ID_Temps), 
FOREIGN KEY (ID_Patient) REFERENCES Dim_Patients(ID_Patient)
);
