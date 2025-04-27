/*Ce script définit les triggers d'auto-remplissage des ID:
    -Lors de l'insertion si l'id est précisé : la requête est exécuté sans problème
    -Lors de l'insertion si l'id n'est pas précisé : un id va être généré */


-- Séquences
CREATE SEQUENCE seq_personne START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_responsable_crm START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_commercant START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_prospect START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_rh START WITH 1 INCREMENT BY 1;

-- Triggers d'auto-remplissage des ID

CREATE OR REPLACE TRIGGER trg_personne_id -- NB: la table 'Personne' doit être crée
BEFORE INSERT ON Personne
FOR EACH ROW
BEGIN
    IF :NEW.id_personne IS NULL THEN
        SELECT seq_personne.NEXTVAL INTO :NEW.id_personne FROM dual;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_responsable_crm_id
BEFORE INSERT ON Responsable_CRM
FOR EACH ROW
BEGIN
    IF :NEW.id_responsable_crm IS NULL THEN
        SELECT seq_responsable_crm.NEXTVAL INTO :NEW.id_responsable_crm FROM dual;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_commercant_id
BEFORE INSERT ON Commercant
FOR EACH ROW
BEGIN
    IF :NEW.id_commercant IS NULL THEN
        SELECT seq_commercant.NEXTVAL INTO :NEW.id_commercant FROM dual;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_prospect_id
BEFORE INSERT ON Prospect
FOR EACH ROW
BEGIN
    IF :NEW.id_prospect IS NULL THEN
        SELECT seq_prospect.NEXTVAL INTO :NEW.id_prospect FROM dual;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_rh_id
BEFORE INSERT ON Ressources_Humaines
FOR EACH ROW
BEGIN
    IF :NEW.id_rh IS NULL THEN
        SELECT seq_rh.NEXTVAL INTO :NEW.id_rh FROM dual;
    END IF;
END;
/
