-- Ajout des contraintes (clé étrangère)

/*Ces contraintes doivent être executées après 
    la création de toutes les tables nécessaires
    càd les tables ayant aucune dépendance*/

/*Dans ce cas, le script suivat doit être exécuté
    ssi la table 'Personne' existe*/
    
--Table Responsable_CRM
ALTER TABLE Responsable_CRM
ADD CONSTRAINT fk_responsable_personne FOREIGN KEY (id_personne)
REFERENCES Personne(id_personne) ON DELETE CASCADE;

--Table Commercant
ALTER TABLE Commercant
ADD CONSTRAINT fk_commercant_personne FOREIGN KEY (id_personne)
REFERENCES Personne(id_personne) ON DELETE CASCADE;

--Table Commercant
ALTER TABLE Commercant
ADD CONSTRAINT fk_commercant_responsable FOREIGN KEY (id_responsable_crm)
REFERENCES Responsable_CRM(id_responsable_crm);

--Table Prospect
ALTER TABLE Prospect
ADD CONSTRAINT fk_prospect_personne FOREIGN KEY (id_personne)
REFERENCES Personne(id_personne) ON DELETE CASCADE;

ALTER TABLE Prospect
ADD CONSTRAINT fk_prospect_commercant FOREIGN KEY (id_commercant)
REFERENCES Commercant(id_commercant);

--Table Ressources_Humaines
ALTER TABLE Ressources_Humaines
ADD CONSTRAINT fk_rh_personne FOREIGN KEY (id_personne)
REFERENCES Personne(id_personne) ON DELETE CASCADE;

