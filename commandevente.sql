CREATE TABLE commandevente(
    id_commande_vente NUMBER UNIQUE,
    date_vente DATE DEFAULT SYSDATE,
    prix_total NUMBER DEFAULT 0,
    etat_echec NUMBER DEFAULT 1,
    id_client NUMBER,
    id_responsable_ventes NUMBER
);

ALTER TABLE commandevente ADD CONSTRAINT fk_commandevente_client
FOREIGN KEY (id_client) REFERENCES client(id_client);

CREATE OR REPLACE TRIGGER trg_insert_transaction_after_commandevente
AFTER INSERT ON commandevente
FOR EACH ROW
BEGIN
    INSERT INTO transaction (
        id_transaction,
        montant_transaction,
        type_transaction,
        id_commande_vente
    )
    VALUES (
        seq_transaction_id.NEXTVAL, -- auto id for transaction (we need to create sequence)
        :NEW.prix_total,
        'income',
        :NEW.id_commande_vente
    );
END;