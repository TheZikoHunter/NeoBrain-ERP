CREATE TABLE client(
    id_personne NUMBER,
    id_client NUMBER UNIQUE,
    type_id_client VARCHAR2(10),
    id_classe NUMBER
);

--Ajouter le FK de classe