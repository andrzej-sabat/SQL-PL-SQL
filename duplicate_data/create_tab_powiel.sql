spool log/create_tab_powiel.log;

declare
  TMP_PROD_ID NUMBER;
  sql_stmt    VARCHAR2(200);
begin

  sql_stmt := 'create sequence TMP_PROD_ID_SEQ start with 1 NOMAXVALUE INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'create sequence TMP_NR_REF_SEQ start with 1 NOMAXVALUE INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;
/*
  execute immediate 'SELECT last_number FROM DBA_SEQUENCES WHERE and sequence_owner in = ''WH'' and sequence_name = ''UMOWA_ID_SEQ''' into TMP_PROD_ID;
  dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'create sequence TMP_NR_UM_SEQ start with '||TMP_PROD_ID||' INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;

  execute immediate 'SELECT max(d.DOKUMENT_PROD_ID)+1 FROM DOKUMENTY d' into TMP_PROD_ID;
  dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'create sequence TMP_DOK_PROD_ID_SEQ start with '||TMP_PROD_ID||' NOMAXVALUE INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;

--IF1

  execute immediate 'SELECT LAST_NUMBER FROM user_sequences WHERE sequence_name = ''KLIENT_ID_SEQ''' into TMP_PROD_ID;
  dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'create sequence IF1_KLIENT_TMP_ID_SEQ start with '||TMP_PROD_ID||' NOMAXVALUE INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'create sequence IF1_KLIENT_TMP_KOD_SEQ start with 1 NOMAXVALUE INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;

  execute immediate 'SELECT LAST_NUMBER FROM user_sequences WHERE sequence_name = ''UMOWA_ID_SEQ''' into TMP_PROD_ID;
  dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'create sequence IF1_UMOWY_TMP_ID_SEQ start with '||TMP_PROD_ID||' NOMAXVALUE INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;

--CC

  execute immediate 'SELECT LAST_NUMBER FROM user_sequences WHERE sequence_name = ''CC_KARTA_ID_SEQ''' into TMP_PROD_ID;
  dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'create sequence TMP_CC_NR_KARTY_SEQ start with '||TMP_PROD_ID||' NOMAXVALUE INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;
  */
end;
/

 /* CREATE TABLE KLIENCI_ID_TMP (kl_id number, kl_id_new number);
  CREATE TABLE ANALITYKA_ID_TMP (an_id number, an_id_new number);
  CREATE TABLE WNIOSKI_ID_TMP (wn_id number, wn_id_new number);
  CREATE TABLE UMOWY_ID_TMP (um_id number, um_id_new number, kl_id number);
  CREATE TABLE ANEKSY_ID_TMP (an_id number, an_id_new number);
  CREATE TABLE UMOWY_HARMONOGRAMY_ID_TMP (ha_id number, ha_id_new number);
  CREATE TABLE UMOWY_HARM_POZYCJE_ID_TMP (ha_id number, ha_id_new number);
  CREATE TABLE DOKUMENTY_ID_TMP (d_prod_id number, d_prod_id_new number);
  CREATE TABLE IF1_KLIENCI_ID_TMP (k_id number, k_id_new number);
  create table IF1_RACHUNKI_NOSTRO_ID_TMP (n_id number, n_id_new number);
  CREATE TABLE IF1_UMOWY_ID_TMP (u_id number, u_id_new number);
  CREATE TABLE CC_KARTY_PLATNICZE_ID_TMP (c_id number, c_id_new number);

  CREATE TABLE KLIENCI_TMP AS
  SELECT * FROM KLIENCI where 1=0;

  CREATE TABLE ANALITYKA_TMP AS
  SELECT * FROM ANALITYKA where 1=0;

  CREATE TABLE WNIOSKI_TMP AS
  SELECT * FROM WNIOSKI where 1=0; 

  CREATE TABLE wh.UMOWY_TMP AS
  SELECT * FROM wh.UMOWY where 1=0;

  CREATE TABLE ANEKSY_TMP AS
  SELECT * FROM ANEKSY where 1=0;
  
  CREATE TABLE UMOWY_HARMONOGRAMY_TMP AS
  SELECT * FROM UMOWY_HARMONOGRAMY where 1=0;

  CREATE TABLE UMOWY_HARM_POZYCJE_TMP AS
  SELECT * FROM UMOWY_HARM_POZYCJE where 1=0;

  CREATE TABLE DOKUMENTY_TMP AS
  SELECT * FROM DOKUMENTY where 1=0;
  
  CREATE TABLE DEKRETY_TMP AS
  SELECT * FROM DEKRETY where 1=0;
  
  CREATE TABLE UMOWY_REJESTRY_TMP AS
  SELECT * FROM UMOWY_REJESTRY WHERE 1=0;

  CREATE TABLE IF1_KLIENCI_TMP AS
  SELECT * FROM IF1_KLIENCI where 1=0;

  CREATE TABLE IF1_RACHUNKI_NOSTRO_TMP AS
  SELECT * FROM IF1_RACHUNKI_NOSTRO where 1=0;
  
  CREATE TABLE IF1_UMOWY_TMP AS
  SELECT * FROM IF1_UMOWY where 1=0;
  
  CREATE TABLE CC_KARTY_PLATNICZE_TMP AS
  SELECT * FROM CC_KARTY_PLATNICZE where 1=0;

  insert into KLIENCI_ID_TMP (kl_id, kl_id_new)
  (select klient_id, klient_id_seq.NEXTVAL from WH_ODS.KLIENCI);

  commit;

  insert into UMOWY_ID_TMP (um_id, um_id_new, kl_id)
  (select umowa_id, umowa_id_seq.nextval, kl_id from WH_ODS.UMOWY, WH_ODS.KLIENCI_ID_TMP
                                                where umowy.klient_id = klienci_id_tmp.kl_id);

  insert into ANALITYKA_ID_TMP (an_id, an_id_new)
  (select analityka_id, analityka_id_seq.nextval from WH_ODS.ANALITYKA);

  insert into WNIOSKI_ID_TMP (wn_id, wn_id_new)
  (select wniosek_id, wniosek_id_seq.nextval from WH_ODS.WNIOSKI);

  insert into ANEKSY_ID_TMP (an_id, an_id_new)
  (select aneks_id, aneks_id_seq.nextval from WH_ODS.ANEKSY);

  insert into UMOWY_HARMONOGRAMY_ID_TMP (ha_id, ha_id_new)
  (select harm_id, harm_id_seq.nextval from UMOWY_HARMONOGRAMY);

  insert into DOKUMENTY_ID_TMP (d_prod_id, d_prod_id_new)
  (select DOKUMENT_PROD_ID, TMP_DOK_PROD_ID_SEQ.NEXTVAL from DOKUMENTY);
  
  insert into IF1_RACHUNKI_NOSTRO_ID_TMP (n_id, n_id_new)
  (select nostro_id, IF1_RACHUNKI_NOSTRO_ID_SEQ.NEXTVAL from IF1_RACHUNKI_NOSTRO);
  
  insert into CC_KARTY_PLATNICZE_ID_TMP (c_id, c_id_new)
  (select cc_karta_id, CC_KARTA_ID_SEQ.NEXTVAL from CC_KARTY_PLATNICZE);  */

  commit;

spool off;
