CREATE TABLE transaction(
    id_transaction NUMBER UNIQUE,
    montant_transaction NUMBER DEFAULT 0,
    type_transaction VARCHAR2(10),
    id_commande_vente NUMBER NOT NULL
);

ALTER TABLE transaction ADD CONSTRAINT fk_transaction_commandevente
FOREIGN KEY (id_commande_vente) REFERENCES commandevente(id_commande_vente);