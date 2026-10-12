CREATE DATABASE MedicamentDB;
GO
USE MedicamentDB;
GO

-- Table des médicaments 
CREATE TABLE Medicaments ( 
ID_Medicament INT PRIMARY KEY, 
Nom_Medicament VARCHAR(100), 
Classe_Therapeutique VARCHAR(100), 
Dosage VARCHAR(50) 
); -- Table des patients 
CREATE TABLE Patients ( 
ID_Patient INT PRIMARY KEY, 
Sexe CHAR(1), 
Age INT, 
Region VARCHAR(100), 
Antecedents VARCHAR(255) 
); -- Table des effets indésirables 
CREATE TABLE Effets_Indesirables ( 
ID_Effet INT PRIMARY KEY, 
ID_Patient INT, 
ID_Medicament INT, 
Description_Effet VARCHAR(255), 
Gravite VARCHAR(50), 
Date_Rapport DATE, 
FOREIGN KEY (ID_Patient) REFERENCES Patients(ID_Patient), 
FOREIGN KEY (ID_Medicament) REFERENCES Medicaments(ID_Medicament) 
); -- Table d'efficacité 
CREATE TABLE Efficacite ( 
ID_Efficacite INT PRIMARY KEY, 
ID_Medicament INT, 
Amelioration_Symptomes VARCHAR(255), 
Taux_Reussite DECIMAL(5,2), 
Date_Etude DATE, 
FOREIGN KEY (ID_Medicament) REFERENCES Medicaments(ID_Medicament) 
); 




INSERT INTO Medicaments VALUES
(1,'Paracetamol','Antalgique','500mg'),
(2,'Ibuprofene','Anti-inflammatoire','400mg'),
(3,'Aspirine','Antalgique','500mg'),
(4,'Amoxicilline','Antibiotique','1g'),
(5,'Azithromycine','Antibiotique','500mg'),
(6,'Metformine','Antidiabetique','850mg'),
(7,'Insuline','Antidiabetique','10UI'),
(8,'Atorvastatine','Hypolipemiant','20mg'),
(9,'Simvastatine','Hypolipemiant','40mg'),
(10,'Omeprazole','Gastro','20mg'),
(11,'Pantoprazole','Gastro','40mg'),
(12,'Losartan','Antihypertenseur','50mg'),
(13,'Amlodipine','Antihypertenseur','5mg'),
(14,'Enalapril','Antihypertenseur','10mg'),
(15,'Salbutamol','Bronchodilatateur','100mcg'),
(16,'Budesonide','Corticoide','200mcg'),
(17,'Prednisone','Corticoide','20mg'),
(18,'Levothyrox','Hormonal','50mcg'),
(19,'Vitamine C','Supplement','1000mg'),
(20,'Vitamine D','Supplement','1000UI'),
(21,'Morphine','Antalgique','10mg'),
(22,'Tramadol','Antalgique','50mg'),
(23,'Ciprofloxacine','Antibiotique','500mg'),
(24,'Doxycycline','Antibiotique','100mg'),
(25,'Fluoxetine','Antidepresseur','20mg'),
(26,'Sertraline','Antidepresseur','50mg'),
(27,'Diazepam','Anxiolytique','10mg'),
(28,'Lorazepam','Anxiolytique','2mg'),
(29,'Haloperidol','Antipsychotique','5mg'),
(30,'Risperidone','Antipsychotique','2mg');

INSERT INTO Patients VALUES
(1,'F',25,'Casablanca','Asthme'),
(2,'M',45,'Rabat','Diabete'),
(3,'F',60,'Fes','Hypertension'),
(4,'M',35,'Marrakech','Aucun'),
(5,'F',50,'Agadir','Cardiaque'),
(6,'M',28,'Tanger','Aucun'),
(7,'F',70,'Oujda','Diabete'),
(8,'M',55,'Kenitra','Asthme'),
(9,'F',40,'Settat','Hypertension'),
(10,'M',65,'El Jadida','Cardiaque'),
(11,'F',30,'Safi','Aucun'),
(12,'M',22,'Meknes','Aucun'),
(13,'F',48,'Nador','Asthme'),
(14,'M',52,'Beni Mellal','Diabete'),
(15,'F',33,'Taza','Aucun'),
(16,'M',75,'Khouribga','Hypertension'),
(17,'F',58,'Laayoune','Cardiaque'),
(18,'M',43,'Dakhla','Asthme'),
(19,'F',27,'Essaouira','Aucun'),
(20,'M',68,'Ouarzazate','Diabete'),
(21,'F',41,'Chefchaouen','Hypertension'),
(22,'M',36,'Taroudant','Aucun'),
(23,'F',54,'Guelmim','Cardiaque'),
(24,'M',29,'Sidi Kacem','Aucun'),
(25,'F',63,'Azrou','Diabete'),
(26,'M',47,'Ifrane','Hypertension'),
(27,'F',38,'Midelt','Asthme'),
(28,'M',59,'Errachidia','Cardiaque'),
(29,'F',72,'Tiznit','Diabete'),
(30,'M',34,'Youssoufia','Aucun');

