-- la table Personne
CREATE TABLE Personne (
    id_personne NUMBER PRIMARY KEY,
    nom_personne VARCHAR2(100),
    prenom_personne VARCHAR2(100),
    date_naissance DATE,
    email VARCHAR2(100),
    telephone VARCHAR2(20),
    civilite VARCHAR2(10),
    nationalite VARCHAR2(50)
);

-- la table Responsable_CRM
CREATE TABLE Responsable_CRM (
    id_personne NUMBER PRIMARY KEY,
    id_responsable_crm NUMBER UNIQUE
);

--la table Commercant
CREATE TABLE Commercant (
    id_personne NUMBER PRIMARY KEY,
    id_commercant NUMBER UNIQUE,
    id_responsable_crm NUMBER
);

--la table Prospect
CREATE TABLE Prospect (
    id_personne NUMBER PRIMARY KEY,
    id_prospect NUMBER UNIQUE,
    information VARCHAR2(500),
    status_prospect VARCHAR2(100),
    id_commercant NUMBER
);

--la table Ressources_Humaines
CREATE TABLE Ressources_Humaines (
    id_personne NUMBER PRIMARY KEY,
    id_rh NUMBER UNIQUE
);
