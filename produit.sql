CREATE TABLE produit(
    id_global_produit VARCHAR2(100),
    id_produit NUMBER,
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
PRIMARY KEY (id_global_produit);

ALTER TABLE produit ADD CONSTRAINT fk_produit_categorie
FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie);

ALTER TABLE produit ADD CONSTRAINT fk_produit_entreprise
FOREIGN KEY (id_entreprise) REFERENCES entreprise(id_entreprise);

CREATE SEQUENCE seq_produit_id
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE TRIGGER trg_produit_id
BEFORE INSERT ON produit
FOR EACH ROW
WHEN (NEW.id_produit IS NULL)
BEGIN
    SELECT seq_produit_id.NEXTVAL
    INTO :NEW.id_produit
    FROM dual;
END;

CREATE OR REPLACE TRIGGER trg_update_produit_global_id
BEFORE INSERT OR UPDATE ON produit
FOR EACH ROW
BEGIN
    :NEW.id_global_produit :=
        TO_CHAR(:NEW.id_entreprise) || '-' ||
        TO_CHAR(:NEW.id_categorie) || '-' ||
        TO_CHAR(:NEW.id_produit);
END;
