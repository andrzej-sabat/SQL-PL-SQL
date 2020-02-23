create or replace package COMPARE_GBW is

  
procedure Compare;
end COMPARE_GBW;
/
create or replace package body COMPARE_GBW is

  procedure log_error(icheck_nr in number, tblname IN VARCHAR2, msg IN clob := '') is 
    
   test number;
   
   begin

  insert into GBW11_VS_GBW12_LOGS (check_nr, table_name, msg, log_time, msg2) values (icheck_nr,  tblname, msg, CURRENT_TIMESTAMP, substr(msg, 1, 4000));
   commit;
END;

procedure COMPARE IS
   l_tabname    VARCHAR2(30) := ''; -- nazwa tabeli w starej hurtowni (WHODS)
   l_core_cols  VARCHAR2(2000) := ''; -- 'wirtualny' klucz, aby identyfikowa³ rekord (zwykle *_PROD_ID)
   l_warunki    VARCHAR2(2000) := 'where 1=1'; -- warunek ograniczajy dane 
   l_sHD_schema VARCHAR2(2000) := 'wh_ods'; -- schemat starej hurtowni (WH_ODS)
   l2_schema VARCHAR2(2000) := 'wh_ods'; -- schemat nowej hurtowni (WPI)
   l2_tablename VARCHAR2(30) := ''; -- nazwa tabeli w nowej hurtowni - odpowiednik tabeli l_tabname
   l_pomin VARCHAR2(200) := '';
   
   l_count      INT;
   l_count2      INT;
   l_sql        VARCHAR2(2000);
   l_sql2        VARCHAR2(2000);
   l_sHD_sql    VARCHAR2(32000);
   l_nHD_sql    VARCHAR2(32000);
   l_prep_sql   VARCHAR2(2000);
   l_minus_sql   VARCHAR2(32000);
   l_minus_sql2   VARCHAR2(32000);
   l_minus_sql3   VARCHAR2(32000);
   l_minus_sql4   VARCHAR2(32000);
   l_minus_sql5   VARCHAR2(32000);
   l_minus_sql6   VARCHAR2(32000);
   l_prep_sql2   VARCHAR2(2000);
   l_nHD_schema VARCHAR2(2000) := 'wh_ods'; -- schemat nowej hurtowni (WPI)
   l_col_name   VARCHAR2(32000) := '';
   l_col_name_prod_id   VARCHAR2(32000) := '';
   ilosc_wierszy number;
  i_check_nr number;
  icount number := 0;


BEGIN
  -- tymczaswo kasowanie
