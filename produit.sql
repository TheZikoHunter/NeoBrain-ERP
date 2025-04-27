CREATE TABLE produit(
    id_produit NUMBER UNIQUE,
    nom_produit VARCHAR2(30) NOT NULL,
    description VARCHAR2(100),
    prix NUMBER NOT NULL,
    quantite_stock NUMBER DEFAULT 0,
    date_ajout DATE DEFAULT SYSDATE,
    disponible NUMBER DEFAULT 0,
    id_categorie NUMBER NOT NULL,
    id_entreprise NUMBER NOT NULL
);
ALTER TABLE produit ADD CONSTRAINT pk_produit
PRIMARY KEY (id_produit, id_categorie, id_entreprise);

ALTER TABLE produit ADD CONSTRAINT fk_produit_categorie
FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie);
