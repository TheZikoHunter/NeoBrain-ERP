CREATE TABLE lignecommandevente(
    id_ligne_commande_vente NUMBER UNIQUE,
    id_commande_vente NUMBER,
    qte_vente NUMBER DEFAULT 0,
    etat_retour NUMBER DEFAULT 0,
    etat_echec NUMBER DEFAULT 0,
    id_produit NUMBER
);

ALTER TABLE lignecommandevente ADD CONSTRAINT pk_lignecommandevente
PRIMARY KEY (id_commande_vente, id_ligne_commande_vente);

ALTER TABLE lignecommandevente ADD CONSTRAINT fk_lignecommandevente_produit
FOREIGN KEY (id_produit) REFERENCES produit(id_produit);

ALTER TABLE lignecommandevente ADD CONSTRAINT fk_lignecommandevente_commandevente
FOREIGN KEY (id_commande_vente) REFERENCES commandevente(id_commande_vente)
ON DELETE CASCADE;