--  delete from GBW11_VS_GBW12_LOGS;
--  commit;

  -- numer sprawdzenia.
  select NVL(max(check_nr),0)+1 into i_check_nr from GBW11_VS_GBW12_LOGS;

  -- lista tabel do sprawdzenia
  FOR cur IN (
    SELECT table_name, COUNT(*) OVER() AS tab_count FROM user_tables a
    where table_name not in('C$FUTIL_KEYS','C$FUTIL_RUN', 'GBW_MIS30_100_EXT')
    and (table_name) in (select table_name from user_tables@WH_ODS_GBW12)
    --and not exists (select null from GBW11_VS_GBW12_LOGS b where a.TABLE_NAME = b.table_name and check_nr = 1)
    --and table_name in(/*'PRODUKTY','GRUPY', 'KLIENCI'*/'UMOWY_ZABEZPIECZENIA')
--    and table_name like 'A%'
    order by 1)   
  LOOP 
      icount := icount+1;
      l_tabname := upper(cur.table_name);
    Dbms_Application_Info.set_client_info(icount||'/'||cur.tab_count||' - '||l_tabname);
    log_error(i_check_nr, l_tabname, 'Start tabeli: ' || l_tabname);
  
    l_sql := 'select ' || l_core_cols || ', [col] from [schema]' || '[tablename]' || '[l_dblink]';
    l_sql2 := 'select [col] from [schema]' || '[tablename]' || '[l_dblink]';
    l_sHD_sql := Replace(REPLACE(l_sql, '[schema]', l_sHD_schema || '.'), '[tablename]', cur.table_name);
    l_sHD_sql := REPLACE(l_sHD_sql, '[l_dblink]', '@wh_ods_gbw12');
    l_nHD_sql := Replace(REPLACE(l_sql, '[schema]', l_nHD_schema || '.'),'[tablename]', cur.table_name); 
    l_nHD_sql := REPLACE(l_nHD_sql, '[l_dblink]', '');
    l_prep_sql := 'select count(*) from (' || l_sHD_sql || ' ' || l_warunki || ' minus ' || l_nHD_sql || ' ' ||
                 l_warunki || ')';

    l_prep_sql2 := 'select count(*) from (' || l_nHD_sql || ' ' || l_warunki || ' minus ' || l_sHD_sql || ' ' ||
               l_warunki || ')';
       
    -- sprawdzneie iloœciowe stron
    dbms_output.put_line('SPRAWDZENIE ILOSCI');
    log_error(i_check_nr, l_tabname, 'SPRAWDZENIE ILOSCI');
    -- sHD count
    l_sql := REPLACE(l_sHD_sql || ' ' || l_warunki, l_core_cols || ', [col]', 'count(*)');
    --dbms_output.put_line(l_sql);
    EXECUTE IMMEDIATE l_sql INTO l_count;
    --dbms_output.put_line('l_sql 1');
    dbms_output.put_line('GBW12 count: ' || l_count);
    log_error(i_check_nr, l_tabname, 'GBW12 count: ' || l_count);
    -- nHD count
    l_sql := REPLACE(l_nHD_sql || ' ' || l_warunki, l_core_cols || ', [col]', 'count(*)');
    --dbms_output.put_line(l_sql);
    EXECUTE IMMEDIATE l_sql INTO l_count2;
    --dbms_output.put_line('l_sql 2');
    dbms_output.put_line('GBW11 count: ' || l_count2);
    log_error(i_check_nr, l_tabname, 'GBW11 count: ' || l_count2);

    -- jeœli ró¿nia iloœæ nie ma co sprawdzaæ, trzeba wyrównaæ iloœci.
    IF l_count = l_count2 then
    -- sprawdzenie minusa
    
    dbms_output.put_line('Sprawdzenie minusa');
    log_error(i_check_nr, l_tabname, 'Sprawdzenie minusa');
  
    l_sql2 :=  'select [col] from [schema]' || '[tablename]' || '[l_dblink]';
    l_col_name :='';
    l_col_name_prod_id :='';
    -- wyznaczenie listy kolumn do sparwdzenia z pominieciem PK
    FOR iii IN (
      SELECT * FROM (
      SELECT table_name, column_name FROM user_tab_cols a
      MINUS
      SELECT z.table_name,  y.column_name FROM user_constraints z, user_ind_columns y
      WHERE constraint_type = 'P'
      AND z.constraint_name = y.index_name)
      WHERE  table_name = cur.table_name
      ORDER BY 1, 2)
    LOOP
      l_col_name := l_col_name ||','||iii.column_name;
    
      IF iii.column_name LIKE '%PROD_ID%' THEN
        -- prod id
        l_col_name_prod_id := l_col_name_prod_id ||','|| iii.column_name;
        --dbms_output.put_line('prod_kolumny-----------'|| l_col_name_prod_id);
      end if;
    
    
    
    end loop;

    -- wyznaczenie klucza wi¹zania (zwykle UK - *_PROD_ID)
    for iii in (SELECT z.table_name,  y.column_name FROM user_constraints z, user_ind_columns y
      WHERE /*constraint_type = 'U'
      AND*/ z.constraint_name = y.index_name
      and z.table_name = cur.table_name
      and instr(upper(column_name), 'PROD_ID')>0) loop

      l_core_cols :=  iii.column_name;
      l_col_name_prod_id := iii.column_name;
    end loop;

  l_sHD_sql := replace(l_sql2, '[col]', trim(leading ',' from l_col_name));
  l_nHD_sql := replace(l_sql2, '[col]', trim(leading ',' from l_col_name));
  l_sHD_SQL := Replace(replace(l_sHD_sql,'[schema]',l_sHD_schema|| '.'), '[tablename]', cur.table_name);
  l_nHD_SQL := Replace(replace(l_nHD_sql,'[schema]',l_sHD_schema|| '.'), '[tablename]', cur.table_name);
  l_sHD_sql := REPLACE(l_sHD_sql, '[l_dblink]', trim(leading '' from''));
  l_nHD_sql := REPLACE(l_nHD_sql, '[l_dblink]', '@wh_ods_gbw12');


  l_minus_sql := 'select count(*) from (' || l_sHD_sql || ' ' || l_warunki || ' minus ' || l_nHD_sql || ' ' ||
                 l_warunki || ') ';

  l_minus_sql2 := 'select count(*) from (' || l_nHD_sql || ' ' || l_warunki || ' minus ' || l_sHD_sql || ' ' ||
                 l_warunki || ')';
    
  l_minus_sql3 := 'select count(*) from (select  [col] from wh_ods.'||cur.table_name||' minus select [col] from wh_ods.'||cur.table_name||'@wh_ods_gbw12)';
  
  l_minus_sql5 := 'select count(*) from ( select [col] from wh_ods.'||cur.table_name||'@wh_ods_gbw12 minus select [col] from wh_ods.'||cur.table_name||')';
  
  l_minus_sql4 := 'select  [col] from wh_ods.'||cur.table_name||' minus select [col] from wh_ods.'||cur.table_name||'@wh_ods_gbw12';
  
  l_minus_sql6 := 'select  [col] from wh_ods.'||cur.table_name||'@wh_ods_gbw12 minus select [col] from wh_ods.'||cur.table_name;
  
  
  dbms_output.put_line('----minus-----');
  log_error(i_check_nr, l_tabname, '----minus-----');
  dbms_output.put_line(l_minus_sql);
  log_error(i_check_nr, l_tabname, l_minus_sql);
  
  BEGIN
    EXECUTE IMMEDIATE l_minus_sql   into ilosc_wierszy;
    dbms_output.put_line('MINUS WYNIK '|| ilosc_wierszy);
    log_error(i_check_nr, l_tabname, 'MINUS WYNIK: '|| ilosc_wierszy);
    
    EXCEPTION 
    when others then 
    begin
      dbms_output.put_line(l_minus_sql || ',  ' || sqlerrm);
      log_error(i_check_nr, l_tabname, l_minus_sql || ', ' || sqlerrm);
    end;
  END;

  
   
  IF ilosc_wierszy > 0 THEN 
  
        dbms_output.put_line('--Pojedyncze kolumny--'); 
        log_error(i_check_nr, l_tabname, '--Pojedyncze kolumny--');
  
        dbms_output.put_line('GBW12 minus GBW11');
        log_error(i_check_nr, l_tabname, 'GBW12 minus GBW11');
        dbms_output.put_line(l_minus_sql6);
        log_error(i_check_nr, l_tabname, l_minus_sql6);
        FOR iii IN (SELECT column_name, 
          COUNT(*) OVER() AS cols_count,
          CASE WHEN column_name like '%_ID' and column_name not like '%_PROD_ID%' THEN 1 ELSE 0 END czy_pominac
              FROM all_tab_columns
              WHERE table_name = upper(cur.table_name)
              AND owner = upper(l2_schema)
              ORDER BY COLUMN_NAME)
        LOOP
        if iii.czy_pominac = 0 then
        BEGIN
          l_sql := REPLACE(l_minus_sql5, '[col]', trim(leading ',' from l_col_name_prod_id||','||iii.column_name));
          EXECUTE IMMEDIATE l_sql INTO l_count;
          

          IF l_count > 0 THEN
            dbms_output.put_line('B³¹d: '||iii.column_name || ', ' || l_count);
              log_error(i_check_nr, l_tabname,'B³¹d: '||iii.column_name || ', ' || l_count);
          else
            dbms_output.put_line('Ok: '||iii.column_name || ', ' || l_count);
                    log_error(i_check_nr, l_tabname, 'Ok: '||iii.column_name || ', ' || l_count);
          END IF;
          EXCEPTION
            WHEN OTHERS THEN
              dbms_output.put_line(l_sql);
                      log_error(i_check_nr, l_tabname, l_sql);

              dbms_output.put_line(SQLERRM);
                      log_error(i_check_nr, l_tabname, SQLERRM);

          END;
          else
                 log_error(i_check_nr, l_tabname, 'Ok: '||iii.column_name || ', - pominiêto');
          end if;
        END LOOP;


        --Sprawdzenie w odwrotnym kierunku
        dbms_output.put_line('GBW11 minus GBW12');
        log_error(i_check_nr, l_tabname, 'GBW11 minus GBW12');
        dbms_output.put_line(l_minus_sql4);
        log_error(i_check_nr, l_tabname, l_minus_sql4);
        FOR iii IN (SELECT column_name, 
          COUNT(*) OVER() AS cols_count,
          CASE WHEN column_name like '%_ID' and column_name not like '%_PROD_ID%' THEN 1 ELSE 0 END czy_pominac
              FROM all_tab_columns
              WHERE table_name = upper(cur.table_name)
              AND owner = upper(l2_schema)
              ORDER BY COLUMN_NAME)
        LOOP
        if iii.czy_pominac = 0 then
        BEGIN
          l_sql := REPLACE( l_minus_sql3, '[col]', trim(leading ',' from l_col_name_prod_id||','||iii.column_name));
          --dbms_output.put_line(l_sql);
          EXECUTE IMMEDIATE l_sql INTO l_count;

          IF l_count > 0 THEN
            dbms_output.put_line('B³¹d: '||iii.column_name || ', ' || l_count);
            log_error(i_check_nr, l_tabname,'B³¹d: '||iii.column_name || ', ' || l_count);
          else
            dbms_output.put_line('Ok: '||iii.column_name || ', ' || l_count);
            log_error(i_check_nr, l_tabname, 'Ok: '||iii.column_name || ', ' || l_count);
          END IF;
          EXCEPTION
            WHEN OTHERS THEN
              BEGIN
                dbms_output.put_line(l_sql);
                  log_error(i_check_nr, l_tabname, l_sql);
                  dbms_output.put_line(SQLERRM);
                            log_error(i_check_nr, l_tabname, SQLERRM);
              END;
          END;
           else
                 log_error(i_check_nr, l_tabname, 'Ok: '||iii.column_name || ', - pominiêto');
          end if;
        END LOOP;
        
      dbms_output.put_line('koniec');
        log_error(i_check_nr, l_tabname, 'koniec');

      ELSE
        dbms_output.put_line('OK: '|| cur.table_name);
        log_error(i_check_nr, l_tabname, 'OK: '|| cur.table_name);
      END IF; 
      ELSE
        dbms_output.put_line('BLAD: '||cur.table_name||' - Niezgodna liczba rekordów');
        log_error(i_check_nr, l_tabname, 'BLAD: '||cur.table_name||' - Niezgodna liczba rekordów');
        
      end IF;
  
    
      END LOOP;
               
   commit;
EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line(SQLERRM);
      log_error(i_check_nr, l_tabname, 'BLAD SKRYPTU: '|| SQLERRM);
    ROLLBACK;
END;

begin
  -- Initialization
NULL;
end COMPARE_GBW;
/