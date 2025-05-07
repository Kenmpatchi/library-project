CREATE OR REPLACE TRIGGER enforce_uppercase_first_name
BEFORE INSERT OR UPDATE ON adherents
FOR EACH ROW
BEGIN
    :NEW.first_name := UPPER(:NEW.first_name);
END;
/