INSERT INTO Effets_Indesirables VALUES
(1,1,1,'Nausee','Leger','2024-01-10'),
(2,2,2,'Douleur estomac','Modere','2024-01-12'),
(3,3,3,'Vertige','Leger','2024-01-15'),
(4,4,4,'Allergie','Grave','2024-01-18'),
(5,5,5,'Fatigue','Modere','2024-01-20'),
(6,6,6,'Hypoglycemie','Grave','2024-01-22'),
(7,7,7,'Palpitations','Grave','2024-01-25'),
(8,8,8,'Maux de tete','Leger','2024-01-27'),
(9,9,9,'Nausee','Modere','2024-01-28'),
(10,10,10,'Brulures','Leger','2024-02-01'),
(11,11,11,'Somnolence','Leger','2024-02-03'),
(12,12,12,'Hypotension','Modere','2024-02-05'),
(13,13,13,'Oedeme','Modere','2024-02-07'),
(14,14,14,'Toux','Leger','2024-02-10'),
(15,15,15,'Tremblement','Leger','2024-02-12'),
(16,16,16,'Irritation','Modere','2024-02-15'),
(17,17,17,'Prise de poids','Modere','2024-02-17'),
(18,18,18,'Palpitations','Leger','2024-02-20'),
(19,19,19,'Diarrhee','Leger','2024-02-22'),
(20,20,20,'Fatigue','Modere','2024-02-25'),
(21,21,21,'Somnolence','Grave','2024-02-27'),
(22,22,22,'Vertige','Modere','2024-03-01'),
(23,23,23,'Photosensibilite','Leger','2024-03-03'),
(24,24,24,'Nausee','Leger','2024-03-05'),
(25,25,25,'Insomnie','Modere','2024-03-07'),
(26,26,26,'Anxiete','Modere','2024-03-09'),
(27,27,27,'Dependance','Grave','2024-03-11'),
(28,28,28,'Amnesie','Modere','2024-03-13'),
(29,29,29,'Rigidite','Grave','2024-03-15'),
(30,30,30,'Prise de poids','Modere','2024-03-18');

INSERT INTO Efficacite VALUES
(1,1,'Douleur reduite',85.50,'2024-01-05'),
(2,2,'Inflammation reduite',78.20,'2024-01-06'),
(3,3,'Fievre reduite',80.00,'2024-01-07'),
(4,4,'Infection guerie',88.70,'2024-01-08'),
(5,5,'Infection amelioree',82.10,'2024-01-09'),
(6,6,'Glycemie stable',90.30,'2024-01-10'),
(7,7,'Glycemie controlee',92.40,'2024-01-11'),
(8,8,'Cholesterol reduit',87.60,'2024-01-12'),
(9,9,'Lipides controles',85.00,'2024-01-13'),
(10,10,'Acidite reduite',89.20,'2024-01-14'),
(11,11,'Reflux controle',88.90,'2024-01-15'),
(12,12,'Tension stable',86.70,'2024-01-16'),
(13,13,'Pression reduite',84.60,'2024-01-17'),
(14,14,'Tension controlee',83.40,'2024-01-18'),
(15,15,'Respiration amelioree',91.10,'2024-01-19'),
(16,16,'Inflammation reduite',82.80,'2024-01-20'),
(17,17,'Symptomes controles',79.50,'2024-01-21'),
(18,18,'Hormones equilibrees',88.00,'2024-01-22'),
(19,19,'Immunite renforcee',76.40,'2024-01-23'),
(20,20,'Calcium stable',81.20,'2024-01-24'),
(21,21,'Douleur severe reduite',70.10,'2024-01-25'),
(22,22,'Douleur chronique reduite',73.60,'2024-01-26'),
(23,23,'Infection traitee',86.90,'2024-01-27'),
(24,24,'Infection reduite',84.30,'2024-01-28'),
(25,25,'Humeur amelioree',77.80,'2024-01-29'),
(26,26,'Stress reduit',79.90,'2024-01-30'),
(27,27,'Anxiete controlee',75.40,'2024-02-01'),
(28,28,'Sommeil ameliore',80.60,'2024-02-02'),
(29,29,'Symptomes psychotiques reduits',72.30,'2024-02-03'),
(30,30,'Stabilite mentale',74.80,'2024-02-04');

SELECT COUNT(*) FROM Medicaments;
SELECT COUNT(*) FROM Patients;
SELECT COUNT(*) FROM Effets_Indesirables;
SELECT COUNT(*) FROM Efficacite;
