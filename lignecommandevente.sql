CREATE TABLE lignecommandevente(
    id_ligne_commande_vente NUMBER UNIQUE,
    id_commande_vente NUMBER,
    qte_vente NUMBER DEFAULT 0,
    etat_retour NUMBER DEFAULT 0,
    etat_echec NUMBER DEFAULT 0,
    id_produit VARCHAR2(100)
);

ALTER TABLE lignecommandevente ADD CONSTRAINT pk_lignecommandevente
PRIMARY KEY (id_commande_vente, id_ligne_commande_vente);

ALTER TABLE lignecommandevente ADD CONSTRAINT fk_lignecommandevente_produit
FOREIGN KEY (id_produit) REFERENCES produit(id_global_produit);

ALTER TABLE lignecommandevente ADD CONSTRAINT fk_lignecommandevente_commandevente
FOREIGN KEY (id_commande_vente) REFERENCES commandevente(id_commande_vente)
ON DELETE CASCADE;

CREATE OR REPLACE TRIGGER trg_update_stock_after_lignecommandevente
AFTER INSERT ON lignecommandevente
FOR EACH ROW
BEGIN
    UPDATE produit
    SET quantite_stock = quantite_stock - :NEW.qte_vente
    WHERE id_global_produit = :NEW.id_produit;
END;