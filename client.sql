CREATE TABLE client(
    id_personne NUMBER,
    id_client NUMBER UNIQUE,
    type_id_client VARCHAR2(10),
    id_classe NUMBER
);

ALTER TABLE client ADD CONSTRAINT pk_client
PRIMARY KEY (id_personne);

--Ajouter le FK de personne
--Ajouter le FK de classe