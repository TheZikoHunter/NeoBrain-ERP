-- Trigger du contact du personne (Au moins un contact doit etre fourni email ou téléphone)
CREATE OR REPLACE TRIGGER trg_personne_contact
BEFORE INSERT OR UPDATE ON Personne
FOR EACH ROW
BEGIN
    IF (:NEW.email IS NULL AND :NEW.telephone IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Veuillez fournir au moins un email ou un téléphone.');
    END IF;
END;
/

-- Trigger de Vérification de l'âge (>=19)
CREATE OR REPLACE TRIGGER trg_personne_age
BEFORE INSERT OR UPDATE ON Personne
FOR EACH ROW
DECLARE
    age NUMBER;
BEGIN
    -- Calcul de l'âge
    age := TRUNC(MONTHS_BETWEEN(SYSDATE, :NEW.date_naissance) / 12);
    
    IF age < 19 THEN
        RAISE_APPLICATION_ERROR(-20002, 'L''âge doit être supérieur ou égal à 19 ans.');
    END IF;
END;
/




