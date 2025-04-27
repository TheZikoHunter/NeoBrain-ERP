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