CREATE DATABASE BancaDeSange
CREATE TABLE Login
(
	id_login int PRIMARY KEY,
	username varchar(30),
	password varchar(20),
	date_created date
)

CREATE TABLE Admin
(
	id_admin int PRIMARY KEY,
	id_login int FOREIGN KEY REFERENCES Login(id_login)
)

CREATE TABLE Medic
(
	id_medic int PRIMARY KEY,
	nume_medic varchar(40),
	specializare varchar(50),
	spital varchar(40),
	id_login int FOREIGN KEY REFERENCES Login(id_login),
	id_admin int FOREIGN KEY REFERENCES Admin(id_admin)
)

CREATE TABLE Asistent
(
	id_asistent int PRIMARY KEY,
	nume_asistent varchar(40),
	id_login int FOREIGN KEY REFERENCES Login(id_login),
	id_medic int FOREIGN KEY REFERENCES Medic(id_medic)
)

CREATE TABLE Analize
(
	id_analize int PRIMARY KEY,
	grupa_sange varchar(8),
	cantitate_sange int
)

CREATE TABLE Centru_de_donare
(
	id_centru int PRIMARY KEY,
	adresa varchar(60),
	id_medic int FOREIGN KEY REFERENCES Medic(id_medic)
)

CREATE TABLE Donator
(
	id_donator int PRIMARY KEY,
	nume_donator varchar(40),
	greutate int,
	telefon varchar(15),
	varsta int,
	puls int,
	interventii_chirurgicale varchar(100),
	boli varchar(80),
	id_analize int FOREIGN KEY REFERENCES Analize(id_analize),
	id_login int FOREIGN KEY REFERENCES Login(id_login),
	id_asistent int FOREIGN KEY REFERENCES Asistent(id_asistent),
	id_centru int FOREIGN KEY REFERENCES Centru_de_donare(id_centru),
)

CREATE TABLE Pacient
(
	id_pacient int PRIMARY KEY,
	nume varchar(20),
	boala varchar(50),
	date_personale varchar(60),
	nevoie_sange varchar(20),
	grupa varchar(8)
)

ALTER TABLE Pacient 
ADD id_medic int
ALTER TABLE Pacient 
ADD CONSTRAINT id_medic FOREIGN KEY (id_medic) REFERENCES Medic(id_medic)

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);