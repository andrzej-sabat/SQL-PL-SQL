--@create_tab_powiel;

spool log/powiel.log;

declare
  czas NUMBER;
  data_d DATE;
--  stan_kl_prod_id NUMBER;
--  Liczba_klonowan NUMBER;
--  ILE_RAZY NUMBER;
  sql_stmt    VARCHAR2(200);
  x number;

begin

for iii in (select last_day(to_date('20180415', 'YYYYMMDD')) tmpdate from dual
union
select to_date('20180515', 'YYYYMMDD')  from dual
union
select last_day(to_date('20180515', 'YYYYMMDD'))  from dual
union
select to_date('20180615', 'YYYYMMDD')  from dual
union
select last_day(to_date('20180615', 'YYYYMMDD'))  from dual
union
select to_date('20180715', 'YYYYMMDD')  from dual
union
select last_day(to_date('20180715', 'YYYYMMDD'))  from dual
union
select to_date('20180815', 'YYYYMMDD')  from dual
union
select last_day(to_date('20180815', 'YYYYMMDD'))  from dual
union
select to_date('20180915', 'YYYYMMDD')  from dual
union
select last_day(to_date('20180915', 'YYYYMMDD'))  from dual
union
select to_date('20181015', 'YYYYMMDD')  from dual
union
select last_day(to_date('20181015', 'YYYYMMDD'))  from dual
union
select to_date('20181115', 'YYYYMMDD')  from dual
union
select last_day(to_date('20181115', 'YYYYMMDD'))  from dual
union
select to_date('20181215', 'YYYYMMDD')  from dual
union
select last_day(to_date('20181215', 'YYYYMMDD')) from dual
order by 1)
loop
 /* execute immediate 'SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = ''KLIENT_ID_SEQ''' into TMP_PROD_ID;
--  dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '||TMP_PROD_ID;
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
  EXECUTE IMMEDIATE sql_stmt  into x;
--  dbms_output.put_line(x);

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;

  commit;

  dbms_output.put_line('klienci_tmp');  */
/*
  insert into klienci_TMP
  (select     k.adres,
              k.adres_kraj_prod_id,
              k.data_urodz, 
              k.miejsce_urodz,
              k.koresp_adres,
              k.koresp_kraj, 
              k.koresp_kod_poczt, 
              k.koresp_miejsc, 
              k.email,
              k.fax, 
              k.nazwa_firmy, 
              k.imie, 
              k.jednostka_prod_id, 
              k.kraj_prod_id,
              k.klasyfikacja_prod_id,
              TMP_PROD_ID_SEQ.NEXTVAL,
              k.form_org_prod_id, 
              k.pkd_prod_id, 
              k.regon_prod_id, 
              k.rezydent, 
              k.imie_panienskie, 
              k.stan_cywilny, 
              k.telefon_kontakt,
              k.adres_kod_pocztowy,
              k.regon_pesel, 
              k.poziom_ryzyka, 
              k.plec,
              k.nazwa_krotka,
              k.data_startu,
              k.nazwisko, 
              k.nip, 
              k.adres_miejscowosc, 
              k.vip, 
              k.zawod_prod_id, 
              k.wyksztalcenie_prod_id, 
              k.data_aktualizacji, 
              kt.kl_id_new,
              k.adres_kraj_id,
              k.klasyfikacja_id, 
              k.rezydent_id, 
              k.typ, 
              k.ekd_prod_id, 
              k.typ_dow_tozsam, 
              k.imie_ojca, 
              k.imie_matki, 
              k.nazwisko_rodowe_matki, 
              k.ekz, 
              k.nr_dok_tozsam, 
              k.opiekun_klienta,
              k.kraj_poch_prod_id, 
              k.kraj_poch_id, 
              k.ekspozycja_kredytowa, 
              k.reklama_data_zgody_do, 
              k.czy_zgoda_kl_udost_danych, 
              k.data_zgody_kl_udost_danych, 
              k.data_wycof_zg_kl_udost_danych,
              k.okres_zgody_udost_danych,
              k.telefon_komorkowy, 
              k.data_ost_analizy_fin, 
              k.telefon_sluzbowy, 
              k.zawod_opis, 
              k.reprezentant_klient_id, 
              k.adres_ulica_prefix,
              k.adres_ulica_nazwa, 
              k.adres_numer_domu, 
              k.adres_numer_mieszkania, 
              k.data_usuniecia, 
              k.klient_bank_rola_prod_id, 
              k.klient_bank_rola_id, 
              k.obywatelstwo_kraj_prod_id, 
              k.wlasciciel_klient_id,
              k.rating_prod_id, 
              k.wielkosc_firmy_prod_id, 
              k.profil_klienta_prod_id, 
              k.segment_kl_nuk, 
              k.dochody_firmy, 
              k.wielkosc_firmy_corep_prod_id, 
              k.koresp_market, 
              k.reklama_data_zgody_od, 
              k.data_uslugi_elektr, 
              k.data_nal_zagrozone,
              k.dochody_zatrudnienie, 
              k.grupa_ryzyka_id, 
              k.liczba_osob_utrzym, 
              k.wyksztalcenie, 
              k.stos_sluzb_woj,
              k.stos_sluzb_woj_prod_id, 
              k.liczba_osob_zatrud, 
              k.koresp_data_obow_od, 
              k.srodki_podst_zatrud, 
              k.srodki_forma_prawna, 
              k.srodki_data_zatrud, 
              k.srodki_forma_opod, 
              k.srodki_zatr_kod_poczt,
              k.adres_wojewodztwo, 
              k.srodki_aktywa_netto
        from KLIENCI k, KLIENCI_ID_TMP kt where k.klient_id = kt.kl_id);

  EXECUTE IMMEDIATE 'SELECT LAST_NUMBER FROM user_sequences WHERE sequence_name = ''ANALITYKA_ID_SEQ''' INTO TMP_PROD_ID;
  --execute immediate 'SELECT MAX(ANALITYKA_PROD_ID) FROM ANALITYKA' into TMP_PROD_ID;
  --dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '|| TMP_PROD_ID;
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
  EXECUTE IMMEDIATE sql_stmt into x;
  --dbms_output.put_line(x);

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;

  dbms_output.put_line('analityka_tmp');


   insert into ANALITYKA_TMP
                                   (select
                                            TMP_PROD_ID_SEQ.NEXTVAL,
                                            a.modulo,
                                            a.konto,
                                            a.suffix1, 
                                            a.suffix2, 
                                            a.obroty_wn, 
                                            a.obroty_ma, 
                                            a.waluta_prod_id, 
                                            a.waluta_symbol, 
                                            a.ksiega_prod_id, 
                                            a.ksiega_opis, 
                                            a.jedn_banku_prod_id, 
                                            a.konto_prod_id, 
                                            a.data_aktualizacji, 
                                            at.an_id_new,
                                            a.waluta_id, 
                                            a.konto_id, 
                                            a.jednostka_id, 
                                            a.saldo_wn, 
                                            a.saldo_ma, 
                                            k.kl_id_new,
                                            a.umowa_id, 
                                            a.rejestr_id, 
                                            a.zabezpieczenie_id, 
                                            a.kwota_zm_rez, 
                                            a.data_usuniecia, 
                                            a.kwota_hip_m,
                                            a.kwota_hip_k, 
                                            a.kwota_hip_i, 
                                            a.rodzaj_hipoteki, 
                                            a.czy_zab_hip, 
                                            a.kod_zabezpieczenia, 
                                            a.grupa_ryzyka_msr, 
                                            a.kalkulacja, 
                                            a.data_zamkniecia, 
                                            a.wlasciciel_klient_id
                                   from ANALITYKA a, KLIENCI_ID_TMP k, ANALITYKA_ID_TMP at, UMOWY_ID_TMP u
                                                                                  where a.klient_id = k.kl_id
                                                                                  and a.analityka_id = at.an_id
                                                                                  and k.kl_id = u.kl_id);

  execute immediate 'SELECT MAX(UMOWA_PROD_ID) FROM UMOWY' into TMP_PROD_ID;
 -- dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '|| TMP_PROD_ID;
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
  EXECUTE IMMEDIATE sql_stmt into x;
 -- dbms_output.put_line(x);

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;
*/
  --dbms_output.put_line('umowy_tmp');
  
  /*
 execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.umowy 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;
 
  
  

    insert into wh.UMOWY
      (select t1.adm_klient_id,
       t1.baza_depozytowa,
       t1.cykl_rozl_id,
       to_char(iii.tmpdate, 'YYYYMMDD'),
       t1.czy_depozyt_odnawialny,
       t1.czy_umowa_do_likwidacji,
       t1.data_kap_wymagalny,
       t1.data_konca_plan_pierw,
       t1.data_konca_skip_payment,
       t1.data_konca_umowy,
       t1.data_konca_umowy_plan,
       t1.data_nadplaty,
       t1.data_nal_zagrozone,
       t1.data_nast_kap,
       t1.data_nast_ods,
       t1.data_nast_raty,
       t1.data_nast_transza,
       t1.data_ods_wymagalne,
       t1.data_odzyskania,
       t1.data_ost_aneksu,
       t1.data_ost_rata_h,
       t1.data_ost_rata_kap,
       t1.data_ost_rata_ods,
       t1.data_ost_rata_wym,
       t1.data_ost_splaty,
       t1.data_ost_transza,
       t1.data_pocz_skip_payment,
       t1.data_prolongaty,
       t1.data_rejestracji,
       t1.data_spisania,
       t1.data_stanu,
       t1.data_transakcji,
       t1.data_umowy,
       t1.data_waluty_ost_splata,
       t1.data_windykacji,
       t1.data_zaleglosci,
       t1.data_zaleglosci_prolongata,
       t1.data_zalozenia_ost_blokady,
       t1.data_zalozenia_pierw_blokady,
       t1.debet_niedozwolony,
       t1.dni_popr_obslugi,
       t1.dochody_g1,
       t1.dochody_g2,
       t1.dochody_g3,
       t1.dochody_g4,
       t1.dochody_g5,
       t1.dochody_inne,
       t1.dochody_odsetkowe,
       t1.dochody_prowizji,
       t1.dochody_prowizji_liniowe,
       t1.dochody_prow_lin_nal,
       t1.dochody_prow_lin_rozl,
       t1.dochody_prow_lin_zastrz,
       t1.dochody_rezerwy,
       t1.dochody_rezerwy_kup,
       t1.dochody_rezerwy_nkup,
       t1.dochody_zastrz,
       t1.do_windykacji,
       t1.esp_data_ost_wyceny,
       t1.esp_dochody,
       t1.esp_dochody_konto,
       t1.esp_dochody_ods,
       t1.esp_dochody_prowizji,
       t1.esp_dochody_prowizji_ru,
       t1.esp_dochody_zastrz,
       t1.esp_dochody_zastrz_konto,
       t1.esp_harm_id,
       t1.esp_korekta_ods_ma,
       t1.esp_korekta_ods_wn,
       t1.esp_koszty_ods,
       t1.esp_koszty_prow,
       t1.esp_koszty_prow_ru,
       t1.esp_prow_rozl,
       t1.esp_przyczyna_wyc,
       t1.esp_rozl_odsetek_ma,
       t1.esp_rozl_odsetek_wn,
       t1.esp_stopa_nominalna,
       t1.esp_stopa_procentowa,
       t1.esp_stopa_proc_bez_prow,
       t1.esp_subwencje,
       t1.esp_wycena,
       t1.esp_wycena_bez_prow,
       t1.fkt_czy_regres,
       t1.grupa_id,
       t1.harm_typ_id,
       t1.ilosc_rat,
       t1.il_rat_kap_wym,
       t1.il_rat_ods_wym,
       t1.jednostka_id,
       t1.kapital_czestotl_splat_ilosc,
       t1.kapital_czestotl_splat_okres,
       t1.kapital_nl,
       t1.kapital_obroty_ma,
       t1.kapital_obroty_wn,
       t1.kapital_pozabilansowy,
       t1.kapital_splacony,
       t1.kapital_splacony_pln,
       t1.kapital_wymagalny,
       t1.kapital_zal_pow180d,
       t1.kapital_zal_pow30d,
       t1.kapital_zal_pow60d,
       t1.kapital_zal_pow90d,
       t1.kapital_zb,
       t1.karencja_zmiany_oproc_dni,
       t1.klnt_id,
       t1.klnt_id1,
       t1.klnt_id2,
       t1.klnt_id3,
       t1.klnt_wielk_firm_id,
       t1.konto_kapital,
       t1.koszty_g1,
       t1.koszty_g2,
       t1.koszty_g3,
       t1.koszty_g4,
       t1.koszty_inne,
       t1.koszty_liniowe,
       t1.koszty_odsetkowe,
       t1.koszty_prowizji_liniowe,
       t1.koszty_prow_lin_rozl,
       t1.koszty_rezerwy,
       t1.koszty_rezerwy_kup,
       t1.koszty_rezerwy_nkup,
       t1.koszty_wind,
       t1.koszty_wind_splacone,
       t1.kurs_ost_splaty,
       t1.kurs_sprzedazy_waluty,
       t1.kurs_sredni_waluty,
       t1.kurs_zakupu_waluty,
       t1.kwota_biez_rata,
       t1.kwota_dopl_bank,
       t1.kwota_dzien_spl_kap,
       t1.kwota_dzien_wypl_kap,
       t1.kwota_kap_niezap_harm,
       t1.kwota_nast_kap,
       t1.kwota_nast_ods,
       t1.kwota_ods_niezap_harm,
       t1.kwota_ost_kap,
       t1.kwota_ost_ods,
       t1.kwota_ost_rata_h,
       t1.kwota_ost_splaty_kap,
       t1.kwota_ost_splaty_ods,
       t1.kwota_ost_splaty_ods_k,
       t1.kwota_ost_splaty_prow,
       t1.kwota_ost_splaty_wind,
       t1.kwota_prolongaty,
       t1.kwota_prow_deal,
       t1.kwota_prow_deal_ubezp,
       t1.kwota_prow_sprzed,
       t1.kwota_prow_sprzed_ubezp,
       t1.kwota_tr_wypl,
       t1.kwota_umowy,
       t1.kwota_zm_rez,
       t1.liczba_transz,
       t1.limit_data_konca,
       t1.limit_data_pocz,
       t1.limit_um_lim_prod_id,
       t1.limit_waluta,
       t1.limit_wartosc,
       t1.linia_dost_limit,
       t1.linia_dost_limit_podrz,
       t1.linia_nr_ref,
       t1.mies_sred_nl,
       t1.mies_sred_zb,
       t1.modulo,
       t1.nadplata,
       t1.nrb,
       t1.nr_raty_zal,
       t1.nr_umowy,
       t1.nr_umowy_migr,
       t1.obroty_dochody_g1,
       t1.obroty_dochody_g2,
       t1.obroty_dochody_g3,
       t1.obroty_dochody_g4,
       t1.obroty_dochody_g5,
       t1.obroty_koszty_g1,
       t1.obroty_koszty_g2,
       t1.obroty_koszty_g3,
       t1.obroty_koszty_g4,
       t1.odsetki_czestotl_splat_ilosc,
       t1.odsetki_czestotl_splat_okres,
       t1.odsetki_karne,
       t1.odsetki_karne_splacone,
       t1.odsetki_karne_splacone_pln,
       t1.odsetki_naliczone_ma,
       t1.odsetki_naliczone_wn,
       t1.odsetki_nl,
       t1.odsetki_nl_obroty_ma,
       t1.odsetki_nl_obroty_wn,
       t1.odsetki_splacone,
       t1.odsetki_splacone_pln,
       t1.odsetki_spl_pln,
       t1.odsetki_wew_nl,
       t1.odsetki_wew_zb,
       t1.odsetki_wymagalne,
       t1.odsetki_zb,
       t1.odsetki_zb_obroty_ma,
       t1.odsetki_zb_obroty_wn,
       t1.okres_id,
       t1.okres_id1,
       t1.okres_ilosc,
       t1.okres_ilosc_prolongata,
       t1.okres_jedn,
       t1.okres_jedn_prolongata,
       t1.oplata_zastaw_rej,
       t1.oplaty,
       t1.oplaty_liniowe,
       t1.oplaty_splacone,
       t1.oplaty_windykacja,
       t1.portfel,
       t1.portfel_ias39_id,
       t1.produkt_id,
       t1.produkt_nazwa_alg_ma,
       t1.produkt_nazwa_alg_wn,
       t1.produkt_nazwa_tab_ma,
       t1.produkt_nazwa_tab_wn,
       t1.produkt_promocyjny,
       t1.produkt_spons_oproc,
       t1.produkt_stopa_karna_mnoznik,
       t1.produkt_stopa_karna_stala,
       t1.produkt_stopa_ma,
       t1.produkt_stopa_ma_mnoznik,
       t1.produkt_stopa_ma_stala,
       t1.produkt_stopa_ma_tab_alg,
       t1.produkt_stopa_wn_mnoznik,
       t1.produkt_stopa_wn_stala,
       t1.produkt_stopa_wn_tab_alg,
       t1.prod_param_stopa_ma,
       t1.prod_param_stopa_wn,
       t1.prowizja_banku_finansowana,
       t1.prowizje_karty,
       t1.prowizje_karty_oper,
       t1.prowizje_kredyt,
       t1.prowizje_przy_uruchomieniu,
       t1.prowizje_rb,
       t1.prowizje_splacone,
       t1.prowizje_zal,
       t1.prow_do_rozl_esp,
       t1.przedst_handl_id,
       t1.przewal_data_ksieg,
       t1.przewal_kurs_pln2wal,
       t1.przewal_kurs_wal2pln,
       t1.przewal_nr,
       t1.przezn_id,
       t1.rata_balonowa,
       t1.rb_limit,
       t1.rezerwa,
       t1.rezerwa_kup,
       t1.rezerwa_nkup,
       t1.rezerwa_rb,
       t1.rezerwa_rb_kup,
       t1.rezerwa_rb_nkup,
       t1.rezerwa_ru,
       t1.rezerwa_ru_kup,
       t1.rezerwa_ru_nkup,
       t1.rodzaj_portfela,
       t1.saldo,
       t1.skladka_ubezp_splacona,
       t1.skladka_ubezp_splacona_pln,
       t1.skladka_ubezp_zalegla,
       t1.skladka_ubezp_zalegla_pln,
       t1.splata_przedterminowa,
       t1.sprzedawca_id,
       t1.srednie_saldo,
       t1.srednie_saldo_30,
       t1.srednie_saldo_30_pln,
       t1.srednie_saldo_pln,
       t1.stan_nl,
       t1.stan_nl_pln,
       t1.stan_zb,
       t1.stan_zb_pln,
       t1.status,
       t1.status_umowy_id,
       t1.stopa_karna,
       t1.stopa_karna_podstawa,
       t1.stopa_ma,
       t1.stopa_ma_ind,
       t1.stopa_ma_mnoznik,
       t1.stopa_ma_podstawa,
       t1.stopa_ma_stala,
       t1.stopa_ma_tab,
       t1.stopa_ma_tab_alg,
       t1.stopa_ma_typ,
       t1.stopa_wew_nl,
       t1.stopa_wew_zb,
       t1.stopa_wn,
       t1.stopa_wn_mnoznik,
       t1.stopa_wn_podstawa,
       t1.stopa_wn_stala,
       t1.stopa_wn_tab,
       t1.stopa_wn_tab_alg,
       t1.stopa_wn_typ,
       t1.system,
       t1.typ_umowy,
       t1.typ_umowy_id,
       t1.tytul_ost_blokady,
       t1.tytul_pierw_blokady,
       t1.umowa_id,
       t1.umowa_limit_id,
       t1.umowa_linia_id,
       t1.umowa_nazwa_tab_ma,
       t1.umowa_nazwa_tab_wn,
       t1.umowa_prod_id,
       t1.um_wypow_prod_id,
       t1.uprawdopodobnienie,
       t1.waluta_id,
       t1.waluta_poprz_okr,
       t1.wind_czynnosc_id,
       t1.wind_czynnosc_nazwa,
       t1.wind_data_czynnosci,
       t1.wind_data_konc_procesu,
       t1.wind_data_sekcja,
       t1.wind_data_start,
       t1.wind_data_status,
       t1.wind_data_wypow,
       t1.wind_nr_procesu,
       t1.wind_obs_reczna,
       t1.wind_operator_id,
       t1.wind_sekcja_id,
       t1.wind_status_czynnosci,
       t1.wind_status_id,
       t1.wind_w_firmie_wind,
       t1.wsk_osadu_dzien,
       t1.wsk_osadu_mies,
       t1.wsk_osadu_rok,
       t1.wsk_zrywalnosci,
       t1.wyciag_gen_dzien,
       t1.wyciag_gen_miesiac,
       t1.wyciag_okres_ilosc,
       t1.wyciag_okres_nazwa,
       t1.wyciag_ost_dzien,
       t1.zabezp_akt,
       t1.zabezp_wart_akt,
       t1.akt_blokada,
       t1.czy_rachunek_podstawowy,
       t1.data_ost_kap_ma,
       t1.data_ost_kap_wn,
       t1.koszty_prowizji,
       t1.kwota_wplaty_ike,
       t1.odsetki_ewidencyjne,
       t1.podtyp_umowy,
       t1.powod_likwidacji,
       t1.umowa_nazwa_alg_ma,
       t1.umowa_nazwa_alg_wn,
       t1.typ_konsorcjum_id,
       t1.stan_umowy_prod_id,
       t1.stan_kredytu_id,
       t1.restrukturyzacja_data_ksieg,
       t1.mies_sred_stan_x_stopa_nl,
       t1.kwota_umarz_ods_karnych,
       t1.kwota_umarz_kapital,
       t1.kwota_spis_kapital,
       t1.kwota_odzysk_ods_karn,
       t1.kwota_odzysk_nalezn_kap,
       t1.data_odzyskania_naleznosci,
       t1.stan_umowy_id,
       t1.restrukturyzacja_numer,
       t1.prowizje_liniowe,
       t1.mies_sred_stan_x_stopa_zb,
       t1.kwota_umarz_ods,
       t1.kwota_odzysk_nalezn_ods,
       t1.kwota_ods_wym_spis,
       t1.czy_rekomendacja_s,
       t1.czy_kredyt_w_konsorcjum,
       t1.bank_org_konsorcjum,
       t1.kons_glowna_umowa_id,
       t1.rezerwa_konto,
       t1.umowa_ilosc_str,
       t1.umowa_data_podp_wn,
       t1.klnt_id4,
       t1.dochody_nadzwyczajne,
       t1.esp_koszty,
       t1.wart_zm_podst_rez,
       t1.odsetki_skapitalizowane,
       t1.koszty_windykacji_wal_bazowa,
       t1.data_podpisania_umowy,
       t1.odsetki_karne_wal_bazowa,
       t1.kapital_zalegly_wal_bazowa,
       t1.prowizje_zalegle_wal_bazowa,
       t1.odsetki_zalegle_wal_bazowa,
       t1.stopa_wn_nr_alg,
       t1.stopa_ma_nr_alg,
       t1.oprocentowanie_donatora,
       t1.opis_tabeli_wn,
       t1.opis_tabeli_ma,
       t1.data_zamkniecia,
       t1.blokada_czek,
       t1.blokada_kom,
       t1.blokada_rozne,
       t1.data_spisania_pozabil,
       t1.data_naleznosci_finrep,
       t1.fundusz_ods_ovn,
       t1.limit_wykorzystany,
       t1.odsetki_nalezne_od_donatora,
       t1.rejestr_depoz_doplat_do_rozl,
       t1.rez_cel_zob_pozabil,
       t1.stan_podst_lokata_ovn,
       t1.srodki_wyksiegowane,
       t1.zaleglosci_odsetkowe,
       t1.oproc_trans_gotowkowych,
       t1.oproc_trans_bezgotowkowych,
       t1.oproc_trans_ratalnych,
       t1.ods_skapitalizowane_spisane,
       t1.ods_karne_skapitalizowane,
       t1.ods_karne_skapit_spisane,
       t1.odsetki_karne_spisane,
       t1.odpisy_aktualizujace,
       t1.odpisy_aktualizujace_spisane 
       from wh.UMOWY t1
       where czas_id = czas);

  commit;
  */
  
  /*
  --pusta
   execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.bilans_rw 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;
 
  
		insert into wh.BILANS_RW
		(select 
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.JEDNOSTKA_ID,
t1.POZ_FORM_ID,
t1.RODZAJ_KONFIGURACJI,
t1.WALUTA_ID,
t1.WARTOSC,
t1.WARTOSC_PLN,
t1.WARTOSC_ROUND,
t1.WARTOSC_ROUND_PLN,
t1.WERSJA
from wh.BILANS_RW t1
where czas_id = czas);

commit;
*/

/*
--pusta
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.ck_syntetyka 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;


		insert into wh.CK_SYNTETYKA
		(SELECT
t1.CK_CENTRUM_KOSZTOW_ID,
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.JEDNOSTKA_ID,
t1.KONTO_ID,
t1.OBROTY_MA,
t1.OBROTY_WN,
t1.PRODUKT_ID,
t1.SALDO_MA,
t1.SALDO_MA_PRZYROST_DZ,
t1.SALDO_MA_PRZYROST_MIES,
t1.SALDO_MA_PRZYROST_ROK,
t1.SALDO_WN,
t1.SALDO_WN_PRZYROST_DZ,
t1.SALDO_WN_PRZYROST_MIES,
t1.SALDO_WN_PRZYROST_ROK,
t1.TK_TYP_KOSZTU_ID,
t1.WALUTA_ID
from wh.CK_SYNTETYKA t1 
where czas_id = czas);

commit;
*/

/*
--pusta
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.depozyty_ike 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;


		insert into wh.DEPOZYTY_IKE
		(SELECT
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.CZY_WYSTAPILA_WPLATA,
t1.DATA_OTWARCIA_IKE,
t1.DATA_ZAMKNIECIA,
t1.IKE_WYPL_JEDNO_KW,
t1.IKE_WYPL_JEDNO_L,
t1.IKE_WYPL_RATA_KW,
t1.IKE_WYPL_RATA_L,
t1.IKE_ZW_SRODKOW_KW,
t1.IKE_ZW_SRODKOW_L,
t1.IKE_ZW_SROD_CZESC_KW,
t1.IKE_ZW_SROD_CZESC_L,
t1.JEDNOSTKA_ID,
t1.KLNT_ID,
t1.NADPLATA_IKE,
t1.NADPLATA_IKE_POPRZ_OKRES,
t1.NADPLATA_IKE_ROZNICA,
t1.NR_REFERENCYJNY,
t1.ODSETKI_NALICZONE_MA,
t1.ODSETKI_NALICZONE_WN,
t1.PLEC,
t1.POWOD_LIKWIDACJI,
t1.SALDO,
t1.SALDO_POPRZ_OKRES,
t1.STATUS_UMOWY_ID1,
t1.SUMA_WYPLAT_Z_DOK,
t1.UMOWA_ID,
t1.WALUTA_ID1,
t1.WIEK_KLIENTA,
t1.WPLATA_IKE
from wh.DEPOZYTY_IKE t1
where czas_id = czas);
		
commit;
*/

/*
--pusta
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.depozyty_wskazniki 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

		insert into wh.DEPOZYTY_WSKAZNIKI
		(SELECT
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.DATA_WYMAGALNOSCI,
t1.DO10D_ILOSC_ODNAWIALNOSC,
t1.DO10D_ILOSC_ODNAWIALNOSC_O,
t1.DO10D_ILOSC_ZRYWALNOSC,
t1.DO10D_ILOSC_ZRYWALNOSC_O,
t1.DO10D_KWOTA,
t1.DO10D_KWOTA_ODNAWIALNOSC,
t1.DO10D_KWOTA_ODNAWIALNOSC_O,
t1.DO10D_KWOTA_ZRYWALNOSC,
t1.DO10D_KWOTA_ZRYWALNOSC_O,
t1.DO10M_ILOSC_ODNAWIALNOSC,
t1.DO10M_ILOSC_ODNAWIALNOSC_O,
t1.DO10M_ILOSC_ZRYWALNOSC,
t1.DO10M_ILOSC_ZRYWALNOSC_O,
t1.DO10M_KWOTA,
t1.DO10M_KWOTA_ODNAWIALNOSC,
t1.DO10M_KWOTA_ODNAWIALNOSC_O,
t1.DO10M_KWOTA_ZRYWALNOSC,
t1.DO10M_KWOTA_ZRYWALNOSC_O,
t1.DO10R_ILOSC_ODNAWIALNOSC,
t1.DO10R_ILOSC_ODNAWIALNOSC_O,
t1.DO10R_ILOSC_ZRYWALNOSC,
t1.DO10R_ILOSC_ZRYWALNOSC_O,
t1.DO10R_KWOTA,
t1.DO10R_KWOTA_ODNAWIALNOSC,
t1.DO10R_KWOTA_ODNAWIALNOSC_O,
t1.DO10R_KWOTA_ZRYWALNOSC,
t1.DO10R_KWOTA_ZRYWALNOSC_O,
t1.DO11D_ILOSC_ODNAWIALNOSC,
t1.DO11D_ILOSC_ODNAWIALNOSC_O,
t1.DO11D_ILOSC_ZRYWALNOSC,
t1.DO11D_ILOSC_ZRYWALNOSC_O,
t1.DO11D_KWOTA,
t1.DO11D_KWOTA_ODNAWIALNOSC,
t1.DO11D_KWOTA_ODNAWIALNOSC_O,
t1.DO11D_KWOTA_ZRYWALNOSC,
t1.DO11D_KWOTA_ZRYWALNOSC_O,
t1.DO11M_ILOSC_ODNAWIALNOSC,
t1.DO11M_ILOSC_ODNAWIALNOSC_O,
t1.DO11M_ILOSC_ZRYWALNOSC,
t1.DO11M_ILOSC_ZRYWALNOSC_O,
t1.DO11M_KWOTA,
t1.DO11M_KWOTA_ODNAWIALNOSC,
t1.DO11M_KWOTA_ODNAWIALNOSC_O,
t1.DO11M_KWOTA_ZRYWALNOSC,
t1.DO11M_KWOTA_ZRYWALNOSC_O,
t1.DO12D_ILOSC_ODNAWIALNOSC,
t1.DO12D_ILOSC_ODNAWIALNOSC_O,
t1.DO12D_ILOSC_ZRYWALNOSC,
t1.DO12D_ILOSC_ZRYWALNOSC_O,
t1.DO12D_KWOTA,
t1.DO12D_KWOTA_ODNAWIALNOSC,
t1.DO12D_KWOTA_ODNAWIALNOSC_O,
t1.DO12D_KWOTA_ZRYWALNOSC,
t1.DO12D_KWOTA_ZRYWALNOSC_O,
t1.DO12M_ILOSC_ODNAWIALNOSC,
t1.DO12M_ILOSC_ODNAWIALNOSC_O,
t1.DO12M_ILOSC_ZRYWALNOSC,
t1.DO12M_ILOSC_ZRYWALNOSC_O,
t1.DO12M_KWOTA,
t1.DO12M_KWOTA_ODNAWIALNOSC,
t1.DO12M_KWOTA_ODNAWIALNOSC_O,
t1.DO12M_KWOTA_ZRYWALNOSC,
t1.DO12M_KWOTA_ZRYWALNOSC_O,
t1.DO13D_ILOSC_ODNAWIALNOSC,
t1.DO13D_ILOSC_ODNAWIALNOSC_O,
t1.DO13D_ILOSC_ZRYWALNOSC,
t1.DO13D_ILOSC_ZRYWALNOSC_O,
t1.DO13D_KWOTA,
t1.DO13D_KWOTA_ODNAWIALNOSC,
t1.DO13D_KWOTA_ODNAWIALNOSC_O,
t1.DO13D_KWOTA_ZRYWALNOSC,
t1.DO13D_KWOTA_ZRYWALNOSC_O,
t1.DO14D_ILOSC_ODNAWIALNOSC,
t1.DO14D_ILOSC_ODNAWIALNOSC_O,
t1.DO14D_ILOSC_ZRYWALNOSC,
t1.DO14D_ILOSC_ZRYWALNOSC_O,
t1.DO14D_KWOTA,
t1.DO14D_KWOTA_ODNAWIALNOSC,
t1.DO14D_KWOTA_ODNAWIALNOSC_O,
t1.DO14D_KWOTA_ZRYWALNOSC,
t1.DO14D_KWOTA_ZRYWALNOSC_O,
t1.DO15D_ILOSC_ODNAWIALNOSC,
t1.DO15D_ILOSC_ODNAWIALNOSC_O,
t1.DO15D_ILOSC_ZRYWALNOSC,
t1.DO15D_ILOSC_ZRYWALNOSC_O,
t1.DO15D_KWOTA,
t1.DO15D_KWOTA_ODNAWIALNOSC,
t1.DO15D_KWOTA_ODNAWIALNOSC_O,
t1.DO15D_KWOTA_ZRYWALNOSC,
t1.DO15D_KWOTA_ZRYWALNOSC_O,
t1.DO16D_ILOSC_ODNAWIALNOSC,
t1.DO16D_ILOSC_ODNAWIALNOSC_O,
t1.DO16D_ILOSC_ZRYWALNOSC,
t1.DO16D_ILOSC_ZRYWALNOSC_O,
t1.DO16D_KWOTA,
t1.DO16D_KWOTA_ODNAWIALNOSC,
t1.DO16D_KWOTA_ODNAWIALNOSC_O,
t1.DO16D_KWOTA_ZRYWALNOSC,
t1.DO16D_KWOTA_ZRYWALNOSC_O,
t1.DO17D_ILOSC_ODNAWIALNOSC,
t1.DO17D_ILOSC_ODNAWIALNOSC_O,
t1.DO17D_ILOSC_ZRYWALNOSC,
t1.DO17D_ILOSC_ZRYWALNOSC_O,
t1.DO17D_KWOTA,
t1.DO17D_KWOTA_ODNAWIALNOSC,
t1.DO17D_KWOTA_ODNAWIALNOSC_O,
t1.DO17D_KWOTA_ZRYWALNOSC,
t1.DO17D_KWOTA_ZRYWALNOSC_O,
t1.DO18D_ILOSC_ODNAWIALNOSC,
t1.DO18D_ILOSC_ODNAWIALNOSC_O,
t1.DO18D_ILOSC_ZRYWALNOSC,
t1.DO18D_ILOSC_ZRYWALNOSC_O,
t1.DO18D_KWOTA,
t1.DO18D_KWOTA_ODNAWIALNOSC,
t1.DO18D_KWOTA_ODNAWIALNOSC_O,
t1.DO18D_KWOTA_ZRYWALNOSC,
t1.DO18D_KWOTA_ZRYWALNOSC_O,
t1.DO19D_ILOSC_ODNAWIALNOSC,
t1.DO19D_ILOSC_ODNAWIALNOSC_O,
t1.DO19D_ILOSC_ZRYWALNOSC,
t1.DO19D_ILOSC_ZRYWALNOSC_O,
t1.DO19D_KWOTA,
t1.DO19D_KWOTA_ODNAWIALNOSC,
t1.DO19D_KWOTA_ODNAWIALNOSC_O,
t1.DO19D_KWOTA_ZRYWALNOSC,
t1.DO19D_KWOTA_ZRYWALNOSC_O,
t1.DO1D_ILOSC_ODNAWIALNOSC,
t1.DO1D_ILOSC_ODNAWIALNOSC_O,
t1.DO1D_ILOSC_ZRYWALNOSC,
t1.DO1D_ILOSC_ZRYWALNOSC_O,
t1.DO1D_KWOTA,
t1.DO1D_KWOTA_ODNAWIALNOSC,
t1.DO1D_KWOTA_ODNAWIALNOSC_O,
t1.DO1D_KWOTA_ZRYWALNOSC,
t1.DO1D_KWOTA_ZRYWALNOSC_O,
t1.DO20D_ILOSC_ODNAWIALNOSC,
t1.DO20D_ILOSC_ODNAWIALNOSC_O,
t1.DO20D_ILOSC_ZRYWALNOSC,
t1.DO20D_ILOSC_ZRYWALNOSC_O,
t1.DO20D_KWOTA,
t1.DO20D_KWOTA_ODNAWIALNOSC,
t1.DO20D_KWOTA_ODNAWIALNOSC_O,
t1.DO20D_KWOTA_ZRYWALNOSC,
t1.DO20D_KWOTA_ZRYWALNOSC_O,
t1.DO20R_ILOSC_ODNAWIALNOSC,
t1.DO20R_ILOSC_ODNAWIALNOSC_O,
t1.DO20R_ILOSC_ZRYWALNOSC,
t1.DO20R_ILOSC_ZRYWALNOSC_O,
t1.DO20R_KWOTA,
t1.DO20R_KWOTA_ODNAWIALNOSC,
t1.DO20R_KWOTA_ODNAWIALNOSC_O,
t1.DO20R_KWOTA_ZRYWALNOSC,
t1.DO20R_KWOTA_ZRYWALNOSC_O,
t1.DO21D_ILOSC_ODNAWIALNOSC,
t1.DO21D_ILOSC_ODNAWIALNOSC_O,
t1.DO21D_ILOSC_ZRYWALNOSC,
t1.DO21D_ILOSC_ZRYWALNOSC_O,
t1.DO21D_KWOTA,
t1.DO21D_KWOTA_ODNAWIALNOSC,
t1.DO21D_KWOTA_ODNAWIALNOSC_O,
t1.DO21D_KWOTA_ZRYWALNOSC,
t1.DO21D_KWOTA_ZRYWALNOSC_O,
t1.DO22D_ILOSC_ODNAWIALNOSC,
t1.DO22D_ILOSC_ODNAWIALNOSC_O,
t1.DO22D_ILOSC_ZRYWALNOSC,
t1.DO22D_ILOSC_ZRYWALNOSC_O,
t1.DO22D_KWOTA,
t1.DO22D_KWOTA_ODNAWIALNOSC,
t1.DO22D_KWOTA_ODNAWIALNOSC_O,
t1.DO22D_KWOTA_ZRYWALNOSC,
t1.DO22D_KWOTA_ZRYWALNOSC_O,
t1.DO23D_ILOSC_ODNAWIALNOSC,
t1.DO23D_ILOSC_ODNAWIALNOSC_O,
t1.DO23D_ILOSC_ZRYWALNOSC,
t1.DO23D_ILOSC_ZRYWALNOSC_O,
t1.DO23D_KWOTA,
t1.DO23D_KWOTA_ODNAWIALNOSC,
t1.DO23D_KWOTA_ODNAWIALNOSC_O,
t1.DO23D_KWOTA_ZRYWALNOSC,
t1.DO23D_KWOTA_ZRYWALNOSC_O,
t1.DO24D_ILOSC_ODNAWIALNOSC,
t1.DO24D_ILOSC_ODNAWIALNOSC_O,
t1.DO24D_ILOSC_ZRYWALNOSC,
t1.DO24D_ILOSC_ZRYWALNOSC_O,
t1.DO24D_KWOTA,
t1.DO24D_KWOTA_ODNAWIALNOSC,
t1.DO24D_KWOTA_ODNAWIALNOSC_O,
t1.DO24D_KWOTA_ZRYWALNOSC,
t1.DO24D_KWOTA_ZRYWALNOSC_O,
t1.DO25D_ILOSC_ODNAWIALNOSC,
t1.DO25D_ILOSC_ODNAWIALNOSC_O,
t1.DO25D_ILOSC_ZRYWALNOSC,
t1.DO25D_ILOSC_ZRYWALNOSC_O,
t1.DO25D_KWOTA,
t1.DO25D_KWOTA_ODNAWIALNOSC,
t1.DO25D_KWOTA_ODNAWIALNOSC_O,
t1.DO25D_KWOTA_ZRYWALNOSC,
t1.DO25D_KWOTA_ZRYWALNOSC_O,
t1.DO26D_ILOSC_ODNAWIALNOSC,
t1.DO26D_ILOSC_ODNAWIALNOSC_O,
t1.DO26D_ILOSC_ZRYWALNOSC,
t1.DO26D_ILOSC_ZRYWALNOSC_O,
t1.DO26D_KWOTA,
t1.DO26D_KWOTA_ODNAWIALNOSC,
t1.DO26D_KWOTA_ODNAWIALNOSC_O,
t1.DO26D_KWOTA_ZRYWALNOSC,
t1.DO26D_KWOTA_ZRYWALNOSC_O,
t1.DO27D_ILOSC_ODNAWIALNOSC,
t1.DO27D_ILOSC_ODNAWIALNOSC_O,
t1.DO27D_ILOSC_ZRYWALNOSC,
t1.DO27D_ILOSC_ZRYWALNOSC_O,
t1.DO27D_KWOTA,
t1.DO27D_KWOTA_ODNAWIALNOSC,
t1.DO27D_KWOTA_ODNAWIALNOSC_O,
t1.DO27D_KWOTA_ZRYWALNOSC,
t1.DO27D_KWOTA_ZRYWALNOSC_O,
t1.DO28D_ILOSC_ODNAWIALNOSC,
t1.DO28D_ILOSC_ODNAWIALNOSC_O,
t1.DO28D_ILOSC_ZRYWALNOSC,
t1.DO28D_ILOSC_ZRYWALNOSC_O,
t1.DO28D_KWOTA,
t1.DO28D_KWOTA_ODNAWIALNOSC,
t1.DO28D_KWOTA_ODNAWIALNOSC_O,
t1.DO28D_KWOTA_ZRYWALNOSC,
t1.DO28D_KWOTA_ZRYWALNOSC_O,
t1.DO29D_ILOSC_ODNAWIALNOSC,
t1.DO29D_ILOSC_ODNAWIALNOSC_O,
t1.DO29D_ILOSC_ZRYWALNOSC,
t1.DO29D_ILOSC_ZRYWALNOSC_O,
t1.DO29D_KWOTA,
t1.DO29D_KWOTA_ODNAWIALNOSC,
t1.DO29D_KWOTA_ODNAWIALNOSC_O,
t1.DO29D_KWOTA_ZRYWALNOSC,
t1.DO29D_KWOTA_ZRYWALNOSC_O,
t1.DO2D_ILOSC_ODNAWIALNOSC,
t1.DO2D_ILOSC_ODNAWIALNOSC_O,
t1.DO2D_ILOSC_ZRYWALNOSC,
t1.DO2D_ILOSC_ZRYWALNOSC_O,
t1.DO2D_KWOTA,
t1.DO2D_KWOTA_ODNAWIALNOSC,
t1.DO2D_KWOTA_ODNAWIALNOSC_O,
t1.DO2D_KWOTA_ZRYWALNOSC,
t1.DO2D_KWOTA_ZRYWALNOSC_O,
t1.DO2M_ILOSC_ODNAWIALNOSC,
t1.DO2M_ILOSC_ODNAWIALNOSC_O,
t1.DO2M_ILOSC_ZRYWALNOSC,
t1.DO2M_ILOSC_ZRYWALNOSC_O,
t1.DO2M_KWOTA,
t1.DO2M_KWOTA_ODNAWIALNOSC,
t1.DO2M_KWOTA_ODNAWIALNOSC_O,
t1.DO2M_KWOTA_ZRYWALNOSC,
t1.DO2M_KWOTA_ZRYWALNOSC_O,
t1.DO2R_ILOSC_ODNAWIALNOSC,
t1.DO2R_ILOSC_ODNAWIALNOSC_O,
t1.DO2R_ILOSC_ZRYWALNOSC,
t1.DO2R_ILOSC_ZRYWALNOSC_O,
t1.DO2R_KWOTA,
t1.DO2R_KWOTA_ODNAWIALNOSC,
t1.DO2R_KWOTA_ODNAWIALNOSC_O,
t1.DO2R_KWOTA_ZRYWALNOSC,
t1.DO2R_KWOTA_ZRYWALNOSC_O,
t1.DO30D_ILOSC_ODNAWIALNOSC,
t1.DO30D_ILOSC_ODNAWIALNOSC_O,
t1.DO30D_ILOSC_ZRYWALNOSC,
t1.DO30D_ILOSC_ZRYWALNOSC_O,
t1.DO30D_KWOTA,
t1.DO30D_KWOTA_ODNAWIALNOSC,
t1.DO30D_KWOTA_ODNAWIALNOSC_O,
t1.DO30D_KWOTA_ZRYWALNOSC,
t1.DO30D_KWOTA_ZRYWALNOSC_O,
t1.DO30R_ILOSC_ODNAWIALNOSC,
t1.DO30R_ILOSC_ODNAWIALNOSC_O,
t1.DO30R_ILOSC_ZRYWALNOSC,
t1.DO30R_ILOSC_ZRYWALNOSC_O,
t1.DO30R_KWOTA,
t1.DO30R_KWOTA_ODNAWIALNOSC,
t1.DO30R_KWOTA_ODNAWIALNOSC_O,
t1.DO30R_KWOTA_ZRYWALNOSC,
t1.DO30R_KWOTA_ZRYWALNOSC_O,
t1.DO3D_ILOSC_ODNAWIALNOSC,
t1.DO3D_ILOSC_ODNAWIALNOSC_O,
t1.DO3D_ILOSC_ZRYWALNOSC,
t1.DO3D_ILOSC_ZRYWALNOSC_O,
t1.DO3D_KWOTA,
t1.DO3D_KWOTA_ODNAWIALNOSC,
t1.DO3D_KWOTA_ODNAWIALNOSC_O,
t1.DO3D_KWOTA_ZRYWALNOSC,
t1.DO3D_KWOTA_ZRYWALNOSC_O,
t1.DO3M_ILOSC_ODNAWIALNOSC,
t1.DO3M_ILOSC_ODNAWIALNOSC_O,
t1.DO3M_ILOSC_ZRYWALNOSC,
t1.DO3M_ILOSC_ZRYWALNOSC_O,
t1.DO3M_KWOTA,
t1.DO3M_KWOTA_ODNAWIALNOSC,
t1.DO3M_KWOTA_ODNAWIALNOSC_O,
t1.DO3M_KWOTA_ZRYWALNOSC,
t1.DO3M_KWOTA_ZRYWALNOSC_O,
t1.DO3R_ILOSC_ODNAWIALNOSC,
t1.DO3R_ILOSC_ODNAWIALNOSC_O,
t1.DO3R_ILOSC_ZRYWALNOSC,
t1.DO3R_ILOSC_ZRYWALNOSC_O,
t1.DO3R_KWOTA,
t1.DO3R_KWOTA_ODNAWIALNOSC,
t1.DO3R_KWOTA_ODNAWIALNOSC_O,
t1.DO3R_KWOTA_ZRYWALNOSC,
t1.DO3R_KWOTA_ZRYWALNOSC_O,
t1.DO4D_ILOSC_ODNAWIALNOSC,
t1.DO4D_ILOSC_ODNAWIALNOSC_O,
t1.DO4D_ILOSC_ZRYWALNOSC,
t1.DO4D_ILOSC_ZRYWALNOSC_O,
t1.DO4D_KWOTA,
t1.DO4D_KWOTA_ODNAWIALNOSC,
t1.DO4D_KWOTA_ODNAWIALNOSC_O,
t1.DO4D_KWOTA_ZRYWALNOSC,
t1.DO4D_KWOTA_ZRYWALNOSC_O,
t1.DO4M_ILOSC_ODNAWIALNOSC,
t1.DO4M_ILOSC_ODNAWIALNOSC_O,
t1.DO4M_ILOSC_ZRYWALNOSC,
t1.DO4M_ILOSC_ZRYWALNOSC_O,
t1.DO4M_KWOTA,
t1.DO4M_KWOTA_ODNAWIALNOSC,
t1.DO4M_KWOTA_ODNAWIALNOSC_O,
t1.DO4M_KWOTA_ZRYWALNOSC,
t1.DO4M_KWOTA_ZRYWALNOSC_O,
t1.DO4R_ILOSC_ODNAWIALNOSC,
t1.DO4R_ILOSC_ODNAWIALNOSC_O,
t1.DO4R_ILOSC_ZRYWALNOSC,
t1.DO4R_ILOSC_ZRYWALNOSC_O,
t1.DO4R_KWOTA,
t1.DO4R_KWOTA_ODNAWIALNOSC,
t1.DO4R_KWOTA_ODNAWIALNOSC_O,
t1.DO4R_KWOTA_ZRYWALNOSC,
t1.DO4R_KWOTA_ZRYWALNOSC_O,
t1.DO5D_ILOSC_ODNAWIALNOSC,
t1.DO5D_ILOSC_ODNAWIALNOSC_O,
t1.DO5D_ILOSC_ZRYWALNOSC,
t1.DO5D_ILOSC_ZRYWALNOSC_O,
t1.DO5D_KWOTA,
t1.DO5D_KWOTA_ODNAWIALNOSC,
t1.DO5D_KWOTA_ODNAWIALNOSC_O,
t1.DO5D_KWOTA_ZRYWALNOSC,
t1.DO5D_KWOTA_ZRYWALNOSC_O,
t1.DO5M_ILOSC_ODNAWIALNOSC,
t1.DO5M_ILOSC_ODNAWIALNOSC_O,
t1.DO5M_ILOSC_ZRYWALNOSC,
t1.DO5M_ILOSC_ZRYWALNOSC_O,
t1.DO5M_KWOTA,
t1.DO5M_KWOTA_ODNAWIALNOSC,
t1.DO5M_KWOTA_ODNAWIALNOSC_O,
t1.DO5M_KWOTA_ZRYWALNOSC,
t1.DO5M_KWOTA_ZRYWALNOSC_O,
t1.DO5R_ILOSC_ODNAWIALNOSC,
t1.DO5R_ILOSC_ODNAWIALNOSC_O,
t1.DO5R_ILOSC_ZRYWALNOSC,
t1.DO5R_ILOSC_ZRYWALNOSC_O,
t1.DO5R_KWOTA,
t1.DO5R_KWOTA_ODNAWIALNOSC,
t1.DO5R_KWOTA_ODNAWIALNOSC_O,
t1.DO5R_KWOTA_ZRYWALNOSC,
t1.DO5R_KWOTA_ZRYWALNOSC_O,
t1.DO6D_ILOSC_ODNAWIALNOSC,
t1.DO6D_ILOSC_ODNAWIALNOSC_O,
t1.DO6D_ILOSC_ZRYWALNOSC,
t1.DO6D_ILOSC_ZRYWALNOSC_O,
t1.DO6D_KWOTA,
t1.DO6D_KWOTA_ODNAWIALNOSC,
t1.DO6D_KWOTA_ODNAWIALNOSC_O,
t1.DO6D_KWOTA_ZRYWALNOSC,
t1.DO6D_KWOTA_ZRYWALNOSC_O,
t1.DO6M_ILOSC_ODNAWIALNOSC,
t1.DO6M_ILOSC_ODNAWIALNOSC_O,
t1.DO6M_ILOSC_ZRYWALNOSC,
t1.DO6M_ILOSC_ZRYWALNOSC_O,
t1.DO6M_KWOTA,
t1.DO6M_KWOTA_ODNAWIALNOSC,
t1.DO6M_KWOTA_ODNAWIALNOSC_O,
t1.DO6M_KWOTA_ZRYWALNOSC,
t1.DO6M_KWOTA_ZRYWALNOSC_O,
t1.DO7D_ILOSC_ODNAWIALNOSC,
t1.DO7D_ILOSC_ODNAWIALNOSC_O,
t1.DO7D_ILOSC_ZRYWALNOSC,
t1.DO7D_ILOSC_ZRYWALNOSC_O,
t1.DO7D_KWOTA,
t1.DO7D_KWOTA_ODNAWIALNOSC,
t1.DO7D_KWOTA_ODNAWIALNOSC_O,
t1.DO7D_KWOTA_ZRYWALNOSC,
t1.DO7D_KWOTA_ZRYWALNOSC_O,
t1.DO7M_ILOSC_ODNAWIALNOSC,
t1.DO7M_ILOSC_ODNAWIALNOSC_O,
t1.DO7M_ILOSC_ZRYWALNOSC,
t1.DO7M_ILOSC_ZRYWALNOSC_O,
t1.DO7M_KWOTA,
t1.DO7M_KWOTA_ODNAWIALNOSC,
t1.DO7M_KWOTA_ODNAWIALNOSC_O,
t1.DO7M_KWOTA_ZRYWALNOSC,
t1.DO7M_KWOTA_ZRYWALNOSC_O,
t1.DO7R_ILOSC_ODNAWIALNOSC,
t1.DO7R_ILOSC_ODNAWIALNOSC_O,
t1.DO7R_ILOSC_ZRYWALNOSC,
t1.DO7R_ILOSC_ZRYWALNOSC_O,
t1.DO7R_KWOTA,
t1.DO7R_KWOTA_ODNAWIALNOSC,
t1.DO7R_KWOTA_ODNAWIALNOSC_O,
t1.DO7R_KWOTA_ZRYWALNOSC,
t1.DO7R_KWOTA_ZRYWALNOSC_O,
t1.DO8D_ILOSC_ODNAWIALNOSC,
t1.DO8D_ILOSC_ODNAWIALNOSC_O,
t1.DO8D_ILOSC_ZRYWALNOSC,
t1.DO8D_ILOSC_ZRYWALNOSC_O,
t1.DO8D_KWOTA,
t1.DO8D_KWOTA_ODNAWIALNOSC,
t1.DO8D_KWOTA_ODNAWIALNOSC_O,
t1.DO8D_KWOTA_ZRYWALNOSC,
t1.DO8D_KWOTA_ZRYWALNOSC_O,
t1.DO8M_ILOSC_ODNAWIALNOSC,
t1.DO8M_ILOSC_ODNAWIALNOSC_O,
t1.DO8M_ILOSC_ZRYWALNOSC,
t1.DO8M_ILOSC_ZRYWALNOSC_O,
t1.DO8M_KWOTA,
t1.DO8M_KWOTA_ODNAWIALNOSC,
t1.DO8M_KWOTA_ODNAWIALNOSC_O,
t1.DO8M_KWOTA_ZRYWALNOSC,
t1.DO8M_KWOTA_ZRYWALNOSC_O,
t1.DO9D_ILOSC_ODNAWIALNOSC,
t1.DO9D_ILOSC_ODNAWIALNOSC_O,
t1.DO9D_ILOSC_ZRYWALNOSC,
t1.DO9D_ILOSC_ZRYWALNOSC_O,
t1.DO9D_KWOTA,
t1.DO9D_KWOTA_ODNAWIALNOSC,
t1.DO9D_KWOTA_ODNAWIALNOSC_O,
t1.DO9D_KWOTA_ZRYWALNOSC,
t1.DO9D_KWOTA_ZRYWALNOSC_O,
t1.DO9M_ILOSC_ODNAWIALNOSC,
t1.DO9M_ILOSC_ODNAWIALNOSC_O,
t1.DO9M_ILOSC_ZRYWALNOSC,
t1.DO9M_ILOSC_ZRYWALNOSC_O,
t1.DO9M_KWOTA,
t1.DO9M_KWOTA_ODNAWIALNOSC,
t1.DO9M_KWOTA_ODNAWIALNOSC_O,
t1.DO9M_KWOTA_ZRYWALNOSC,
t1.DO9M_KWOTA_ZRYWALNOSC_O,
t1.KAPITAL_ZB,
t1.KLASYFIKACJA_ID,
t1.KLASYFIKACJA_ID1,
t1.KWOTA_UMOWY,
t1.PODZIAL_WALUTOWY,
t1.POW30R_ILOSC_ODNAWIALNOSC,
t1.POW30R_ILOSC_ODNAWIALNOSC_O,
t1.POW30R_ILOSC_ZRYWALNOSC,
t1.POW30R_ILOSC_ZRYWALNOSC_O,
t1.POW30R_KWOTA,
t1.POW30R_KWOTA_ODNAWIALNOSC,
t1.POW30R_KWOTA_ODNAWIALNOSC_O,
t1.POW30R_KWOTA_ZRYWALNOSC,
t1.POW30R_KWOTA_ZRYWALNOSC_O,
t1.RAZEM_ILOSC_ODNAWIALNOSC,
t1.RAZEM_ILOSC_ODNAWIALNOSC_O,
t1.RAZEM_ILOSC_ZRYWALNOSC,
t1.RAZEM_ILOSC_ZRYWALNOSC_O,
t1.RAZEM_KWOTA_ODNAWIALNOSC,
t1.RAZEM_KWOTA_ODNAWIALNOSC_O,
t1.RAZEM_KWOTA_ZRYWALNOSC,
t1.RAZEM_KWOTA_ZRYWALNOSC_O,
t1.STAN_DEPOZYTU,
t1.STATUS,
t1.TYP_STOPY,
t1.UMOWA_ID,
t1.WALUTA_ID,
t1.WARTOSC_UMOWY_ID
from wh.DEPOZYTY_WSKAZNIKI t1
where czas_id  = czas);

commit;
*/

/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.operacje 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.OPERACJE
(SELECT
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.ILOSC,
t1.JEDNOSTKA_ID,
t1.KONTO_WLASNE_ID,
t1.OPERACJA_ID,
t1.WALUTA_ID,
t1.WARTOSC
from wh.OPERACJE t1
where czas_id = czas);

commit;

execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.plynnosc
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.PLYNNOSC
(SELECT
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.DATA_KONCA_UMOWY,
t1.DATA_NAST_PRZESZAC,
t1.DO10D_MA,
t1.DO10D_WN,
t1.DO10M_MA,
t1.DO10M_WN,
t1.DO10R_MA,
t1.DO10R_WN,
t1.DO11D_MA,
t1.DO11D_WN,
t1.DO11M_MA,
t1.DO11M_WN,
t1.DO12D_MA,
t1.DO12D_WN,
t1.DO12M_MA,
t1.DO12M_WN,
t1.DO12R_MA,
t1.DO12R_WN,
t1.DO13D_MA,
t1.DO13D_WN,
t1.DO14D_MA,
t1.DO14D_WN,
t1.DO15D_MA,
t1.DO15D_WN,
t1.DO16D_MA,
t1.DO16D_WN,
t1.DO17D_MA,
t1.DO17D_WN,
t1.DO18D_MA,
t1.DO18D_WN,
t1.DO19D_MA,
t1.DO19D_WN,
t1.DO1D_MA,
t1.DO1D_WN,
t1.DO20D_MA,
t1.DO20D_WN,
t1.DO20R_MA,
t1.DO20R_WN,
t1.DO21D_MA,
t1.DO21D_WN,
t1.DO22D_MA,
t1.DO22D_WN,
t1.DO23D_MA,
t1.DO23D_WN,
t1.DO24D_MA,
t1.DO24D_WN,
t1.DO25D_MA,
t1.DO25D_WN,
t1.DO26D_MA,
t1.DO26D_WN,
t1.DO27D_MA,
t1.DO27D_WN,
t1.DO28D_MA,
t1.DO28D_WN,
t1.DO29D_MA,
t1.DO29D_WN,
t1.DO2D_MA,
t1.DO2D_WN,
t1.DO2M_MA,
t1.DO2M_WN,
t1.DO2R_MA,
t1.DO2R_WN,
t1.DO30D_MA,
t1.DO30D_WN,
t1.DO30R_MA,
t1.DO30R_WN,
t1.DO31D_MA,
t1.DO31D_WN,
t1.DO3D_MA,
t1.DO3D_WN,
t1.DO3M_MA,
t1.DO3M_WN,
t1.DO3R_MA,
t1.DO3R_WN,
t1.DO4D_MA,
t1.DO4D_WN,
t1.DO4M_MA,
t1.DO4M_WN,
t1.DO4R_MA,
t1.DO4R_WN,
t1.DO5D_MA,
t1.DO5D_WN,
t1.DO5M_MA,
t1.DO5M_WN,
t1.DO5R_MA,
t1.DO5R_WN,
t1.DO6D_MA,
t1.DO6D_WN,
t1.DO6M_MA,
t1.DO6M_WN,
t1.DO6R_MA,
t1.DO6R_WN,
t1.DO7D_MA,
t1.DO7D_WN,
t1.DO7M_MA,
t1.DO7M_WN,
t1.DO7R_MA,
t1.DO7R_WN,
t1.DO8D_MA,
t1.DO8D_WN,
t1.DO8M_MA,
t1.DO8M_WN,
t1.DO8R_MA,
t1.DO8R_WN,
t1.DO9D_MA,
t1.DO9D_WN,
t1.DO9M_MA,
t1.DO9M_WN,
t1.DO9R_MA,
t1.DO9R_WN,
t1.GRUPA_ID,
t1.JEDNOSTKA_ID,
t1.KLNT_ID,
t1.OKRES_ID,
t1.OKRES_ID1,
t1.POW30R_MA,
t1.POW30R_WN,
t1.PRODUKT_ID,
t1.STAN_NL,
t1.STAN_ZB,
t1.STATUS_UMOWY_ID,
t1.STOPA_BAZOWA_MA,
t1.STOPA_BAZOWA_WN,
t1.STOPA_MA_MNOZNIK,
t1.STOPA_MA_STALA,
t1.STOPA_MA_TYP,
t1.STOPA_RZECZYW_MA,
t1.STOPA_RZECZYW_WN,
t1.STOPA_WN_MNOZNIK,
t1.STOPA_WN_STALA,
t1.STOPA_WN_TYP,
t1.TAB_OPROC_ID,
t1.TAB_OPROC_ID1,
t1.TYP_PRZEPLYWU_ID,
t1.TYP_UMOWY_ID,
t1.UMOWA_ID,
t1.WALUTA_ID
from wh.PLYNNOSC t1
where czas_id = czas);

commit;
*/


/*
--pusta
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.pralnia 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.PRALNIA
(select 
t1.BENEFICIENT_UMOWA_ID,
t1.BENEFICJENT,
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.DATA_KSIEGOWANIA,
t1.DOK_PODTYP_ID,
t1.JEDNOSTKA_ID1,
t1.KWOTA,
t1.REMITTER,
t1.REMITTER_UMOWA_ID,
t1.KLNT_ID1,
t1.KLNT_ID,
t1.WALUTA_UMOWY_SYMB,
t1.NUMER_PACZKI,
t1.NR_UMOWY_NAD,
t1.REMITTER_UMOWA_PROD_ID,
t1.OPIS,
t1.NR_UMOWY_ODB,
t1.MODULO_PROD_ID,
t1.BENEFICIENT_UMOWA_PROD_ID
from wh.PRALNIA t1
where czas_id > 20190000);

commit;
*/

/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.przeplywy 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;
 
insert into wh.PRZEPLYWY
(select
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.UMOWA_ID,
t1.SYSTEM_ZRODLOWY,
t1.DATA,
t1.KWOTA,
t1.KWOTA_PLN,
t1.WALUTA_ID,
t1.RODZAJ_PRZEPLYWU_ID
from wh.PRZEPLYWY t1
where czas_id = czas);

commit;
*/

/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.rentownosc 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;
 
insert into wh.RENTOWNOSC
(select
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.DOCHODY_INNE,
t1.DOCHODY_ODSETKOWE,
t1.DOCHODY_PROWIZJI,
t1.DOCHODY_REZERWY,
t1.JEDNOSTKA_ID,
t1.KLNT_ID,
t1.KOSZTY_INNE,
t1.KOSZTY_ODSETKOWE,
t1.KOSZTY_REZERWY,
t1.MIES_SERD_ZB,
t1.MIES_SRED_NL,
t1.ODSETKI_WEW_NL,
t1.ODSETKI_WEW_ZB,
t1.OKRES_ID,
t1.PORTFEL,
t1.PRODUKT_ID,
t1.STAN_NL,
t1.STAN_NL_X_STOPA_NL,
t1.STAN_NL_X_STOPA_WEW_NL,
t1.STAN_ZB,
t1.STAN_ZB_X_STOPA_WEW_ZB,
t1.STAN_ZB_X_STOPA_ZB,
t1.STOPA_NL,
t1.STOPA_WEW_NL,
t1.STOPA_WEW_ZB,
t1.STOPA_ZB,
t1.SYSTEM,
t1.WALUTA_ID
from wh.RENTOWNOSC t1
where czas_id = czas);

commit;
*/
/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.ryzyko_stopy 
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.RYZYKO_STOPY
(select 
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.DATA_PRZESZAC,
t1.DO10D_MA,
t1.DO10D_WN,
t1.DO10M_MA,
t1.DO10M_WN,
t1.DO10R_MA,
t1.DO10R_WN,
t1.DO11D_MA,
t1.DO11D_WN,
t1.DO11M_MA,
t1.DO11M_WN,
t1.DO12D_MA,
t1.DO12D_WN,
t1.DO12M_MA,
t1.DO12M_WN,
t1.DO12R_MA,
t1.DO12R_WN,
t1.DO13D_MA,
t1.DO13D_WN,
t1.DO14D_MA,
t1.DO14D_WN,
t1.DO15D_MA,
t1.DO15D_WN,
t1.DO16D_MA,
t1.DO16D_WN,
t1.DO17D_MA,
t1.DO17D_WN,
t1.DO18D_MA,
t1.DO18D_WN,
t1.DO19D_MA,
t1.DO19D_WN,
t1.DO1D_MA,
t1.DO1D_WN,
t1.DO20D_MA,
t1.DO20D_WN,
t1.DO20R_MA,
t1.DO20R_WN,
t1.DO21D_MA,
t1.DO21D_WN,
t1.DO22D_MA,
t1.DO22D_WN,
t1.DO23D_MA,
t1.DO23D_WN,
t1.DO24D_MA,
t1.DO24D_WN,
t1.DO25D_MA,
t1.DO25D_WN,
t1.DO26D_MA,
t1.DO26D_WN,
t1.DO27D_MA,
t1.DO27D_WN,
t1.DO28D_MA,
t1.DO28D_WN,
t1.DO29D_MA,
t1.DO29D_WN,
t1.DO2D_MA,
t1.DO2D_WN,
t1.DO2M_MA,
t1.DO2M_WN,
t1.DO2R_MA,
t1.DO2R_WN,
t1.DO30D_MA,
t1.DO30D_WN,
t1.DO30R_MA,
t1.DO30R_WN,
t1.DO3D_MA,
t1.DO3D_WN,
t1.DO3M_MA,
t1.DO3M_WN,
t1.DO3R_MA,
t1.DO3R_WN,
t1.DO4D_MA,
t1.DO4D_WN,
t1.DO4M_MA,
t1.DO4M_WN,
t1.DO4R_MA,
t1.DO4R_WN,
t1.DO5D_MA,
t1.DO5D_WN,
t1.DO5M_MA,
t1.DO5M_WN,
t1.DO5R_MA,
t1.DO5R_WN,
t1.DO6D_MA,
t1.DO6D_WN,
t1.DO6M_MA,
t1.DO6M_WN,
t1.DO6R_MA,
t1.DO6R_WN,
t1.DO7D_MA,
t1.DO7D_WN,
t1.DO7M_MA,
t1.DO7M_WN,
t1.DO7R_MA,
t1.DO7R_WN,
t1.DO8D_MA,
t1.DO8D_WN,
t1.DO8M_MA,
t1.DO8M_WN,
t1.DO8R_MA,
t1.DO8R_WN,
t1.DO9D_MA,
t1.DO9D_WN,
t1.DO9M_MA,
t1.DO9M_WN,
t1.DO9R_MA,
t1.DO9R_WN,
t1.DURATION_LICZNIK_MA,
t1.DURATION_LICZNIK_WN,
t1.JEDNOSTKA_ID,
t1.KLNT_ID,
t1.NOSTRO_ID,
t1.NR_ALG_ID,
t1.POW30R_MA,
t1.POW30R_WN,
t1.PRODUKT_ID,
t1.RATY_WYMAGALNE,
t1.SALDO_MA,
t1.SALDO_WN,
t1.STATUS_UMOWY_ID,
t1.STOPA_TYP,
t1.SYSTEM,
t1.TAB_OPROC_ID,
t1.TYP_PODTYP_UMOWY_ID,
t1.TYP_PRZEPLYWU_ID,
t1.TYP_UMOWY_ID,
t1.UMOWA_ID,
t1.WALUTA_ID
from wh.RYZYKO_STOPY t1
where czas_id = czas);

commit;
*/
/*
--pusta
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.ryzyko_stopy_bpv
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.RYZYKO_STOPY_BPV
(select
t1.AKTYWA_1_PV,
t1.AKTYWA_MAPOWANE,
t1.AKTYWA_PV,
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.DATA_OKRESU,
t1.DCF_1_A,
t1.DCF_1_P,
t1.DCF_A,
t1.DCF_P,
t1.DELTA_PV_A,
t1.DELTA_PV_P,
t1.OKRES_PRZESZAC_KOD,
t1.OKRES_PRZESZAC_OPIS,
t1.PASYWA_1_PV,
t1.PASYWA_MAPOWANE,
t1.PASYWA_PV,
t1.RODZ_OPROC,
t1.STAWKA_REFER_A,
t1.STAWKA_REFER_P,
t1.TYP_PRZEPLYWU_ID,
t1.TYP_UMOWY_ID,
t1.WALUTA_ID,
t1.TYP_BILANSU_ID
from wh.RYZYKO_STOPY_BPV t1
where czas_id > 20190000);

commit;
*/

/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.syntetyka
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;
 
insert into wh.SYNTETYKA
(select
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.CZY_ZAB_HIP,
t1.DO10D_MA,
t1.DO10D_WN,
t1.DO10M_MA,
t1.DO10M_WN,
t1.DO10R_MA,
t1.DO10R_WN,
t1.DO11D_MA,
t1.DO11D_WN,
t1.DO11M_MA,
t1.DO11M_WN,
t1.DO12D_MA,
t1.DO12D_WN,
t1.DO12M_MA,
t1.DO12M_WN,
t1.DO13D_MA,
t1.DO13D_WN,
t1.DO14D_MA,
t1.DO14D_WN,
t1.DO1D_MA,
t1.DO1D_WN,
t1.DO1M_MA,
t1.DO1M_WN,
t1.DO20R_MA,
t1.DO20R_WN,
t1.DO21D_MA,
t1.DO21D_WN,
t1.DO2D_MA,
t1.DO2D_WN,
t1.DO2M_MA,
t1.DO2M_WN,
t1.DO2R_MA,
t1.DO2R_WN,
t1.DO3D_MA,
t1.DO3D_WN,
t1.DO3M_MA,
t1.DO3M_WN,
t1.DO3R_MA,
t1.DO3R_WN,
t1.DO4D_MA,
t1.DO4D_WN,
t1.DO4M_MA,
t1.DO4M_WN,
t1.DO4R_MA,
t1.DO4R_WN,
t1.DO5D_MA,
t1.DO5D_WN,
t1.DO5M_MA,
t1.DO5M_WN,
t1.DO5R_MA,
t1.DO5R_WN,
t1.DO6D_MA,
t1.DO6D_WN,
t1.DO6M_MA,
t1.DO6M_WN,
t1.DO7D_MA,
t1.DO7D_WN,
t1.DO7M_MA,
t1.DO7M_WN,
t1.DO7R_MA,
t1.DO7R_WN,
t1.DO8D_MA,
t1.DO8D_WN,
t1.DO8M_MA,
t1.DO8M_WN,
t1.DO9D_MA,
t1.DO9D_WN,
t1.DO9M_MA,
t1.DO9M_WN,
t1.GRUPA_ID,
t1.GRUPA_RYZYKA_MSR,
t1.ILOSC,
t1.INS_SRED,
t1.JEDNOSTKA_ID,
t1.KALKULACJA,
t1.KLASYFIKACJA_ID,
t1.KLNT_WIELK_FIRM_ID,
t1.KOD_ZABEZPIECZENIA,
t1.KONTO_ID,
t1.KRAJ_ID,
t1.KWOTA_HIP_I,
t1.KWOTA_HIP_K,
t1.KWOTA_HIP_M,
t1.KWOTA_ZM_REZ,
t1.LOKATA_ODNAW,
t1.OBROTY_MA,
t1.OBROTY_WN,
t1.OKRES_ID,
t1.OKRES_ID1,
t1.OKRES_PRZESZAC,
t1.PORTFEL,
t1.POW20R_MA,
t1.POW20R_WN,
t1.PRODUKT_ID,
t1.PRZEZN_ID,
t1.REJESTR_ID,
t1.REZYDENT_ID,
t1.RODZAJ_HIPOTEKI,
t1.RODZAJ_PORTFELA,
t1.RODZ_OPROC,
t1.ROK_NAL_ID,
t1.SALDO_MA,
t1.SALDO_MA_PLN,
t1.SALDO_MA_PRZYROST_KWARTAL,
t1.SALDO_MA_PRZYROST_MIES,
t1.SALDO_MA_PRZYROST_ROK,
t1.SALDO_MA_SREDNIA,
t1.SALDO_MA_SREDNIA_KWARTAL,
t1.SALDO_MA_SREDNIA_PLN,
t1.SALDO_MA_SREDNIA_ROK,
t1.SALDO_MA_XSTOPA,
t1.SALDO_WN,
t1.SALDO_WN_PLN,
t1.SALDO_WN_PRZYROST_KWARTAL,
t1.SALDO_WN_PRZYROST_MIES,
t1.SALDO_WN_PRZYROST_ROK,
t1.SALDO_WN_SREDNIA,
t1.SALDO_WN_SREDNIA_KWARTAL,
t1.SALDO_WN_SREDNIA_PLN,
t1.SALDO_WN_SREDNIA_ROK,
t1.SALDO_WN_XSTOPA,
t1.SYNTETYKA_ROWID,
t1.SYSTEM,
t1.WALUTA_ID,
t1.WALUTA_ID1,
t1.WALUTA_POPRZ_OKR,
t1.WYLACZENIE_BFG,
t1.ZABEZPIECZENIE_ID
from wh.SYNTETYKA t1
where czas_id = czas);



commit;
*/

/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.umowy_bank
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.UMOWY_BANK 
(select
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.DATA_ANULOWANIA,
t1.DATA_NAST_TRANSZA,
t1.DATA_TRANSAKCJI,
t1.DATA_WALUTY,
t1.DATA_WERYFIKACJI,
t1.DATA_WPROWADZENIA,
t1.DATA_WYMAGALNOSCI,
t1.DATA_WYM_OST_TRANSZY,
t1.DATA_ZAKSIEGOWANIA,
t1.DATA_ZAMKNIECIA_UMOWY,
t1.DATA_ZAPADALNOSCI,
t1.EKSPOZYCJA_BILANSOWA,
t1.EKSPOZYCJA_POZABILANSOWA,
t1.GRUPA_ID,
t1.JEDNOSTKA_BANKU_SYMBOL,
t1.KLNT_ID,
t1.KUP_SPRZED,
t1.KWOTA_UMOWY,
t1.MODULO,
t1.NOSTRO_ID,
t1.NOSTRO_ID1,
t1.NR_UMOWY,
t1.ODSETKI_NALICZONE_MA,
t1.ODSETKI_NALICZONE_WN,
t1.OKRES,
t1.PORTFEL_KOD,
t1.PRODUKT_ID,
t1.RODZAJ_UMOWY,
t1.STATUS,
t1.STATUS_UMOWY_ID,
t1.STOPA_POCZATKOWA,
t1.STOPA_PROCENTOWA,
t1.SYSTEM,
t1.TYP_PODTYP_UMOWY_ID,
t1.TYP_STOPY_OPIS,
t1.TYP_TRANSAKCJI_2,
t1.TYP_UMOWY_ID,
t1.UMOWA_ID,
t1.UMOWA_PROD_ID,
t1.WALUTA_ID,
t1.KAPITAL_NL,
t1.KAPITAL_ZB,
t1.LIMIT_DATA_KONCA,
t1.JEDNOSTKA_ID,
t1.WART_FUND_WL
from wh.UMOWY_BANK t1 
where czas_id = czas);

commit;
*/

/*
--pusta
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.umowy_konsorcjum
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;
 
insert into wh.UMOWY_KONSORCJUM
(select
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.UMOWA_ID,
t1.TYP_ZAPISU_KONS_ID,
t1.KLNT_ID,
t1.PROCENT_UDZIALU,
t1.KWOTA_UDZIALU
from wh.UMOWY_KONSORCJUM t1
where czas_id = czas);
);

commit;
*/

/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.umowy_tr
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.UMOWY_TR
(select
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.DATA_ANULOWANIA,
t1.DATA_TRANSAKCJI,
t1.DATA_WALUTY,
t1.DATA_WERYFIKACJI,
t1.DATA_WPROWADZENIA,
t1.DATA_ZAKSIEGOWANIA,
t1.DATA_ZAMKNIECIA_UMOWY,
t1.DATA_ZAPADALNOSCI,
t1.GRUPA_ID,
t1.KLIENT_NAZWA_NOSTRO,
t1.KLNT_ID,
t1.KRAJ_KOD_NOSTRO,
t1.KUP_SPRZED,
t1.MODULO,
t1.NOMINAL,
t1.NOMINAL_1,
t1.NOSTRO_ID,
t1.NOSTRO_ID1,
t1.NUMER_UMOWY,
t1.ODSETKI_NALICZONE,
t1.OKRES,
t1.OKRES_ID,
t1.PORTFEL_KOD,
t1.PRODUKT_ID,
t1.PRZEZNACZENIE,
t1.RODZAJ_UMOWY,
t1.SALDO_NOSTRO,
t1.STATUS,
t1.STATUS_UMOWY_ID,
t1.STOPA_POCZATKOWA,
t1.STOPA_PROCENTOWA,
t1.SYSTEM,
t1.TYP_PODTYP_UMOWY_ID,
t1.TYP_STOPY_OPIS,
t1.TYP_TRANSAKCJI_2,
t1.TYP_UMOWY_ID,
t1.UMOWA_ID,
t1.UMOWA_PROD_ID,
t1.WALUTA_ID,
t1.WALUTA_ID1,
t1.WALUTA_NOSTRO,
t1.TYP_STOPY_OPIS_2,
t1.TYP_RYNKU,
t1.STOPA_PROCENTOWA_2,
t1.KWOTA_KUPIONA_FRWD,
t1.KURS_REFERENCYJNY_FRA,
t1.KUPON_KWOTA,
t1.KUPON_DATA_PIERWSZY,
t1.ILOSC1,
t1.DATA_USTALENIA_KURSU,
t1.BLOKADA_RODZAJ,
t1.BAZA_ODS_OPIS_2,
t1.BAZA_ODS_KOD_2,
t1.BANK_POSREDNIK_SWIFT,
t1.WYMIANA_KAP_SYMBOL,
t1.TYP_CENY,
t1.STOPA_SPOT,
t1.STOPA_FRWD,
t1.RENTOWNOSC,
t1.PROWIZJA,
t1.OKRES_FRA,
t1.NOMINAL_2,
t1.KWOTA_SPRZEDANA_FRWD,
t1.KURS_SPOT,
t1.KURS_FRWD,
t1.KUPON_KWOTA_2,
t1.KUPON_DATA_PIERWSZY_2,
t1.ILOSC_SPRZEDANA,
t1.DEPOZYTARIUSZ_ID,
t1.CENA_100,
t1.BLOKADA_NAZWA,
t1.BAZA_ODS_OPIS,
t1.BAZA_ODS_KOD,
t1.WART_BILANSOWA,
t1.LIMIT_OKRES_KOD,
t1.REJ_DYSK_PREMIA_NALICZ,
t1.REJ_DYSK_PREMIA_NALICZ_ROWN,
t1.REJ_DYSK_PREMIA_NALICZ_RU,
t1.REJ_DYSK_PREMIA_NALICZ_ROWN_RU,
t1.REJ_DOCHODY,
t1.REJ_DOCHODY_ROWN,
t1.REJ_KOSZTY,
t1.REJ_KOSZTY_ROWN,
t1.BFG_TYP_PRODUKTU_SYMBOL,
t1.BFG_TYP_WIERZYTELNOSCI_SYMBOL,
t1.ODSETKI_MA_NALICZ,
t1.PLC
from wh.UMOWY_TR t1
where czas_id = czas
);

commit;
*/

/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.umowy_wskazniki
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.UMOWY_WSKAZNIKI
(select
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.GRUPA_ID,
t1.KLASYFIKACJA_ID,
t1.ODCH_GRUPA,
t1.ODCH_GRUPA_KLIENT,
t1.ODCH_STAND,
t1.ODCH_STAND_KLIENT,
t1.ODCH_TYP_UMOWY,
t1.ODCH_TYP_UMOWY_KLIENT,
t1.ODNAWIALNOSC,
t1.STAN_MAKS,
t1.STAN_MIN,
t1.STAN_SREDNI,
t1.TYP_UMOWY_ID,
t1.ZRYWALNOSC,
t1.ODNAWIALNOSC_RODZAJ,
t1.ZRYWALNOSC_RODZAJ,
t1.STAN_MAKS_GRUPA_RODZAJ,
t1.STAN_MIN_GRUPA_RODZAJ,
t1.STAN_SREDNI_GRUPA_RODZAJ,
t1.STAN_MAKS_GRUPA_KLNT,
t1.STAN_MIN_GRUPA_KLNT,
t1.STAN_SREDNI_GRUPA_KLNT,
t1.STAN_MAKS_GRUPA,
t1.STAN_MIN_GRUPA,
t1.STAN_SREDNI_GRUPA,
t1.STAN_MAKS_RODZAJ_KLNT,
t1.STAN_MIN_RODZAJ_KLNT,
t1.STAN_SREDNI_RODZAJ_KLNT,
t1.STAN_MAKS_RODZAJ,
t1.STAN_MIN_RODZAJ,
t1.STAN_SREDNI_RODZAJ
from wh.UMOWY_WSKAZNIKI t1
where czas_id = czas
);

commit;
*/


/*
execute immediate 'select czas_id from (
 select czas_id, count(*) from wh.umowy_zabezpieczenia
 where czas_id > 20190000 
 group by czas_id order by count(*) desc FETCH  first 1 rows only )' into czas;

insert into wh.UMOWY_ZABEZPIECZENIA
(select 
to_char(iii.tmpdate, 'YYYYMMDD'),
t1.CZY_HIP_PIERW,
t1.DATA_DOSTARCZENIA,
t1.DATA_WYSTAWIENIA,
t1.DATA_ZWOLNIENIA,
t1.GRUPA_ID,
t1.JEDNOSTKA_ID,
t1.KAPITAL_NL,
t1.KAPITAL_WYMAGALNY,
t1.KLNT_ID,
t1.KWOTA_ZM_REZ_UR,
t1.ODSETKI_KARNE,
t1.ODSETKI_NL,
t1.ODSETKI_WYMAGALNE,
t1.PRODUKT_ID,
t1.REZERWA,
t1.STATUS,
t1.STATUS_UMOWY,
t1.TERMIN_KONCOWY,
t1.TYP_UMOWY_ID,
t1.UMOWA_ID,
t1.WALUTA_ID,
t1.WALUTA_ID1,
t1.WALUTA_ID2,
t1.WALUTA_ID3,
t1.WALUTA_ID4,
t1.WARTOSC,
t1.WARTOSC_BHIP,
t1.WARTOSC_POCZATKOWA,
t1.WART_ZM_PODST_REZ,
t1.ZABEZPIECZENIE_ID,
t1.WART_KSIEGOWA_MSR,
t1.WART_KSIEGOWA_MSR_WALUTA_ID,
t1.DATA_ZALEGLOSCI,
t1.UMOWA_ZABEZP_PROD_ID,
t1.WART_ZM_PODST_REZ_UR,
t1.HIP_LACZ_PROD_ID,
t1.CZY_AUTOM_PRZELICZ_AKT_WRT_ZAB,
t1.PROC_KAPIT_DO_WYL_AKT_WRT_ZAB
from wh.UMOWY_ZABEZPIECZENIA t1
where czas_id = czas
);

commit;
*/


-------- wh_ods


execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.analityka_hist
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.ANALITYKA_HIST
(select
t1.ANALITYKA_ID,
t1.OBROTY_WN,
t1.OBROTY_MA,
t1.WALUTA_ID,
t1.KSIEGA_ID,
t1.JEDNOSTKA_ID,
t1.KONTO_ID,
iii.tmpdate,
t1.SALDO_WN,
t1.SALDO_MA,
t1.UMOWA_ID,
t1.REJESTR_ID,
t1.ZABEZPIECZENIE_ID,
t1.KLIENT_ID,
t1.DATA_USUNIECIA,
t1.WLASCICIEL_KLIENT_ID,
t1.WALUTA_PROD_ID,
t1.SUFFIX1,
t1.KWOTA_ZM_REZ,
t1.KWOTA_HIP_K,
t1.KSIEGA_PROD_ID,
t1.KONTO_PROD_ID,
t1.KONTO,
t1.JEDN_BANKU_PROD_ID,
t1.GRUPA_RYZYKA_MSR,
t1.DATA_AKTUALIZACJI,
t1.ANALITYKA_PROD_ID,
t1.WALUTA_SYMBOL,
t1.SUFFIX2,
t1.RODZAJ_HIPOTEKI,
t1.MODULO,
t1.KWOTA_HIP_M,
t1.KWOTA_HIP_I,
t1.KSIEGA_OPIS,
t1.KOD_ZABEZPIECZENIA,
t1.KALKULACJA,
t1.DATA_ZAMKNIECIA,
t1.CZY_ZAB_HIP,
t1.OBROTY_MA_DATA_WALUTY,
t1.OBROTY_WN_DATA_WALUTY
from wh_ods.ANALITYKA_HIST t1
where data_danych = data_d
);

commit;





execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.analityka_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;
 
insert into wh_ods.ANALITYKA_KM
(select
t1.ANALITYKA_PROD_ID,
t1.MODULO,
t1.KONTO,
t1.SUFFIX1,
t1.SUFFIX2,
t1.OBROTY_WN,
t1.OBROTY_MA,
t1.WALUTA_PROD_ID,
t1.WALUTA_SYMBOL,
t1.KSIEGA_PROD_ID,
t1.KSIEGA_OPIS,
t1.JEDN_BANKU_PROD_ID,
t1.KONTO_PROD_ID,
t1.DATA_AKTUALIZACJI,
t1.ANALITYKA_ID,
t1.WALUTA_ID,
t1.KONTO_ID,
t1.JEDNOSTKA_ID,
t1.SALDO_WN,
t1.SALDO_MA,
t1.KLIENT_ID,
t1.UMOWA_ID,
t1.REJESTR_ID,
t1.ZABEZPIECZENIE_ID,
iii.tmpdate,
t1.OBROTY_WN_BK,
t1.OBROTY_MA_BK,
t1.KWOTA_ZM_REZ,
t1.DATA_USUNIECIA,
t1.KWOTA_HIP_M,
t1.KWOTA_HIP_K,
t1.KWOTA_HIP_I,
t1.RODZAJ_HIPOTEKI,
t1.CZY_ZAB_HIP,
t1.KOD_ZABEZPIECZENIA,
t1.KALKULACJA,
t1.GRUPA_RYZYKA_MSR,
t1.WYLACZENIE_BFG,
t1.WLASCICIEL_KLIENT_ID,
t1.DATA_ZAMKNIECIA,
t1.WSP_ZAB_HIP,
t1.ANALITYKA_IF1,
t1.ZABEZP_WART_NOM
from wh_ods.ANALITYKA_KM t1
where data_danych = data_d
);

commit;



execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.analityka_mr
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.ANALITYKA_MR
(select
t1.DO1D_MA,
t1.DO1D_WN,
t1.DO2D_MA,
t1.DO2D_WN,
t1.DO3D_MA,
t1.DO3D_WN,
t1.DO4D_MA,
t1.DO4D_WN,
t1.DO5D_MA,
t1.DO5D_WN,
t1.DO6D_MA,
t1.DO6D_WN,
t1.DO7D_MA,
t1.DO7D_WN,
t1.DO8D_MA,
t1.DO8D_WN,
t1.DO9D_MA,
t1.DO9D_WN,
t1.DO10D_MA,
t1.DO10D_WN,
t1.DO11D_MA,
t1.DO11D_WN,
t1.DO12D_MA,
t1.DO12D_WN,
t1.DO13D_MA,
t1.DO13D_WN,
t1.DO14D_MA,
t1.DO14D_WN,
t1.DO21D_MA,
t1.DO21D_WN,
t1.DO1M_MA,
t1.DO1M_WN,
t1.DO2M_MA,
t1.DO2M_WN,
t1.DO3M_MA,
t1.DO3M_WN,
t1.DO4M_MA,
t1.DO4M_WN,
t1.DO5M_MA,
t1.DO5M_WN,
t1.DO6M_MA,
t1.DO6M_WN,
t1.DO7M_MA,
t1.DO7M_WN,
t1.DO8M_MA,
t1.DO8M_WN,
t1.DO9M_MA,
t1.DO9M_WN,
t1.DO10M_MA,
t1.DO10M_WN,
t1.DO11M_MA,
t1.DO11M_WN,
t1.DO12M_MA,
t1.DO12M_WN,
t1.DO2R_MA,
t1.DO2R_WN,
t1.DO3R_MA,
t1.DO3R_WN,
t1.DO4R_MA,
t1.DO4R_WN,
t1.DO5R_MA,
t1.DO5R_WN,
t1.DO7R_MA,
t1.DO7R_WN,
t1.DO10R_MA,
t1.DO10R_WN,
t1.DO20R_MA,
t1.DO20R_WN,
t1.POW20R_MA,
t1.POW20R_WN,
t1.SALDO_MA,
t1.SALDO_WN,
t1.OBROTY_WN,
t1.OBROTY_MA,
t1.KWOTA_ZM_REZ,
t1.KWOTA_ZAB_HIP,
t1.ILOSC,
t1.SALDO_WN_XSTOPA,
t1.SALDO_MA_XSTOPA,
t1.SALDO_WN_SREDNIA,
t1.SALDO_MA_SREDNIA,
iii.tmpdate,
t1.ID_JEDNOSTKI,
t1.KONTO_SYMBOL,
t1.TYP_KLIENTA_SYMBOL,
t1.REZYDENT_SYMBOL,
t1.GRUPA_KRAJOW_SYMBOL,
t1.KRAJ_KLIENTA_SYMBOL,
t1.KRAJ_UGIW_SYMBOL,
t1.WALUTA_SYMBOL,
t1.LOKATA_ODNAW_SYMBOL,
t1.CZY_ZAB_HIP_SYMBOL,
t1.OKRES_PRZETERM_SYMBOL,
t1.GRUPA_RYZYKA_SYMBOL,
t1.KOD_ZABEZPIECZENIA_SYMBOL,
t1.OKRES_PIERWOTNY_SYMBOL,
t1.PORTFEL_SYMBOL,
t1.PRZEZN_KRED_SYMBOL,
t1.RODZAJ_HIPOTEKI_SYMBOL,
t1.ROK_STARTU_SYMBOL,
t1.KOD_PRODUKTU_SYMBOL,
t1.REJESTR_SYMBOL,
t1.RODZ_OPROC_SYMBOL,
t1.OKRES_PRZESZAC_SYBOL,
t1.SYSTEM,
t1.RODZAJ_PORTFELA,
t1.WALUTA_UMOWY,
t1.KLNT_WIELK_FIRM,
t1.CZY_WIELK_FIRMY_WG_COREP,
t1.KAT_WIELK_FIRMY_WG_FINREP,
t1.KONTO_NAZWA,
t1.SALDO_WN_PLN,
t1.SALDO_MA_PLN,
t1.SALDO_WN_SREDNIA_PLN,
t1.SALDO_MA_SREDNIA_PLN,
t1.REZYDENT_NAZWA,
t1.JEDNOSTKA_NAZWA,
t1.TYP_KLIENTA_OPIS,
t1.KALKULACJA,
t1.GRUPA_RYZYKA_MSR,
t1.WALUTA_POPRZ_OKR,
t1.SALDO_WN_SREDNIA_ROK,
t1.SALDO_WN_SREDNIA_KWARTAL,
t1.SALDO_MA_SREDNIA_ROK,
t1.SALDO_MA_SREDNIA_KWARTAL,
t1.SALDO_WN_PRZYROST_ROK,
t1.SALDO_WN_PRZYROST_KWARTAL,
t1.SALDO_WN_PRZYROST_MIES,
t1.SALDO_MA_PRZYROST_ROK,
t1.SALDO_MA_PRZYROST_KWARTAL,
t1.SALDO_MA_PRZYROST_MIES,
t1.UMOWA_ID,
t1.ANALITYKA_ID,
t1.NR_BANKU,
t1.WSP_ZAB_HIP,
t1.MODULO,
t1.KOD_ZABEZPIECZENIA_WG_MINFIN,
t1.NAZWA_BANKU,
t1.CZY_RESTRUKTURYZACJA,
t1.SALDO_WN_RU,
t1.SALDO_MA_RU,
t1.KALKULACJA_RU,
t1.SUFFIX1,
t1.SUFFIX2,
t1.NOGA_TRANSAKCJI,
t1.GRUPA_ID,
t1.KLASYFIKACJA_ID,
t1.WIELKOSC_FIRM_ID,
t1.KRAJ_ID,
t1.OKRES_ID,
t1.OKRES_ID1,
t1.PRODUKT_ID,
t1.PRZEZN_ID,
t1.REZYDENT_ID,
t1.ROK_NAL_ID,
t1.WALUTA_ID1,
t1.WYLACZENIE_BFG,
t1.KONTO_ID,
t1.WALUTA_ID,
t1.KWOTA_HIP_I,
t1.KWOTA_HIP_K,
t1.KWOTA_HIP_M,
t1.ZABEZPIECZENIE_ID,
t1.REJESTR_ID,
t1.ZABEZP_KOD_DEF,
t1.KLIENT_ID,
t1.POWYZEJ_LIMITU,
t1.UTRATA_WARTOSCI,
t1.KWOTA_ODZYSKU_Z_ZAB,
t1.ZOBOW_OBJ_REZ,
t1.KOD_PKD,
t1.TYP_TRANSAKCJI2_SYMBOL,
t1.CZY_DOSTEP_PRZEZ_INT,
t1.TABELA_OPROC_OPIS,
t1.KK_OPROCENTOWANA,
t1.WALUTA_BAZOWA,
t1.ZABEZP_WART_NOM,
t1.CZY_KREDYT_SPLACANY_Z_PROJ,
t1.SALDO_WN_PLN_POPRZ_MIES,
t1.SALDO_MA_PLN_POPRZ_MIES,
t1.ZAB_PLYNNE_WART_PLN,
t1.ZAB_HIPOT_WART_PLN,
t1.ZAB_POZOST_WART_PLN
from wh_ods.ANALITYKA_MR t1
where data_danych = data_d
);

commit;



execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.syntetyka_def3000_hist
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;
  
  
insert into wh_ods.SYNTETYKA_DEF3000_HIST
(select 
t1.SYNTETYKA_DEF3000_PROD_ID,
t1.KONTO_PROD_ID,
t1.OBROTY_MA,
t1.OBROTY_WN,
t1.OBROTY_MA_DATA_WAL,
t1.OBROTY_WN_DATA_WAL,
t1.SALDO_WN,
t1.SALDO_WN_DATA_WAL,
t1.SALDO_WN_BO_DNIA,
t1.SALDO_WN_BO_MIESIACA,
t1.SALDO_WN_BO_ROKU,
t1.SALDO_WN_BO_ROKU_BRUTTO,
t1.OBROTY_MA_BO_DNIA,
t1.OBROTY_MA_BO_MIESIACA,
t1.OBROTY_MA_BO_ROKU,
t1.OBROTY_MA_BO_ROKU_BRUTTO,
t1.OBROTY_WN_BO_DNIA,
t1.OBROTY_WN_BO_MIESIACA,
t1.OBROTY_WN_BO_ROKU,
t1.OBROTY_WN_BO_ROKU_BRUTTO,
t1.WALUTA_PROD_ID,
t1.WALUTA_SYMBOL,
t1.JEDNOSTKA_PROD_ID,
t1.KSIEGA_GLOWNA_PROD_ID,
t1.KSIEGA_GLOWNA_NAZWA,
t1.DATA_STANU,
iii.tmpdate,
t1.KONTO_ID,
t1.WALUTA_ID,
t1.JEDNOSTKA_ID,
t1.SALDO_MA,
t1.DATA_USUNIECIA
from wh_ods.SYNTETYKA_DEF3000_HIST t1
where data_danych = data_d
);

commit;



/*
--pusta
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.um_harm_pozycje_transze_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.UM_HARM_POZYCJE_TRANSZE_KM
(select 
t1.UM_HARM_POZ_TRANSZA_PROD_ID,
t1.UM_HARM_POZ_TRANSZA_ID,
t1.UMOWA_PROD_ID,
t1.UMOWA_ID,
t1.DATA_AUTOM_WYPL,
t1.NRB_ODBIORCY,
t1.ODBIORCA,
t1.TYTUL,
t1.STATUS,
t1.ID_WPISUJACEGO,
t1.ID_AKCEPTUJACEGO,
t1.ID_MODYFIKUJACEGO,
t1.DATA_AKTUALIZACJI,
iii.tmpdate
from wh_ods.UM_HARM_POZYCJE_TRANSZE_KM
where data_danych = data_d
);

commit;
*/


 execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_harmonogramy_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;
  
  
insert into wh_ods.UMOWY_HARMONOGRAMY_KM
(select 
t1.KWOTA,
t1.BALON,
t1.BLOKADA_KAPITALU,
t1.BLOKADA_PRZESZAC,
t1.BLOKADA_ODS,
t1.KAPITAL_SPLACONY,
t1.KAPITAL_SPLACONE_RATY,
t1.STALA,
t1.STALA_WN_ALG,
t1.DATA_PRZELICZ,
t1.PRZESZAC_DZIEN,
t1.PRZESZAC_DZIEN_OST,
t1.PRZESZAC_OKRES,
t1.PRZESZAC_OKES_ILOSC,
t1.DATA_DOST_TRANSZ,
t1.DATA_PIERW_WPLATY,
t1.DATA_START,
t1.DZIEN_DOST_HARM,
t1.LICZNIK,
t1.LICZN_MIANOWNIK,
t1.MNOZ_TAB,
t1.MNOZ_WN_ALG,
t1.ANEKS_PROD_ID,
t1.UMOWA_PROD_ID,
t1.WALUTA_PROD_ID,
t1.WALUTA,
t1.WNIOSEK_PROD_ID,
t1.HARM_PROD_ID,
t1.HARM_POPRZ_PROD_ID,
t1.PRODUKT_PROD_ID,
t1.ODSETKI_SPLACONE,
t1.ODSETKI_SPLAC_REJESTR,
t1.WARIANT_OBLICZ,
t1.ODS_DATA_PIERW,
t1.ODS_WN_ALG,
t1.ODS_WN_ALG_TAB,
t1.ODS_OKRES,
t1.ODS_OKRES_ILOSC,
t1.ODS_IL_SPLAC_RAT,
t1.ODS_IL_RAT,
t1.ODS_TABELA,
t1.ODS_TAB_DZIEN,
t1.MIANOWNIK,
t1.KOLEJNOSC_SPLAT,
t1.HARM_STATUS,
t1.OKRES,
t1.OKRES_ILOSC,
t1.KWOTA_POPRZ_KAP,
t1.IL_POPRZ_RAT_KAP,
t1.KWOTA_POPRZ_ODS,
t1.KWOTA_POPRZ_ODS_REJESTR,
t1.IL_POPRZ_RAT_ODS,
t1.ILOSC_RAT,
t1.STOPA,
t1.DATA_STOPY,
t1.STOPA_AMORTYZACJI,
t1.STATUS,
t1.OBOWIAZUJACY,
t1.NAZWA_WARIANTU,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.HARM_ID,
t1.DO_REALIZACJI,
iii.tmpdate,
t1.DATA_USUNIECIA,
t1.WARIANT_OBLICZ_ID
from wh_ods.UMOWY_HARMONOGRAMY_KM t1
where data_danych = data_d
);

commit;  



execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_harm_pozycje_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.UMOWY_HARM_POZYCJE_KM
(select 
t1.KWOTA,
t1.KWOTA_REJESTR,
t1.DATA_DOST,
t1.KURS_WALUTY,
t1.UMOWA_PROD_ID,
t1.DOKUMENT_PROD_ID,
t1.HARM_PROD_ID,
t1.HARM_POZ_PROD_ID,
t1.HARM_POZ_POPRZ_PROD_ID,
t1.CZY_ZALEGLOSC,
t1.DATA,
t1.TYP,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.HARM_ID,
iii.tmpdate,
t1.ROZLICZONA,
t1.NR_RATY,
t1.DATA_USUNIECIA,
t1.TYP_RATY_TECHNICZNEJ,
t1.UM_HARM_POZ_TRANSZA_ID,
t1.UM_HARM_POZ_TRANSZA_PROD_ID,
t1.KWOTA_WAL_BAZOWA
from wh_ods.UMOWY_HARM_POZYCJE_KM t1
where data_danych = data_d
);

commit;



execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.UMOWY_KM
(select 
t1.KWOTA_UMOWY,
t1.DEP_KWOTA_DOPLATY,
t1.DATA_WALUTY,
t1.DATA_NAST_KAPIT_WN,
t1.DATA_OST_KAPIT_WN,
t1.DATA_NAST_KAPIT_MA,
t1.DATA_OST_KAPIT_MA,
t1.DATA_ZAMKNIECIA,
t1.DATA_POBR_PROW_KANAL,
t1.DATA_POBR_PROW_RACH,
t1.DATA_POBR_PROW_LIMIT,
t1.STOPA_MA_STALA,
t1.STOPA_MA_STALA_PROGRES,
t1.STOPA_WN_STALA,
t1.STOPA_WN_STALA_ALG,
t1.ZLEC_STALE_DATA,
t1.UMOWA_KOMENTARZ,
t1.UMOWA_MANAGER_ID_ROLE,
t1.NUMER_UMOWY,
t1.PODTYP_UMOWY,
t1.TYP_UMOWY,
t1.ADRES_KORESP,
t1.ADRES_KORESP_KRAJ,
t1.ADRES_KORESP_KOD_POCZT,
t1.ADRES_KORESP_MIEJSC,
t1.DATA_KONCA_DOST_TRANSZ,
t1.KR_DENOM_DATA_KURSU,
t1.DATA_NAST_SPLATY,
t1.DEP_DATA_OST_DOPIS,
t1.DEP_DATA_NAST_DOPIS,
t1.DEP_DATA_OST_DOSTEP,
t1.DEP_DATA_PIERW_WPLYWU,
t1.DEP_ID_DOC_PIERW_WPLATY,
t1.DEP_DATA_OST_WPLATY,
t1.DEP_DATA_NAST_WPLATY,
t1.DEP_SPOSOB_WPLATY,
t1.DEP_ID_UMOWY_ODSETKI,
t1.DEP_ILOSC_PROLONGAT,
t1.UMOWA_PRZEZN_KRED_OPIS,
t1.DATA_KONCA_UMOWY,
t1.DATA_KONCA_UMOWY_PLAN,
t1.STOPA_MA_MNOZNIK,
t1.STOPA_MA_MNOZNIK_PROGRES,
t1.STOPA_WN_MNOZNIK,
t1.STOPA_WN_MNOZNIK_ALG,
t1.PROW_PIERW_WPLATA,
t1.FKT_PROW_NAL_PRZYG,
t1.FKT_PROW_POBR_PRZYG,
t1.FKT_ID_UMOWY_TRANSFER,
t1.MODULO_PROD_ID,
t1.ANEKS_PROD_ID,
t1.JEDNOSTKA_PROD_ID,
t1.UMOWA_PROD_ID,
t1.WALUTA_PROD_ID,
t1.RZEZN_KRED_PROD_ID,
t1.WNIOSEK_PROD_ID,
t1.PRODUKT_PROD_ID,
t1.STOPA_MA_NR_ALG,
t1.STOPA_MA_TAB_ALG,
t1.STOPA_MA_TAB,
t1.STOPA_MA_TYP,
t1.STOPA_WN_NR_ALG,
t1.STOPA_WN_TAB_ALG,
t1.STOPA_WN_TAB,
t1.STOPA_WN_TYP,
t1.STOPA_DATA_UMOWY,
t1.STOPA_RZECZYW_MA,
t1.STOPA_RZECZYW_WN,
t1.STOPA_RZECZYW_KARNA,
t1.CZY_BLOKADA_PRZESZAC_OPROC,
t1.CZY_ZWOLN_PODAT,
t1.MIANOWNIK,
t1.DATA_ZALEGLOSCI,
t1.OKRES_JEDN,
t1.NUMER_REFERENCYJNY,
t1.DATA_REJESTRACJI_UMOWY,
t1.TYP_NAST_SPLATY,
t1.DATA_NAST_PRZESZAC,
t1.DATA_OST_PRZESZAC,
t1.POZIOM_DOSTEPU,
t1.GRUPA_RYZYKA,
t1.DATA_STARTU,
t1.DATA_STANU,
t1.STATUS,
t1.OKRES_ILOSC,
t1.CZY_PROW_ZAPL,
t1.KLIENT_PROD_ID_REJESTR,
t1.TIMESTAMP_REJESTR,
t1.KLIENT_PROD_ID_ZMIANY,
t1.TIMESTAMP_ZMIANY,
t1.KLIENT_PROD_ID_AKCEPT,
t1.TIMESTAMP_AKCEPT,
t1.CZY_OPROC_NEGOC,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.WALUTA_UMOWY,
t1.KLIENT_ID,
t1.PRODUKT_ID,
t1.JEDNOSTKA_ID,
t1.PRZEZN_ID,
t1.OKRES_PIERW_ID,
t1.OKRES_ZALEGL_ID,
t1.GRUPA_RYZYKA_ID,
t1.ROK_NALEZN_ID,
iii.tmpdate,
t1.CZY_DEPOZYT_ODNAWIALNY,
t1.ILOSC_WYCIAGOW,
t1.ILOSC_MONITOW,
t1.DO_WINDYKACJI,
t1.DATA_WINDYKACJI,
t1.DATA_START_PIERW,
t1.KAPITAL_NL,
t1.KAPITAL_ZB,
t1.DATA_ZAMKNIECIA_UMOWY,
t1.DATA_UMORZENIA,
t1.DATA_PROBLEMATYCZNY,
t1.LIMIT_DATA_POCZ,
t1.DATA_ODZYSKANIA,
t1.DATA_INF_KL_PRZETW_BEZ_ZGODY,
t1.CZY_WYSYLAC_UM_DO_BIK,
t1.DATA_KAP_WYMAGALNY,
t1.DATA_NAST_RATA_KAP,
t1.DATA_NAST_RATA_ODS,
t1.DATA_ODS_WYMAGALNE,
t1.DATA_OST_RATA_KAP,
t1.DATA_OST_RATA_ODS,
t1.DOCHODY_INNE,
t1.DOCHODY_ODSETKOWE,
t1.DOCHODY_PROWIZJI,
t1.DOCHODY_REZERWY,
t1.DOCHODY_REZERWY_KUP,
t1.DOCHODY_REZERWY_NKUP,
t1.KAPITAL_POZABILANSOWY,
t1.KAPITAL_WYMAGALNY,
t1.KWOTA_NAST_RATA_KAP,
t1.KWOTA_NAST_RATA_ODS,
t1.KWOTA_OST_RATA_KAP,
t1.KWOTA_OST_RATA_ODS,
t1.NADPLATA,
t1.OB_KRED_WART_RYNKOWA,
t1.ODSETKI_KARNE,
t1.ODSETKI_NL,
t1.ODSETKI_WEW_NL,
t1.ODSETKI_WEW_ZB,
t1.ODSETKI_WYMAGALNE,
t1.ODSETKI_ZB,
t1.PROWIZJE_KREDYT,
t1.PROWIZJE_RB,
t1.RATY_OKRES_DNI,
t1.RATY_OKRES_WARTOSC,
t1.REZERWA,
t1.REZERWA_KUP,
t1.REZERWA_NKUP,
t1.REZERWA_RB,
t1.REZERWA_RB_KUP,
t1.REZERWA_RB_NKUP,
t1.REZERWA_RU,
t1.REZERWA_RU_KUP,
t1.REZERWA_RU_NKUP,
t1.STOPA_WEW_NL,
t1.STOPA_WEW_ZB,
t1.UPRAWDOPODOBNIENIE,
t1.WSPOLKREDYTOB_ILOSC,
t1.KOSZTY_INNE,
t1.KOSZTY_ODSETKOWE,
t1.KOSZTY_REZERWY,
t1.KOSZTY_REZERWY_KUP,
t1.KOSZTY_REZERWY_NKUP,
t1.IL_RAT_KAP_WYM,
t1.IL_RAT_ODS_WYM,
t1.NR_RATY_KAP_WYM,
t1.NR_RATY_ODS_WYM,
t1.PROWIZJE_ZALEGLE,
t1.KOSZTY_WINDYKACJI,
t1.ADM_KLIENT_ID,
t1.DATA_OST_PLATN_Z_HARM,
t1.DEAL_BANK_CZL_ID,
t1.DEAL_BANK_CZL_PROD_ID,
t1.DEAL_BANK_ID,
t1.DEAL_BANK_PROD_ID,
t1.KAPITAL_ZAL_180D,
t1.KAPITAL_ZAL_30D,
t1.KAPITAL_ZAL_60D,
t1.KAPITAL_ZAL_90D,
t1.KRED_OKRES_HARM,
t1.LIMIT_DATA_KONCA,
t1.LIMIT_WARTOSC,
t1.PORTFEL,
t1.PROWIZJE_KARTY,
t1.PROWIZJE_KARTY_OPER,
t1.DOCHODY_ZASTRZ,
t1.ODSETKI_SPL_PLN,
t1.KWOTA_TR_WYPL,
t1.OB_KR_MODEL,
t1.OB_KR_SEGMENT,
t1.PROD_WLASNY,
t1.DATA_OST_SPLATY,
t1.KURS_OST_SPLATY,
t1.KWOTA_OST_SPLATY_ODS_K,
t1.KWOTA_OST_SPLATY_PROW,
t1.KWOTA_OST_SPLATY_ODS,
t1.KWOTA_OST_SPLATY_KAP,
t1.KWOTA_OST_SPLATY_WIND,
t1.KAPITAL_SPLACONY,
t1.ODSETKI_SPLACONE,
t1.PROWIZJE_SPLACONE,
t1.KOSZTY_WIND_SPLACONE,
t1.ODSETKI_KARNE_SPLACONE,
t1.PROW_DO_ROZL_ESP,
t1.DATA_OST_KOREKTY,
t1.ESP_DATA_OST_WYCENY,
t1.ESP_DOCHODY_PROWIZJI,
t1.ESP_DOCHODY_PROWIZJI_RU,
t1.ESP_HARM_ID,
t1.ESP_KOREKTA_ODS_MA,
t1.ESP_KOREKTA_ODS_WN,
t1.ESP_KOSZTY_PROW,
t1.ESP_KOSZTY_PROW_RU,
t1.ESP_PROW_ROZL,
t1.ESP_PRZYCZYNA_WYC_ID,
t1.ESP_ROZL_ODSETEK_MA,
t1.ESP_ROZL_ODSETEK_WN,
t1.ESP_STOPA_NOMINALNA,
t1.ESP_STOPA_PROC_BEZ_PROW,
t1.ESP_STOPA_PROCENTOWA,
t1.ESP_WYCENA,
t1.ESP_WYCENA_BEZ_PROW,
t1.DATA_WALUTY_OST_SPLATA,
t1.KWOTA_PROW_DEAL,
t1.KWOTA_DOPL_BANK,
t1.PROWIZJE_PRZY_URUCHOMIENIU,
t1.ILOSC_RAT,
t1.KONTO_KAPITAL,
t1.DOCHODY_PROWIZJI_LINIOWE,
t1.KOM_WIND_DATA_SPRZEDAZY,
t1.KOM_WIND_DATA_PRZEJECIA,
t1.KOM_WIND_CENA_SPRZEDAZY,
t1.KOM_WIND_CENA_PARTNERA,
t1.PRODUKT_PROMOCYJNY,
t1.PRODUKT_SPONS_OPROC,
t1.DATA_SPISANIA,
t1.PRODUKT_STOPA_WN_TAB,
t1.PRODUKT_STOPA_MA_TAB,
t1.PROWIZJA_BANKU_FINANSOWANA,
t1.DATA_USUNIECIA,
t1.UMOWA_LINIA_ID,
t1.UMOWA_LINIA_PROD_ID,
t1.UMOWA_LIMIT_ID,
t1.KWOTA_DZIEN_WYPL_KAP,
t1.KWOTA_DZIEN_SPL_KAP,
t1.LINIA_DOST_LIMIT,
t1.LINIA_DOST_LIMIT_PODRZ,
t1.KWOTA_PROW_DEAL_UBEZP,
t1.KWOTA_PROW_SPRZED,
t1.KWOTA_PROW_SPRZED_UBEZP,
t1.OPLATA_ZASTAW_REJ,
t1.WIND_DATA_START,
t1.WIND_DATA_STATUS,
t1.WIND_DATA_SEKCJA,
t1.WIND_DATA_WYPOW,
t1.WIND_STATUS_ID,
t1.WIND_SEKCJA_ID,
t1.WIND_NR_PROCESU,
t1.WIND_DATA_KONC_PROCESU,
t1.IND_KLASA_RYZYKA_PROD_ID,
t1.IND_WAGA_WAL_BAZOWA,
t1.IND_WAGA_WAL_UMOWY,
t1.IND_WSPOLCZYNNIK_CCF,
t1.IAS39_PORTFEL_PROD_ID,
t1.IAS39_PORTFEL_POPRZ_PROD_ID,
t1.IAS39_PORTFEL_DATA_OST_ZM,
t1.IAS39_PORTFEL_PRZYP_MAN,
t1.IAS39_WYM_REZERWA,
t1.PRZEWAL_NR,
t1.UMOWA_PRZEWAL_PROD_ID,
t1.UMOWA_PRZEWAL_DATA_KSIEG,
t1.PRZEWAL_DATA_REF,
t1.PRZEWAL_DATA_KSIEG,
t1.PRZEWAL_DATA_REJ,
t1.PRZEWAL_TYP_PROD_ID,
t1.PRZEWAL_KURS_WAL2PLN,
t1.PRZEWAL_KURS_PLN2WAL,
t1.SYMBOL_CK,
t1.TYP_KLNT_HD,
t1.WIELKOSC_FIRMY_ID,
t1.FKT_CZY_REGRES,
t1.WALUTA_ID,
t1.RODZAJ_PORTFELA,
t1.DATA_UMORZENIA_BIK,
t1.DATA_PROBLEMATYCZNY_BIK,
t1.DATA_WINDYKACJI_BIK,
t1.LIMIT_WALUTA,
t1.LIMIT_WARTOSC_BIK,
t1.LIMIT_WALUTA_BIK,
t1.ESP_DOCHODY,
t1.ESP_DOCHODY_KONTO,
t1.ESP_DOCHODY_ZASTRZ,
t1.ESP_DOCHODY_ZASTRZ_KONTO,
t1.UMOWA_NAZWA_TAB_WN,
t1.PRODUKT_NAZWA_TAB_WN,
t1.ESP_DOCHODY_ODS,
t1.ESP_KOSZTY_ODS,
t1.OPLATY,
t1.OPLATY_LINIOWE,
t1.DOCHODY_PROW_LIN_ROZL,
t1.KOSZTY_PROW_LIN_ROZL,
t1.ZABEZP_WART_AKT,
t1.DOCHODY_PROW_LIN_NAL,
t1.DOCHODY_PROW_LIN_ZASTRZ,
t1.ESP_SUBWENCJE,
t1.PRODUKT_STOPA_WN_MNOZNIK,
t1.PRODUKT_STOPA_WN_STALA,
t1.PRODUKT_STOPA_WN_TAB_ALG,
t1.KWOTA_KAP_NIEZAP_HARM,
t1.KWOTA_ODS_NIEZAP_HARM,
t1.OST_TYP_RATY_TECH_KAP,
t1.OST_TYP_RATY_TECH_ODS,
t1.OKRES_PRZESZAC,
t1.WALUTA_POPRZ_OKR,
t1.PROD_PARAM_STOPA_MA,
t1.PROD_PARAM_STOPA_WN,
t1.ODSETKI_NALICZONE_MA,
t1.ODSETKI_NALICZONE_WN,
t1.DATA_EGZEKUCJI,
t1.DATA_OSTATNIEGO_ANEKSU,
t1.DATA_WYPOWIEDZENIA,
t1.KOSZTY_PROWIZJI,
t1.NR_UMOWY_MIGR,
t1.ODSETKI_EWIDENCYJNE,
t1.STAN_UMOWY_PROD_ID,
t1.STAN_KREDYTU_PROD_ID,
t1.SKLADKA_UBEZP_ZALEGLA_PLN,
t1.SKLADKA_UBEZP_SPLACONA_PLN,
t1.SALDO,
t1.RESTRUKTURYZACJA_DATA_KSIEG,
t1.ODSETKI_ZB_OBROTY_WN,
t1.ODSETKI_NL_OBROTY_WN,
t1.KWOTA_UMARZ_ODS,
t1.KWOTA_ODZYSK_NALEZN_ODS,
t1.KWOTA_ODS_WYM_SPIS,
t1.KOSZTY_LINIOWE,
t1.KAPITAL_OBROTY_MA,
t1.DATA_ODZYSKANIA_NALEZNOSCI,
t1.RESTRUKTURYZACJA_NUMER,
t1.PROWIZJE_LINIOWE,
t1.STAN_UMOWY_ID,
t1.STAN_KREDYTU_ID,
t1.SKLADKA_UBEZP_ZALEGLA,
t1.SKLADKA_UBEZP_SPLACONA,
t1.ODSETKI_ZB_OBROTY_MA,
t1.ODSETKI_NL_OBROTY_MA,
t1.KWOTA_WPLATY_IKE,
t1.KWOTA_UMARZ_ODS_KARNYCH,
t1.KWOTA_UMARZ_KAPITAL,
t1.KWOTA_SPIS_KAPITAL,
t1.KWOTA_ODZYSK_ODS_KARN,
t1.KWOTA_ODZYSK_NALEZN_KAP,
t1.KOSZTY_PROWIZJI_LINIOWE,
t1.KAPITAL_OBROTY_WN,
t1.DEBET_NIEDOZWOLONY,
t1.KONS_GLOWNA_UMOWA_PROD_ID,
t1.BLOKADA_CZEK,
t1.BLOKADA_KOM,
t1.BLOKADA_ROZNE,
t1.ID_BIK,
t1.JEDNOSTKA_BIK,
t1.TYP_TRANSAKCJI_BIK,
t1.ODSETKI_ZALEGLE_WAL_BAZOWA,
t1.PRODUKT_RB_TERMINOWY,
t1.PROWIZJE_ZALEGLE_WAL_BAZOWA,
t1.KWOTA_KAP_ZAP_HARM,
t1.KOSZTY_WINDYKACJI_WAL_BAZOWA,
t1.KWOTA_NAST_RATA,
t1.DOCHODY_NADZWYCZAJNE,
t1.ESP_KOSZTY,
t1.KONS_GLOWNA_UMOWA_ID,
t1.ILOSC_RAT_KAP_NIEZAP_HARM,
t1.HARM_ID,
t1.ILOSC_RAT_ODS_NIEZAP_HARM,
t1.KAPITAL_ZALEGLY_WAL_BAZOWA,
t1.IND_WSPOLCZYNNIK_CCF1,
t1.KWOTA_OST_RATA_H,
t1.KWOTA_ODS_ZAP_HARM,
t1.DATA_START_HARM,
t1.ODSETKI_KARNE_WAL_BAZOWA,
t1.DATA_STARTU_ORG,
t1.KURS_SPRZEDAZY_WALUTY,
t1.KURS_SREDNI_WALUTY,
t1.KURS_ZAKUPU_WALUTY,
t1.HARM_TYP_ID,
t1.DATA_SPISANIA_POZABIL,
t1.DATA_NALEZNOSCI_FINREP,
t1.FUNDUSZ_ODS_OVN,
t1.LIMIT_WYKORZYSTANY,
t1.ODSETKI_NALEZNE_OD_DONATORA,
t1.REJESTR_DEPOZ_DOPLAT_DO_ROZL,
t1.REZ_CEL_ZOB_POZABIL,
t1.STAN_PODST_LOKATA_OVN,
t1.SRODKI_WYKSIEGOWANE,
t1.ZALEGLOSCI_ODSETKOWE,
t1.ODS_SKAPITALIZOWANE_SPISANE,
t1.ODS_KARNE_SKAPITALIZOWANE,
t1.ODS_KARNE_SKAPIT_SPISANE,
t1.ODSETKI_KARNE_SPISANE,
t1.ODSETKI_SKAPITALIZOWANE,
t1.ODPISY_AKTUALIZUJACE,
t1.ODPISY_AKTUALIZUJACE_SPISANE,
t1.DATA_NAST_NWYPL_TRANSZ,
t1.UMOWA_NAZWA_TAB_MA,
t1.OPIS_TABELI_MA,
t1.OPIS_TABELI_WN,
t1.PRODUKT_NAZWA_TAB_MA
from wh_ods.UMOWY_KM t1
where data_danych = data_d

);

commit;



execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_przeplywy_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.UMOWY_PRZEPLYWY_KM
(select 
t1.DO10D_MA,
t1.DO10D_WN,
t1.DO10M_MA,
t1.DO10M_WN,
t1.DO10R_MA,
t1.DO10R_WN,
t1.DO11D_MA,
t1.DO11D_WN,
t1.DO11M_MA,
t1.DO11M_WN,
t1.DO12D_MA,
t1.DO12D_WN,
t1.DO12M_MA,
t1.DO12M_WN,
t1.DO13D_MA,
t1.DO13D_WN,
t1.DO14D_MA,
t1.DO14D_WN,
t1.DO1D_MA,
t1.DO1D_WN,
t1.DO1M_MA,
t1.DO1M_WN,
t1.DO20R_MA,
t1.DO20R_WN,
t1.DO21D_MA,
t1.DO21D_WN,
t1.DO2D_MA,
t1.DO2D_WN,
t1.DO2M_MA,
t1.DO2M_WN,
t1.DO2R_MA,
t1.DO2R_WN,
t1.DO3D_MA,
t1.DO3D_WN,
t1.DO3M_MA,
t1.DO3M_WN,
t1.DO3R_MA,
t1.DO3R_WN,
t1.DO4D_MA,
t1.DO4D_WN,
t1.DO4M_MA,
t1.DO4M_WN,
t1.DO4R_MA,
t1.DO4R_WN,
t1.DO5D_MA,
t1.DO5D_WN,
t1.DO5M_MA,
t1.DO5M_WN,
t1.DO5R_MA,
t1.DO5R_WN,
t1.DO6D_MA,
t1.DO6D_WN,
t1.DO6M_MA,
t1.DO6M_WN,
t1.DO7D_MA,
t1.DO7D_WN,
t1.DO7M_MA,
t1.DO7M_WN,
t1.DO7R_MA,
t1.DO7R_WN,
t1.DO8D_MA,
t1.DO8D_WN,
t1.DO8M_MA,
t1.DO8M_WN,
t1.DO9D_MA,
t1.DO9D_WN,
t1.DO9M_MA,
t1.DO9M_WN,
t1.UMOWA_ID,
t1.ANALITYKA_ID,
t1.TYP,
t1.SALDO_WN,
t1.SALDO_MA,
t1.POW20R_WN,
t1.POW20R_MA,
iii.tmpdate,
t1.SALDO_MA_REJ,
t1.SALDO_WN_REJ,
t1.DO15D_WN,
t1.DO15D_MA,
t1.DO16D_WN,
t1.DO16D_MA,
t1.DO17D_WN,
t1.DO17D_MA,
t1.DO18D_WN,
t1.DO18D_MA,
t1.DO19D_WN,
t1.DO19D_MA,
t1.DO20D_WN,
t1.DO20D_MA,
t1.DO22D_WN,
t1.DO22D_MA,
t1.DO23D_WN,
t1.DO23D_MA,
t1.DO24D_WN,
t1.DO24D_MA,
t1.DO25D_WN,
t1.DO25D_MA,
t1.DO26D_WN,
t1.DO26D_MA,
t1.DO27D_WN,
t1.DO27D_MA,
t1.DO28D_WN,
t1.DO28D_MA,
t1.DO29D_WN,
t1.DO29D_MA,
t1.DO30D_WN,
t1.DO30D_MA,
t1.DO31D_WN,
t1.DO31D_MA,
t1.DO6R_WN,
t1.DO6R_MA,
t1.DO7R_OD6R_WN,
t1.DO7R_OD6R_MA,
t1.DO8R_WN,
t1.DO8R_MA,
t1.DO9R_WN,
t1.DO9R_MA,
t1.DO10R_OD9R_WN,
t1.DO10R_OD9R_MA,
t1.DO12R_WN,
t1.DO12R_MA,
t1.DO20R_OD12R_WN,
t1.DO20R_OD12R_MA,
t1.POW30R_WN,
t1.POW30R_MA,
t1.DO30R_WN,
t1.DO30R_MA,
t1.DO21D_OD20D_WN,
t1.DO21D_OD20D_MA
from wh_ods.UMOWY_PRZEPLYWY_KM t1
where data_danych = data_d
);

commit;



execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_rejestry_hist
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.UMOWY_REJESTRY_HIST
(select 
t1.OBROTY_MA,
t1.OBROTY_WN,
t1.MODULO_WL_PROD_ID,
t1.UMOWA_PROD_ID,
t1.WALUTA_PROD_ID,
t1.WALUTA,
t1.REJESTR_PROD_ID,
t1.REJESTR_STAN_PROD_ID,
t1.DATA_REJESTRU,
t1.MODULO,
t1.KONTO,
t1.UWAGA,
iii.tmpdate,
t1.UMOWA_ID,
t1.WALUTA_ID,
t1.REJESTR_ID,
t1.DATA_AKT_OBR,
t1.REJESTR,
t1.ANALITYKA_ID,
t1.DATA_USUNIECIA
from wh_ods.UMOWY_REJESTRY_HIST t1
where data_danych = data_d
);

commit;

-----------------------------------



/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_rejestry_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.UMOWY_REJESTRY_KM
(select 
t1.OBROTY_MA,
t1.OBROTY_WN,
t1.MODULO_WL_PROD_ID,
t1.UMOWA_PROD_ID,
t1.WALUTA_PROD_ID,
t1.WALUTA,
t1.REJESTR_PROD_ID,
t1.REJESTR_STAN_PROD_ID,
t1.DATA_REJESTRU,
t1.MODULO,
t1.KONTO,
t1.UWAGA,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.WALUTA_ID,
t1.REJESTR_ID,
t1.DATA_AKT_OBR,
t1.REJESTR,
t1.ANALITYKA_ID,
iii.tmpdate,
t1.OBROTY_MA_BK,
t1.OBROTY_WN_BK,
t1.DATA_USUNIECIA
from wh_ods.UMOWY_REJESTRY_KM t1
where data_danych = data_d
);

commit;
*/

/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_rejestry_tech_hist
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.UMOWY_REJESTRY_TECH_HIST
(select 
t1.OBROTY_MA,
t1.OBROTY_WN,
t1.MODULO_WL_PROD_ID,
t1.UMOWA_PROD_ID,
t1.WALUTA_PROD_ID,
t1.WALUTA,
t1.REJESTR_PROD_ID,
t1.REJESTR_STAN_PROD_ID,
t1.DATA_REJESTRU,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.WALUTA_ID,
t1.REJESTR_ID,
t1.REJESTR,
t1.DATA_USUNIECIA,
iii.tmpdate
from wh_ods.UMOWY_REJESTRY_TECH_HIST t1
where data_danych = data_d
);

commit;
*/

/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_rejestry_tech_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.UMOWY_REJESTRY_TECH_KM
(select 
t1.OBROTY_MA,
t1.OBROTY_WN,
t1.MODULO_WL_PROD_ID,
t1.UMOWA_PROD_ID,
t1.WALUTA_PROD_ID,
t1.WALUTA,
t1.REJESTR_PROD_ID,
t1.REJESTR_STAN_PROD_ID,
t1.DATA_REJESTRU,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.WALUTA_ID,
t1.REJESTR_ID,
t1.DATA_AKT_OBR,
t1.REJESTR,
iii.tmpdate,
t1.OBROTY_MA_BK,
t1.OBROTY_WN_BK,
t1.DATA_USUNIECIA
from wh_ods.UMOWY_REJESTRY_TECH_KM t1
where data_danych = data_d
);

commit;
*/



/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.umowy_zabezpieczenia_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.UMOWY_ZABEZPIECZENIA_KM
(select 
t1.NUMER_RACH,
t1.TYP_RACHUNKU,
t1.ADRES,
t1.POWIERZCHNIA,
t1.NUMER_DZIALKI,
t1.BANK,
t1.WALUTA_BHIP_PROD_ID,
t1.WALUTA_BHIP,
t1.WARTOSC_BHIP,
t1.NAZWA_FIRMY,
t1.LACZNIE,
t1.KWOTA_ZABEZP_KONSORC,
t1.ROK_PRODUKCJI,
t1.SKLADKA,
t1.DATA_WYCENY,
t1.DATA_OGLEDZIN,
t1.DATA_DOSTARCZENIA,
t1.DATA_WYST_SAD,
t1.DATA_UPOMNIENIA,
t1.DATA_ODPISU,
t1.KWOTA_ZM_REZ,
t1.WALUTA_ZM_REZ_PROD_ID,
t1.OPIS,
t1.WYSTAWCA,
t1.DATA_PRZESZAC,
t1.RZECZOZN_ROLE_PROD_ID,
t1.DATA_WYSTAWIENIA,
t1.NUMER_FABRYCZNY,
t1.TERMIN_KONCOWY,
t1.CZEST_PLATN,
t1.GWARANT_ROLE_PROD_ID,
t1.ANEKS_PROD_ID,
t1.UMOWA_PROD_ID,
t1.SAD_PROD_ID,
t1.WALUTA_PROD_ID,
t1.WALUTA,
t1.ZABEZP_PROD_ID,
t1.WNIOSEK_PROD_ID,
t1.UMOWA_ZABEZP_PROD_ID,
t1.UMOWA_ZABEZP_NADRZ_PROD_ID,
t1.REGULA_INDEKSACJI,
t1.WARTOSC_POCZATKOWA,
t1.WART_POCZ_WALUTA_PROD_ID,
t1.WART_POCZ_WALUTA,
t1.UBEZPIECZAJACY_ROLE_PROD_ID,
t1.CZY_HIP_PIERW,
t1.CZY_STANDARD_PODST_REZ,
t1.NR_KSIEG_WIECZYST,
t1.TYP_HIPOTEKI,
t1.WLASCICIEL,
t1.KWOTA_OPLATY,
t1.NR_POLISY,
t1.NR_ZABEZPIECZENIA,
t1.ILOSC,
t1.NR_REJESTRU,
t1.REGON,
t1.DATA_ZWOLN,
t1.RODZAJ_PAPIERU,
t1.PORECZ_ROLA_PROD_ID,
t1.NAJEMCA,
t1.WARTOSC,
t1.WART_ZM_PODST_REZ,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.ZABEZP_ID,
t1.KONTO,
t1.MODULO,
t1.SUFFIX1,
t1.SUFFIX2,
t1.ANALITYKA_ID,
t1.KWOTA_ZM_REZ_UR,
iii.tmpdate,
t1.WART_ZM_PODST_REZ_WALUTA,
t1.DATA_USUNIECIA,
t1.STATUS,
t1.DATA_APELACJI,
t1.DATA_UPRAWOMOCNIENIA,
t1.DATA_OTRZYMANIA_WPISU,
t1.KOMENTARZ,
t1.RODZAJ_WYCENY,
t1.WART_ZM_PODST_REZ_POZABIL,
t1.WART_KSIEGOWA_MSR_WALUTA_ID,
t1.WART_KSIEGOWA_MSR,
t1.ZABEZP_EFEKTYWNE,
t1.KWOTA_EFEKTYWNA_ZABEZP,
t1.IND_WAGA_RYZYKA,
t1.WART_ZM_PODST_REZ_UR,
t1.CZY_AUTOM_PRZELICZ_AKT_WRT_ZAB,
t1.PROC_KAPIT_DO_WYL_AKT_WRT_ZAB,
t1.WART_ZM_PODST_ODPISU_AKT,
t1.WART_ZM_POD_ODP_AK_WAL_PROD_ID
from wh_ods.UMOWY_ZABEZPIECZENIA_KM t1
where data_aktualizacji = data_d
);

commit;
*/



------------ IFORCE
/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.IF1_RACH_NOSTRO_HIST
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.IF1_RACH_NOSTRO_HIST
(select 
t1.NOSTRO_KOD,
t1.WALUTA_KOD,
t1.NR_KONTA_GL,
t1.MODULO,
t1.UWAGA,
t1.KLIENT_KOD,
t1.KLIENT_NAZWA,
t1.NR_KONTA_ZEW,
t1.REJESTR_PROD_ID,
t1.OBR_MA_DATA_PRZETW,
t1.OBR_WN_DATA_PRZETW,
t1.OBR_MA_DATA_WAL,
t1.OBR_WN_DATA_WAL,
t1.SALDO_MA_DATA_PRZETW,
t1.SALDO_WN_DATA_PRZETW,
t1.SALDO_MA_DATA_WAL,
t1.SALDO_WN_DATA_WAL,
iii.tmpdate,
t1.NOSTRO_ID,
t1.KLIENT_ID,
t1.KRAJ_KOD
from wh_ods.IF1_RACH_NOSTRO_HIST t1
where data_danych = data_d
);

commit;
*/

/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.if1_umowy_blokady_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.IF1_UMOWY_BLOKADY_KM
(select 
t1.UMOWA_BLOKADA_ID,
t1.UMOWA_BLOKADA_PROD_ID,
t1.PRODUKT_ID,
t1.PRODUKT_PROD_ID,
t1.UMOWA_KUPNO_ID,
t1.UMOWA_KUPNO_PROD_ID,
t1.PORTFEL_PROD_ID,
t1.ILOSC,
t1.NOMINAL,
t1.KOD_ISIN,
t1.DATA_AKTUALIZACJI,
iii.tmpdate
from wh_ods.IF1_UMOWY_BLOKADY_KM t1
where data_danych = data_d
);

commit;
*/

/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.if1_umowy_gotowka_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.IF1_UMOWY_GOTOWKA_KM
(select 
t1.ANULOWAL,
t1.DATA_AKTUALIZACJI,
t1.DATA_ANULOWANIA,
t1.DATA_TRANSAKCJI,
t1.DATA_WALUTY,
t1.DATA_ZAPADALNOSCI,
t1.DATA_WPROWADZENIA,
t1.DATA_WERYFIKACJI,
t1.DATA_WERYF_ANUL,
t1.DATA_ZAKSIEGOWANIA,
t1.DEALER_NAZWA,
t1.FUNDUSZ_KOD,
t1.KLIENT_ID,
t1.KLIENT_KOD,
t1.KLIENT_NAZWA,
t1.KLIENT_PROD_ID,
t1.MODULO,
t1.PROWIZJA_KURS_TR,
t1.WARTOSC_TRANSAKCJI,
t1.PROWIZJA_PODSTAWA,
t1.PROWIZJA,
t1.PROWIZJA_TYP,
t1.NOSTRO_PROD_ID,
t1.NOSTRO_ID,
t1.PROWIZJA_NOSTRO_PROD_ID,
t1.PROWIZJA_NOSTRO_ID,
t1.PROWIZJA_RODZAJ,
t1.PORTFOLIO_PROD_ID,
t1.PORTFOLIO_KOD,
t1.PRZEZNACZENIE_KOD,
t1.PRZEZNACZENIE_PROD_ID,
t1.STATUS,
t1.RODZAJ_UMOWY,
t1.TYP_UMOWY,
t1.TYP_UMOWY_OPIS,
t1.TYP_UMOWY_PROD_ID,
t1.UMOWA_ID,
t1.UMOWA_NR_REF,
t1.UMOWA_PROD_ID,
t1.UMOWA_TYP_ID,
t1.UMOWA_PODTYP_ID,
t1.UMOWA_PODTYP_KOD,
t1.UMOWA_PODTYP_PROD_ID,
t1.UWAGI,
t1.WALUTA_1_ID,
t1.WALUTA_1_KOD,
t1.WALUTA_1_PROD_ID,
t1.WALUTA_2_ID,
t1.WALUTA_2_KOD,
t1.WALUTA_2_PROD_ID,
t1.WERYFIKOWAL,
t1.WERYFIKOWAL_ANUL,
t1.WPROWADZIL,
t1.ZAKSIEGOWAL,
t1.POWIAZANIE_ZEWN,
iii.tmpdate,
t1.PROWIZJA_PODSTAWA_PROC
from wh_ods.IF1_UMOWY_GOTOWKA_KM t1
where data_danych = data_d
);

commit;
*/

/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.if1_umowy_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.IF1_UMOWY_KM
(select 
t1.UMOWA_PROD_ID,
t1.UMOWA_NR_REF,
t1.TYP_UMOWY_PROD_ID,
t1.TYP_UMOWY,
t1.TYP_UMOWY_OPIS,
t1.RODZAJ_UMOWY,
t1.UMOWA_PODTYP_PROD_ID,
t1.UMOWA_PODTYP_KOD,
t1.PRZEZNACZENIE_PROD_ID,
t1.PRZEZNACZENIE_KOD,
t1.KUP_SPRZED,
t1.DATA_TRANSAKCJI,
t1.DATA_WALUTY,
t1.DATA_ZAPADALNOSCI,
t1.WALUTA_1_PROD_ID,
t1.WALUTA_1_KOD,
t1.NOMINAL_1,
t1.WALUTA_2_PROD_ID,
t1.WALUTA_2_KOD,
t1.NOMINAL_2,
t1.WART_ZAKUPU,
t1.ILOSC_1,
t1.ILOSC_2,
t1.CENA,
t1.CENA_100,
t1.TYP_CENY,
t1.KURS_SPOT,
t1.KURS_FRWD,
t1.PROWIZJA,
t1.ODSETKI,
t1.KLIENT_PROD_ID,
t1.KLIENT_KOD,
t1.KLIENT_NAZWA,
t1.STATUS,
t1.PORTFOLIO_PROD_ID,
t1.PORTFOLIO_KOD,
t1.NOSTRO_1_PROD_ID,
t1.NOSTRO_2_PROD_ID,
t1.DEPOZYTATARIUSZ_KONTO_PROD_ID,
t1.PRODUKT_PROD_ID,
t1.PRODUKT_KOD_ISIN,
t1.PRODUKT_DATA_EMISJI,
t1.PRODUKT_DATA_WYKUPU,
t1.PRODUKT_OPIS,
t1.UWAGI,
t1.WPROWADZIL,
t1.DATA_WPROWADZENIA,
t1.WERYFIKOWAL,
t1.DATA_WERYFIKACJI,
t1.ZAKSIEGOWAL,
t1.DATA_ZAKSIEGOWANIA,
t1.ANULOWAL,
t1.DATA_ANULOWANIA,
t1.WERYFIKOWAL_ANUL,
t1.DATA_WERYF_ANUL,
t1.DEALER_NAZWA,
t1.TYP_STOPY_1,
t1.STOPA_POCZATKOWA_1,
t1.TYP_STOPY_2,
t1.STOPA_POCZATKOWA_2,
t1.FUNDUSZ_KOD,
t1.EMITENT,
t1.MODULO,
t1.TYP_TRANSAKCJI_2,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.UMOWA_PODTYP_ID,
t1.UMOWA_TYP_ID,
t1.WALUTA_1_ID,
t1.WALUTA_2_ID,
t1.KLIENT_ID,
t1.NOSTRO_1_ID,
t1.NOSTRO_2_ID,
t1.PRODUKT_ID,
t1.REF_ZEWN_UM,
t1.BLOKADA_RODZAJ,
t1.BLOKADA_NAZWA,
t1.CZY_PRZETERMINOWANY,
t1.STOPA_PROCENTOWA,
iii.tmpdate,
t1.EMITENT_ID,
t1.EMITENT_PROD_ID,
t1.EMITENT_TYP_KOD,
t1.EMITENT_REZYDENT,
t1.EMITENT_MODULO,
t1.EMITENT_KRAJ_KOD,
t1.KRAJ_EMISJI_KOD,
t1.KLIENT_TYP_KOD,
t1.KLIENT_KRAJ_KOD,
t1.KLIENT_REZYDENT,
t1.DATA_NAST_NAL,
t1.DATA_NAST_ZOB,
t1.ODSETKI_WE_SUMA,
t1.ODSETKI_WY_SUMA,
t1.REJ_PUNKTY_SWAP,
t1.REJ_PUNKTY_SWAP_WAL,
t1.REJ_WYCENA_DCF,
t1.REJ_ODSETKI_WN_NALICZ,
t1.REJ_ODSETKI_WN_NALICZ_ROWN,
t1.REJ_ODSETKI_WN_NALICZ_RU,
t1.REJ_ODSETKI_WN_NALICZ_ROWN_RU,
t1.REJ_ODSETKI_MA_NALICZ,
t1.REJ_ODSETKI_MA_NALICZ_ROWN,
t1.REJ_ODSETKI_MA_NALICZ_RU,
t1.REJ_ODSETKI_MA_NALICZ_ROWN_RU,
t1.REJ_ESP_ROZN_PROW,
t1.REJ_ESP_ROZN_PROW_ROWN,
t1.REJ_ESP_ROZN_LIN_BPROW,
t1.REJ_ESP_ROZN_LIN_BPROW_ROWN,
t1.REJ_DOCHODY_ROWN,
t1.REJ_KOSZTY_ROWN,
t1.REJ_ILOSC,
t1.REJ_NOMINAL,
t1.REJ_ODSETKI_ZAPL,
t1.REJ_DYSK_PREMIA_ZAKUP,
t1.REJ_DYSK_PREMIA_NALICZ,
t1.REJ_DYSK_PREMIA_NALICZ_ROWN,
t1.REJ_DYSK_PREMIA_NALICZ_RU,
t1.REJ_DYSK_PREMIA_NALICZ_ROWN_RU,
t1.REJ_PROWIZJA,
t1.REJ_PROWIZJA_ROWN,
t1.REJ_WARTOSC_RYNKOWA,
t1.REJ_WYCENA_V2,
t1.REJ_WYCENA_V2_ROWN,
t1.REJ_ZYSK,
t1.REJ_STRATA,
t1.REJ_BLOKADA_ILOSC,
t1.REJ_PRZEMIESZCZENIA_ILOSC,
t1.KURS_WAL_1,
t1.KURS_WAL_1_DATA_ZAP,
t1.KURS_WAL_2,
t1.KURS_WAL_2_DATA_ZAP,
t1.KLIENT_NR_BANKU,
t1.ODSETKI_WY_DATA_START_NAST,
t1.ODSETKI_WE_DATA_START_NAST,
t1.REJ_KOSZTY,
t1.REJ_DOCHODY,
t1.TYP_STOPY_1P,
t1.TYP_STOPY_2P,
t1.STOPA_1P,
t1.STOPA_2P,
t1.NOMINAL_3,
t1.NOMINAL_4,
t1.REJ_WYCENA_DCF_RU,
t1.REJ_DOCHODY_ROWN_RU,
t1.REJ_KOSZTY_ROWN_RU,
t1.REJ_WYCENA_V2_ROWN_RU,
t1.REJ_ZYSK_RU,
t1.REJ_STRATA_RU,
t1.PRODUKT_TYP_STOPY,
t1.PRODUKT_STOPA_AKT,
t1.REJ_ESP_ROZN_LIN_PROW_ROWN,
t1.REJ_ESP_ROZN_LIN_PROW,
t1.REJ_ESP_ROZN_PROW_RU,
t1.REJ_ESP_ROZN_PROW_ROWN_RU,
t1.REJ_ESP_ROZN_LIN_BP_RU,
t1.REJ_ESP_ROZN_LIN_BP_ROWN_RU,
t1.REJ_ESP_ROZN_LIN_PROW_RU,
t1.REJ_ESP_ROZN_LIN_P_ROWN_RU,
t1.REJ_DOCHODY_RU,
t1.REJ_KOSZTY_RU,
t1.REJ_WYCENA_V2_RU,
t1.WART_BILANSOWA,
t1.WART_BILANSOWA_PRZYROST_ROK,
t1.WART_BILANSOWA_PRZYROST_KWART,
t1.WART_BILANSOWA_PRZYROST_MIES,
t1.WART_BILANSOWA_SREDNIA_ROK,
t1.WART_BILANSOWA_SREDNIA_KWART,
t1.WART_BILANSOWA_SREDNIA_MIES,
t1.ID_LINII_KREDYTOWEJ,
t1.OKRES_PIERW_ID,
t1.REJ_LINIA_KREDYTOWA,
t1.LINIA_KRED_ODNAW,
t1.NOGA_BAZOWA,
t1.REJ_WYCENA_EXT,
t1.REJ_KOSZTY_WYCENA_V2,
t1.REJ_DOCHODY_WYCENA_V2,
t1.REJ_STRATA_WYCENA_DCF,
t1.REJ_ZYSK_WYCENA_DCF,
t1.REJ_KOSZTY_EIR1,
t1.PROD_REF_ID,
t1.PROD_REF_TYPE,
t1.UMOWA_PROD_REF_ID,
t1.DATA_ZAMKNIECIA_UMOWY,
t1.DATA_NAST_PRZESZAC,
t1.LIMIT_OKRES_PROD_ID,
t1.LIMIT_OKRES_KOD,
t1.WART_BILANSOWA_SREDNIA_TECH,
t1.PLC,
t1.GRUPA_RYZYKA_ID,
t1.UMOWA_PROD_REF2_ID,
t1.REFERENCJA_CCP,
t1.REFERENCJA_UZGODNIONA,
t1.ID_MARKIT_WIRE,
t1.TRANSAKCJA_POW_GLOWNA_DZIAL,
t1.DATA_ROZLICZENIA_CCP,
t1.ROZLICZENIE_CCP_WYMAGANE,
t1.STATUS_ROZLICZENIA_CCP,
t1.CZY_ROZLICZONA_W_CCP,
t1.CCP_KLIENT_PROD_ID,
t1.CCP_KLIENT_ID,
t1.CCP_KOD,
t1.KONTRAH_PIERW_KLIENT_PROD_ID,
t1.KONTRAH_PIERW_KLIENT_ID,
t1.KONTRAH_PIERW_KOD,
t1.POSREDNIK_ROZL_KLIENT_PROD_ID,
t1.POSREDNIK_ROZL_KLIENT_ID,
t1.POSREDNIK_ROZL_KOD,
t1.CZY_AUTO_PRZEDLUZENIE,
t1.CCP_UTI,
t1.UZGODNIONY_UTI,
t1.UZGODNIONY_UTI_POS,
t1.IDENTYFIKATOR_PRODUKTU,
t1.CZY_NETTOWANA
from wh_ods.IF1_UMOWY_KM t1
where data_danych = data_d
);

commit;
*/


/*
--pusta
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.if1_umowy_przemieszczenia_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;


insert into wh_ods.IF1_UMOWY_PRZEMIESZCZENIA_KM
(select 
t1.UMOWA_PRZEM_ID,
t1.UMOWA_PRZEM_PROD_ID,
t1.UMOWA_KUPNO_ID,
t1.UMOWA_KUPNO_PROD_ID,
t1.PRODUKT_ID,
t1.PRODUKT_PROD_ID,
t1.PORTFEL_PROD_ID,
t1.ILOSC,
t1.NOMINAL,
t1.KOD_ISIN,
t1.DATA_AKTUALIZACJI,
iii.tmpdate
from wh_ods.IF1_UMOWY_PRZEMIESZCZENIA_KM t1
where data_danych  = data_d
);

commit;
*/

/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.if1_umowy_przeplywy_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.IF1_UMOWY_PRZEPLYWY_KM
(select 
t1.UMOWA_PROD_ID,
t1.UMOWA_PRZEPLYW_PROD_ID,
t1.RODZAJ_TRANSAKCJI,
t1.PRZEPLYW_DATA,
t1.ODS_DATA_POCZ,
t1.ODS_DATA_KON,
t1.PRZEPLYW_KOD,
t1.PRZEPLYW_IO,
t1.KWOTA,
t1.KWOTA_PIERW,
t1.KWOTA_NOMINAL_ODS,
t1.DYSKONTO_WSP,
t1.WALUTA_KOD,
t1.WYKONANE,
t1.IS_PAID,
t1.NOSTRO_PROD_ID,
t1.NOSTRO_KOD,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.NOSTRO_ID,
t1.WALUTA_ID,
t1.ID1,
t1.UMOWA_GOT_ID,
t1.POWIAZANIE_TYP,
iii.tmpdate,
t1.KURS
from wh_ods.IF1_UMOWY_PRZEPLYWY_KM t1
where data_danych = data_d
);

commit;
*/


/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.if1_umowy_rejestry_km
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.IF1_UMOWY_REJESTRY_KM
(select 
t1.REJESTR_PROD_ID,
t1.POWIAZANIE_PROD_ID,
t1.POWIAZANIE_TYP,
t1.REJESTR_TYP,
t1.REJESTR_KOD,
t1.WALUTA_KOD,
t1.WALUTA_KOD_REJ_ROWNOWART,
t1.OBR_MA_DATA_PRZETW,
t1.OBR_WN_DATA_PRZETW,
t1.OBR_MA_DATA_WALUTY,
t1.OBROTY_WN_DATA_WALUTY,
t1.SALDO_MA_DATA_PRZETW,
t1.SALDO_WN_DATA_PRZETW,
t1.SALDO_MA_DATA_WALUTY,
t1.SALDO_WN_DATA_WALUTY,
t1.DATA_AKTUALIZACJI,
t1.UMOWA_ID,
t1.NOSTRO_ID,
t1.UMOWA_GOT_ID,
iii.tmpdate
from wh_ods.If1_UMOWY_REJESTRY_KM t1
where data_danych = data_d
);

commit;
*/

/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.if1_um_przepl_hist
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.IF1_UM_PRZEPL_HIST
(select 
t1.UMOWA_PRZEPLYW_PROD_ID,
t1.RODZAJ_TRANSAKCJI,
t1.PRZEPLYW_DATA,
t1.ODS_DATA_POCZ,
t1.ODS_DATA_KON,
t1.PRZEPLYW_KOD,
t1.PRZEPLYW_IO,
t1.KWOTA,
t1.KWOTA_PIERW,
t1.KWOTA_NOMINAL_ODS,
t1.DYSKONTO_WSP,
t1.WALUTA_KOD,
t1.WYKONANE,
t1.IS_PAID,
t1.NOSTRO_KOD,
iii.tmpdate,
t1.UMOWA_ID,
t1.NOSTRO_ID,
t1.WALUTA_ID,
t1.ID1,
t1.UMOWA_PROD_ID,
t1.KURS
from wh_ods.IF1_UM_PRZEPL_HIST t1
where data_danych = data_d
);

commit;
*/

/*
execute immediate 'select data_danych from (
 select data_danych, count(*) from wh_ods.if1_um_rejestry_hist
 where data_danych > to_date(''19/01/01'',''yy/mm/dd'') 
 group by data_danych order by count(*) desc FETCH  first 1 rows only )' into data_d;

insert into wh_ods.IF1_UM_REJESTRY_HIST
(select 
t1.REJESTR_PROD_ID,
t1.POWIAZANIE_PROD_ID,
t1.POWIAZANIE_TYP,
t1.REJESTR_TYP,
t1.REJESTR_KOD,
t1.WALUTA_KOD,
t1.WALUTA_KOD_REJ_ROWNOWART,
t1.OBR_MA_DATA_PRZETW,
t1.OBR_WN_DATA_PRZETW,
t1.OBR_MA_DATA_WALUTY,
t1.OBROTY_WN_DATA_WALUTY,
t1.SALDO_MA_DATA_PRZETW,
t1.SALDO_WN_DATA_PRZETW,
t1.SALDO_MA_DATA_WALUTY,
t1.SALDO_WN_DATA_WALUTY,
iii.tmpdate,
t1.UMOWA_ID,
t1.NOSTRO_ID
from wh_ods.IF1_UM_REJESTRY_HIST t1
where data_danych = data_d
);

commit;
*/

--------------------------------------------------------------------
/*
     execute immediate 'SELECT MAX(WNIOSEK_PROD_ID) FROM WNIOSKI' into TMP_PROD_ID;
     --dbms_output.put_line(TMP_PROD_ID);

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '||TMP_PROD_ID;
     EXECUTE IMMEDIATE sql_stmt;

     sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
     EXECUTE IMMEDIATE sql_stmt;

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
     EXECUTE IMMEDIATE sql_stmt;

     dbms_output.put_line('wnioski_tmp');



    insert into WNIOSKI_TMP
    (SELECT w.kwota,
            w.data_ksiegowania,
            w.kwota_udzialu_banku, 
            w.numer_um_kons, 
            w.kons_org, 
            w.typ_kred_kons, 
            w.cena_wyp_dod, 
            w.koszty_dodatkowe, 
            w.ubezp_przedm_kred,
            w.kwota_prowizji, 
            w.manualna_modyf_prow, 
            w.ubezp_dodatk, 
            w.wklad_wlasny, 
            w.cena_przedm_kred,
            w.opis_przeznaczenia, 
            w.data_splaty, 
            w.kurs_przeliczenia, 
            w.konto_prod_id, 
            w.jedn_banku_prod_id, 
            u.umowa_prod_id, 
            w.linia_kred_prod_id, 
            w.waluta_prod_id, 
            w.przeznaczenie_prod_id,
            w.siec_banku_prod_id, 
            w.sprzed_sieci_banku_prod_id, 
            w.migracja_prod_id, 
            TMP_PROD_ID_SEQ.NEXTVAL,
            w.produkt_prod_id, 
            w.nr_rach_bank_zew, 
            w.nazwa_rach_bank_zew, 
            w.bank_zew_prod_id, 
            w.umowa_rb_prod_id,
            w.typ_wyplaty_prod_id, 
            w.umowa_wygenerowana, 
            w.komentarz_wniosek, 
            w.data_wniosku, 
            w.adm_wniosku_prod_id, 
            w.zca_adm_wniosku_prod_id, 
            w.nr_wniosku, 
            w.typ_wniosku, 
            w.okres, 
            u.numer_referencyjny,
            w.data_rej, 
            w.poziom_upraw, 
            w.rep_handl, 
            w.status_wniosku, 
            w.klient_oper_prod_id, 
            w.timestamp_rejestr, 
            w.klient_oper_modify_prod_id, 
            w.timestamp_modyf, 
            w.klient_zatw_prod_id, 
            w.timestamp_zatw, 
            w.data_aktualizacji, 
            WN.WN_ID_NEW,
            w.jednostka_id, 
            UI.UM_ID_NEW,
            w.waluta_id, 
            w.przeznaczenie_id, 
            w.produkt_id, 
            K.KL_ID_NEW,
            w.czy_promesa_automatycznie, 
            w.czy_promesa_warunkowa, 
            w.decyzja_scoring, 
            w.data_pierwszej_promesy, 
            w.wniosek_stan_prod_id, 
            w.data_pierwszego_zwrotu, 
            w.data_usuniecia, 
            w.ostatni_wynik_id
  FROM WNIOSKI        W,
       WNIOSKI_ID_TMP WN,
       KLIENCI_ID_TMP K,
       UMOWY_ID_TMP   UI,
       UMOWY_TMP      U
 WHERE W.WNIOSEK_ID = WN.WN_ID
   AND UI.UM_ID = W.UMOWA_ID
   AND UI.UM_ID_NEW = U.UMOWA_ID
   AND ui.kl_id = k.kl_id);

   commit;
   --ANEKSY
     execute immediate 'SELECT MAX(ANEKS_PROD_ID) FROM ANEKSY' into TMP_PROD_ID;
     --dbms_output.put_line(TMP_PROD_ID);

     dbms_output.put_line('aneksy_tmp');
     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '||TMP_PROD_ID;
     EXECUTE IMMEDIATE sql_stmt;

     sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
     EXECUTE IMMEDIATE sql_stmt;

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
     EXECUTE IMMEDIATE sql_stmt;


    insert into ANEKSY_TMP
    (select a.data_zamkniecia_aneksu,
            a.data_otwarcia_aneksu,
            a.numer_kolejny_aneksu, 
            a.numer_aneksu, 
            a.status_aneksu, 
            a.typ_aneksu, 
            a.opis, 
            TMP_PROD_ID_SEQ.NEXTVAL,
            a.umowa_prod_id, 
            a.data_aktualizacji, 
            ai.an_id_new,
            a.umowa_id, 
            a.data_usuniecia
    from ANEKSY a, ANEKSY_ID_TMP ai, UMOWY_TMP u , UMOWY_ID_TMP ui
                       where a.aneks_id = ai.an_id
                       and a.umowa_id = ui.um_id
                       and u.umowa_id = ui.um_id_new);

    commit;

    --umowy_harmonogramy

     execute immediate 'SELECT MAX(HARM_PROD_ID) FROM UMOWY_HARMONOGRAMY' into TMP_PROD_ID;
     --dbms_output.put_line(TMP_PROD_ID);
     dbms_output.put_line('umowy_harmonogramy_tmp');

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '||TMP_PROD_ID;
     EXECUTE IMMEDIATE sql_stmt;

     sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
     EXECUTE IMMEDIATE sql_stmt;

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
     EXECUTE IMMEDIATE sql_stmt;

     insert into UMOWY_HARMONOGRAMY_TMP
     (select  uh.kwota,
              uh.balon,
              uh.blokada_kapitalu, 
              uh.blokada_przeszac, 
              uh.blokada_ods,
              uh.kapital_splacony, 
              uh.kapital_splacone_raty, 
              uh.stala, 
              uh.stala_wn_alg, 
              uh.data_przelicz, 
              uh.przeszac_dzien, 
              uh.przeszac_dzien_ost, 
              uh.przeszac_okres, 
              uh.przeszac_okes_ilosc, 
              uh.data_dost_transz, 
              uh.data_pierw_wplaty, 
              uh.data_start, 
              uh.dzien_dost_harm, 
              uh.licznik, 
              uh.liczn_mianownik, 
              uh.mnoz_tab, 
              uh.mnoz_wn_alg, 
              uh.aneks_prod_id,
              u.umowa_prod_id,
              uh.waluta_prod_id, 
              uh.waluta, 
              uh.wniosek_prod_id, 
              TMP_PROD_ID_SEQ.NEXTVAL,
              uh.harm_poprz_prod_id, 
              uh.produkt_prod_id, 
              uh.odsetki_splacone, 
              uh.odsetki_splac_rejestr, 
              uh.wariant_oblicz, 
              uh.ods_data_pierw, 
              uh.ods_wn_alg, 
              uh.ods_wn_alg_tab, 
              uh.ods_okres, 
              uh.ods_okres_ilosc, 
              uh.ods_il_splac_rat, 
              uh.ods_il_rat, 
              uh.ods_tabela, 
              uh.ods_tab_dzien, 
              uh.mianownik, 
              uh.kolejnosc_splat, 
              uh.harm_status, 
              uh.okres, 
              uh.okres_ilosc, 
              uh.kwota_poprz_kap, 
              uh.il_poprz_rat_kap, 
              uh.kwota_poprz_ods, 
              uh.kwota_poprz_ods_rejestr, 
              uh.il_poprz_rat_ods, 
              uh.ilosc_rat, 
              uh.stopa, 
              uh.data_stopy, 
              uh.stopa_amortyzacji, 
              uh.status, 
              uh.obowiazujacy, 
              uh.nazwa_wariantu, 
              uh.data_aktualizacji, 
              u.umowa_id,
              uhi.ha_id_new,
              uh.do_realizacji, 
              uh.wariant_oblicz_id, 
              uh.data_usuniecia
     from UMOWY_HARMONOGRAMY uh, UMOWY_HARMONOGRAMY_ID_TMP uhi , UMOWY_ID_TMP ui, UMOWY_TMP u
     where uh.harm_id = uhi.ha_id
           and uh.umowa_id = ui.um_id
           and u.umowa_id = ui.um_id_new);

     commit;

--umowy_harm_pozycje

     execute immediate 'SELECT MAX(HARM_POZ_PROD_ID)+1 FROM UMOWY_HARM_POZYCJE' into TMP_PROD_ID;
     --dbms_output.put_line(TMP_PROD_ID);
     dbms_output.put_line('umowy_harm_pozycje_tmp');

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '||TMP_PROD_ID;
     EXECUTE IMMEDIATE sql_stmt;

     sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
     EXECUTE IMMEDIATE sql_stmt into x;

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
     EXECUTE IMMEDIATE sql_stmt;

     commit;

     insert into umowy_harm_pozycje_TMP
     (select  uhp.kwota,
              uhp.kwota_rejestr,
              uhp.data_dost, 
              uhp.kurs_waluty, 
              u.umowa_prod_id,
              uhp.dokument_prod_id, 
              uh.HARM_PROD_ID,
              TMP_PROD_ID_SEQ.NEXTVAL,
              uhp.harm_poz_poprz_prod_id, 
              uhp.czy_zaleglosc, 
              uhp.data, 
              uhp.typ, 
              uhp.data_aktualizacji, 
              u.umowa_id,
              uhi.ha_id_new,
              uhp.rozliczona, 
              uhp.nr_raty, 
              uhp.data_usuniecia, 
              uhp.typ_raty_technicznej, 
              uhp.um_harm_poz_transza_id, 
              uhp.um_harm_poz_transza_prod_id
     from UMOWY_HARM_POZYCJE uhp, UMOWY_HARMONOGRAMY_ID_TMP uhi, UMOWY_ID_TMP ui, UMOWY_TMP u, UMOWY_HARMONOGRAMY_TMP uh
          where uhp.harm_id = uhi.ha_id
          and uhp.umowa_id = ui.um_id
          and ui.um_id_new = u.umowa_id
          and uhi.ha_id_new = uh.harm_id);

     commit;

--dokumenty

     dbms_output.put_line('DOKUMENTY_tmp');

     insert into DOKUMENTY_TMP
     (select  d.dod_ident_spr,
              d.kwota,
              d.kwota_wal_odbiorcy, 
              d.kwota_prow_wal, 
              d.kwota_wal_nadawcy, 
              d.kwota_reszty_wal, 
              d.typ_przelewu, 
              d.beneficjent, 
              d.beneficjent_rachnek, 
              d.beneficjent_posrednik,
              d.beneficjent_nazwa, 
              d.data_ksiegowania, 
              d.prow_wypl_biez, 
              d.prow_strona, 
              d.typ_rozl_prow, 
              d.typ_prowizji, 
              d.numer_czeku, 
              d.kwota_prowizji, 
              d.typ_komunikatu, 
              d.typ_komunikatu_std, 
              d.deklaracja_zus, 
              d.deklaracja_zus_numer, 
              d.data_dekretu, 
              d.opis, 
              d.wysylane_odbierane, 
              d.kod_dokumentu, 
              d.numer_dokumentu, 
              d.znak_dokumentu, 
              d.blad_dekretow, 
              d.kurs_waluty_ma, 
              d.kurs_waluty_ma_obl, 
              d.kurs_waluty_wn, 
              d.kurs_waluty_wn_obl, 
              d.fkt_kwota_niezapl, 
              d.fkt_prowizja_operacyjna, 
              d.fkt_prowizja_przygotow, 
              d.fkt_faktorant_kwota, 
              d.fkt_kwota_fund_gwar, 
              d.fkt_faktura_id_prod, 
              d.fkt_klient_rola_prod_id, 
              d.fkt_odsetki_dyskontowe, 
              d.fkt_odsetki_przeterm, 
              d.fkt_termin_platn_faktury, 
              d.fkt_typ_operacji, 
              d.fkt_przedplata, 
              d.fkt_faktura_id_prod_zapl, 
              d.id_benef_modulo_prod_id, 
              d.jednostka_prod_id, 
              d.kanal_prod_id, 
              d.beneficjent_umowa_prod_id, 
              d.remiter_umowa_prod_id, 
              d.oplata_waluta_prod_id, 
              d.oplata_waluta, 
              d.waluta_prod_id_ma, 
              d.waluta_ma, 
              d.waluta_prod_id_wn, 
              d.waluta_wn, 
              d.waluta_prod_id_umowa, 
              d.waluta_umowy, 
              d.document_prod_id, 
              d.dokument_podtyp_prod_id, 
              di.d_prod_id_new,
              d.id_doc_revised, 
              d.id_doc_source, 
              d.dokument_pak_prod_id, 
              d.typ_ident_platnika_zus, 
              d.ident_typ_uzup_platn_zus, 
              d.harm_platn_poz_prod_id, 
              d.czy_dekret, 
              d.czy_zakonczony, 
              d.czy_faktoring, 
              d.czy_fx, 
              d.czy_wewn, 
              d.czy_likwidacja, 
              d.czy_przekr_srodki, 
              d.czy_zwrot, 
              d.czy_zus, 
              d.rodzaj, 
              d.numer_paczki, 
              d.parametry_wejsc, 
              d.parametry_wyjsc, 
              d.forma_platn, 
              d.typ_wplaty_zus, 
              d.plan_send_date, 
              d.data_rejestracji, 
              d.remitter, 
              d.remitter_konto, 
              d.remitter_posrednik, 
              d.remitter_nazwa, 
              d.nip, 
              d.data_transakcji, 
              d.typ_dokumentu, 
              d.typ_skladn_zus, 
              d.data_waluty, 
              d.kwota_kapitalu, 
              d.kwota_odsetek, 
              d.kwota_odsetek_karnych, 
              d.kwota_oplaty, 
              d.kwota_wind, 
              d.id_doc_purpose, 
              d.opis_slowny, 
              d.data_danych, 
              d.korekta_bo, 
              d.remitter_modulo_prod_id, 
              d.data_usuniecia, 
              d.rejestr_uzytk_jedn_prod_id, 
              d.akcept_uzytk_jedn_prod_id, 
              d.modyfi_uzytk_jedn_prod_id, 
              d.kurs
       FROM DOKUMENTY D, DOKUMENTY_ID_TMP di
            where d.dokument_prod_id = di.d_prod_id);

    commit;


--dekrety
     execute immediate 'SELECT MAX(DEKRET_PROD_ID)+1 FROM DEKRETY' into TMP_PROD_ID;

     dbms_output.put_line(TMP_PROD_ID);
     dbms_output.put_line('DEKRETY_TMP');

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '|| TMP_PROD_ID;
     EXECUTE IMMEDIATE sql_stmt;

     sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
     EXECUTE IMMEDIATE sql_stmt into x;
     dbms_output.put_line(x);

     sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
     EXECUTE IMMEDIATE sql_stmt;

     execute immediate 'select TMP_PROD_ID_SEQ.NEXTVAL from dual' into TMP_PROD_ID;
     dbms_output.put_line(TMP_PROD_ID);

     commit;

     insert into DEKRETY_TMP
     (select  d.kwota,
              d.data_dekretu,
              d.status_dekretu, 
              d.typ_dekretu, 
              d.opis, 
              d.rodzaj_prowizji, 
              d.rodzaj_oplaty, 
              d.modulo_wlasn_prod_id, 
              d.umowa_prod_id, 
              d.waluta_prod_id, 
              d.waluta, 
              di.d_prod_id_new,
              TMP_PROD_ID_SEQ.NEXTVAL,
              d.rejestr_prod_id, 
              d.klient_rola_prod_id, 
              d.czy_odsetki_dekr, 
              d.data_rejestracji, 
              d.strona, 
              d.data_waluty, 
              d.data_danych, 
              ut.UMOWA_ID,
              d.rejestr, 
              d.rejestr_id, 
              d.waluta_id, 
              d.data_usuniecia
          from DEKRETY d, UMOWY_TMP ut, UMOWY_ID_TMP uit, DOKUMENTY_ID_TMP di
               where d.umowa_id = uit.um_id
                 and uit.um_id_new = ut.umowa_id
                 and d.dokument_prod_id = di.d_prod_id);

    dbms_output.put_line('umowy_rejestry_tmp');

    INSERT INTO umowy_rejestry_tmp
    SELECT
           ur.obroty_ma, 
           ur.obroty_wn, 
           ur.modulo_wl_prod_id, 
           ur.umowa_prod_id, 
           ur.waluta_prod_id,
           ur.waluta, 
           ur.rejestr_prod_id,
           ur.rejestr_stan_prod_id, 
           ur.data_rejestru, 
           ur.modulo, 
           ur.konto, 
           ur.uwaga, 
           ur.data_aktualizacji, 
           um.um_id_new,
           ur.waluta_id, 
           ur.rejestr_id,
           ur.data_akt_obr, 
           ur.rejestr,
           an.an_id_new,
           ur.data_usuniecia
    FROM
           umowy_rejestry ur,
           umowy_id_tmp um,
           analityka_id_tmp an
    WHERE
           ur.umowa_id = um.um_id AND
           an.an_id = ur.analityka_id;

    commit;

----------IF1:

  execute immediate 'insert into IF1_KLIENCI_ID_TMP (k_id, k_id_new)
  (select klient_id, IF1_KLIENT_TMP_ID_SEQ.NEXTVAL from if1_klienci)';
  
  commit;

  execute immediate 'SELECT MAX(KLIENT_PROD_ID) FROM IF1_KLIENCI' into TMP_PROD_ID;

  --dbms_output.put_line(TMP_PROD_ID);

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '||TMP_PROD_ID;
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;
  
  dbms_output.put_line('if1_klienci_tmp');

  insert into IF1_KLIENCI_TMP
  (select   TMP_PROD_ID_SEQ.NEXTVAL,
            k.klient_kod||to_char(klient_id_seq.nextval),
            k.klient_nazwa,
            k.klient_opis,
            k.typ_klienta_prod_id,
            k.typ_klienta_kod,
            k.typ_klienta_opis, 
            k.klient_forma_org,
            k.rezydent, 
            k.kraj_prod_id,
            k.kraj_kod,
            k.kraj_poch_prod_id,
            k.kraj_poch_kod,
            k.rating,
            k.adres1,
            k.adres2, 
            k.kod_poczt,
            k.miasto, 
            k.telefon, 
            k.fax, 
            k.osoba_reprezent, 
            k.e_mail, 
            k.czy_nostro, 
            k.czy_depozytariusz, 
            k.czy_inwestor, 
            k.czy_emitent, 
            k.czy_broker, 
            k.czy_oferent, 
            k.modulo, 
            k.kod_reuters, 
            k.powiazanie_zewn, 
            k.sektor_przemyslowy_prod_id, 
            k.sektor_przemyslowy_kod, 
            k.sektor_przemyslowy_opis, 
            k.forma_prawna_prod_id, 
            k.forma_prawna_kod,
            k.forma_prawna_opis, 
            k.klient_status, 
            k.typ_relacji, 
            k.bank_prod_id, 
            k.bank_swift, 
            k.bank_kod, 
            k.bank_nazwa, 
            k.regon_pesel, 
            k.nip, 
            k.krs, 
            k.imie,
            k.nazwisko,
            k.data_aktualizacji,
            kit.k_id_new,
            k.nr_banku
        from IF1_KLIENCI k, IF1_KLIENCI_ID_TMP kit
        where k.klient_id = kit.k_id);

    commit;

  execute immediate 'SELECT MAX(NOSTRO_PROD_ID) FROM IF1_RACHUNKI_NOSTRO' into TMP_PROD_ID;

  --dbms_output.put_line(TMP_PROD_ID);
--  dbms_output.put_line('NOSTRO_PROD_ID');

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '||TMP_PROD_ID;
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;
  
  dbms_output.put_line('if1_rachunki_nostro_tmp');

  insert into IF1_RACHUNKI_NOSTRO_TMP
  (select TMP_PROD_ID_SEQ.NEXTVAL,
          r.nostro_kod||to_char(klient_id_seq.nextval),
          r.waluta_kod, 
          r.nr_konta_gl, 
          r.modulo, 
          r.uwaga, 
          kt.klient_prod_id,
          kt.klient_kod,
          r.klient_nazwa, 
          r.nr_konta_zew, 
          r.rejestr_prod_id, 
          r.obr_ma_data_przetw, 
          r.obr_wn_data_przetw, 
          r.obr_ma_data_wal, 
          r.obr_wn_data_wal, 
          r.saldo_ma_data_przetw, 
          r.saldo_wn_data_przetw, 
          r.saldo_ma_data_wal, 
          r.saldo_wn_data_wal, 
          r.data_aktualizacji, 
          rit.n_id_new,
          kit.k_id_new
    from  IF1_RACHUNKI_NOSTRO r, IF1_RACHUNKI_NOSTRO_ID_TMP rit,  IF1_KLIENCI_ID_TMP kit, IF1_KLIENCI_TMP kt
    where r.klient_id = kit.k_id
      and r.nostro_id = rit.n_id
      and kit.k_id_new = kt.klient_id);

   commit;
   
-- IF1_UMOWY

  execute immediate 'insert into IF1_UMOWY_ID_TMP (u_id, u_id_new)
  (select umowa_id, IF1_UMOWY_TMP_ID_SEQ.NEXTVAL from if1_umowy)';

  commit;

  execute immediate 'SELECT MAX(UMOWA_PROD_ID) FROM IF1_UMOWY' into TMP_PROD_ID;

  --dbms_output.put_line(TMP_PROD_ID);
  --dbms_output.put_line('UMOWA_PROD_ID');

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY '||TMP_PROD_ID;
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'select TMP_PROD_ID_SEQ.NEXTVAL from dual';
  EXECUTE IMMEDIATE sql_stmt;

  sql_stmt := 'alter sequence TMP_PROD_ID_SEQ INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_stmt;
  
  dbms_output.put_line('if1_umowy_tmp');

  insert into IF1_UMOWY_TMP
  (select   TMP_PROD_ID_SEQ.NEXTVAL,
            u.umowa_nr_ref,
            u.typ_umowy_prod_id, 
            u.typ_umowy, 
            u.typ_umowy_opis, 
            u.rodzaj_umowy,
            u.umowa_podtyp_prod_id, 
            u.umowa_podtyp_kod, 
            u.przeznaczenie_prod_id, 
            u.przeznaczenie_kod, 
            u.kup_sprzed, 
            u.data_transakcji, 
            u.data_waluty, 
            u.data_zapadalnosci, 
            u.waluta_1_prod_id, 
            u.waluta_1_kod, 
            u.nominal_1, 
            u.waluta_2_prod_id, 
            u.waluta_2_kod, 
            u.nominal_2, 
            u.wart_zakupu, 
            u.ilosc_1, 
            u.ilosc_2, 
            u.cena, 
            u.cena_100, 
            u.typ_ceny, 
            u.kurs_spot, 
            u.kurs_frwd, 
            u.prowizja, 
            u.odsetki, 
            k.klient_prod_id,
            k.klient_kod,
            u.klient_nazwa, 
            u.status, 
            u.portfolio_prod_id, 
            u.portfolio_kod, 
            u.nostro_1_prod_id, 
            u.nostro_2_prod_id, 
            u.depozytatariusz_konto_prod_id, 
            u.produkt_prod_id, 
            u.produkt_kod_isin, 
            u.produkt_data_emisji, 
            u.produkt_data_wykupu, 
            u.produkt_opis, 
            u.uwagi, 
            u.wprowadzil, 
            u.data_wprowadzenia, 
            u.weryfikowal,
            u.data_weryfikacji, 
            u.zaksiegowal, 
            u.data_zaksiegowania, 
            u.anulowal, 
            u.data_anulowania, 
            u.weryfikowal_anul, 
            u.data_weryf_anul, 
            u.dealer_nazwa, 
            u.typ_stopy_1, 
            u.stopa_poczatkowa_1, 
            u.typ_stopy_2, 
            u.stopa_poczatkowa_2, 
            u.fundusz_kod, 
            u.emitent, 
            u.modulo, 
            u.typ_transakcji_2, 
            u.data_aktualizacji, 
            uit.u_id_new,
            u.umowa_podtyp_id, 
            u.umowa_typ_id, 
            u.waluta_1_id, 
            u.waluta_2_id, 
            kit.k_id_new,
            u.nostro_1_id, 
            u.nostro_2_id, 
            u.produkt_id, 
            u.ref_zewn_um, 
            u.blokada_rodzaj, 
            u.blokada_nazwa, 
            u.czy_przeterminowany, 
            u.stopa_procentowa, 
            u.emitent_id, 
            u.emitent_prod_id, 
            u.emitent_typ_kod, 
            u.emitent_rezydent, 
            u.emitent_modulo, 
            u.emitent_kraj_kod, 
            u.kraj_emisji_kod, 
            u.klient_typ_kod, 
            u.klient_kraj_kod, 
            u.klient_rezydent, 
            u.data_nast_nal, 
            u.data_nast_zob, 
            u.odsetki_we_suma, 
            u.odsetki_wy_suma, 
            u.rej_punkty_swap, 
            u.rej_punkty_swap_wal, 
            u.rej_wycena_dcf, 
            u.rej_odsetki_wn_nalicz, 
            u.rej_odsetki_wn_nalicz_rown, 
            u.rej_odsetki_wn_nalicz_ru, 
            u.rej_odsetki_wn_nalicz_rown_ru, 
            u.rej_odsetki_ma_nalicz, 
            u.rej_odsetki_ma_nalicz_rown, 
            u.rej_odsetki_ma_nalicz_ru, 
            u.rej_odsetki_ma_nalicz_rown_ru, 
            u.rej_esp_rozn_prow, 
            u.rej_esp_rozn_prow_rown, 
            u.rej_esp_rozn_lin_bprow, 
            u.rej_esp_rozn_lin_bprow_rown, 
            u.rej_dochody_rown, 
            u.rej_koszty_rown, 
            u.rej_ilosc, 
            u.rej_nominal, 
            u.rej_odsetki_zapl, 
            u.rej_dysk_premia_zakup, 
            u.rej_dysk_premia_nalicz, 
            u.rej_dysk_premia_nalicz_rown, 
            u.rej_dysk_premia_nalicz_ru, 
            u.rej_dysk_premia_nalicz_rown_ru, 
            u.rej_prowizja, 
            u.rej_prowizja_rown, 
            u.rej_wartosc_rynkowa, 
            u.rej_wycena_v2, 
            u.rej_wycena_v2_rown, 
            u.rej_zysk, 
            u.rej_strata, 
            u.rej_blokada_ilosc, 
            u.rej_przemieszczenia_ilosc, 
            u.kurs_wal_1, 
            u.kurs_wal_1_data_zap, 
            u.kurs_wal_2, 
            u.kurs_wal_2_data_zap, 
            u.klient_nr_banku, 
            u.odsetki_wy_data_start_nast, 
            u.odsetki_we_data_start_nast, 
            u.rej_koszty, 
            u.rej_dochody, 
            u.typ_stopy_1p, 
            u.typ_stopy_2p, 
            u.stopa_1p, 
            u.stopa_2p, 
            u.nominal_3, 
            u.nominal_4, 
            u.rej_esp_rozn_lin_prow_rown, 
            u.rej_esp_rozn_lin_prow, 
            u.produkt_typ_stopy, 
            u.produkt_stopa_akt, 
            u.wart_bilansowa, 
            u.wart_bilansowa_srednia_tech, 
            u.grupa_ryzyka_id, 
            u.id_linii_kredytowej, 
            u.okres_pierw_id, 
            u.rej_linia_kredytowa, 
            u.linia_kred_odnaw, 
            u.noga_bazowa, 
            u.rej_wycena_ext, 
            u.rej_koszty_wycena_v2,
            u.rej_dochody_wycena_v2, 
            u.rej_strata_wycena_dcf, 
            u.rej_zysk_wycena_dcf, 
            u.rej_koszty_eir1, 
            u.prod_ref_id, 
            u.prod_ref_type, 
            u.umowa_prod_ref_id, 
            u.data_zamkniecia_umowy, 
            u.data_nast_przeszac
      from  IF1_UMOWY u, IF1_UMOWY_ID_TMP uit, IF1_KLIENCI_TMP k, IF1_KLIENCI_ID_TMP kit
     where  u.umowa_id = uit.u_id
       and  u.klient_id = kit.k_id
       and  kit.k_id_new = k.klient_id);

    commit;

--CC
    dbms_output.put_line('cc_karty_platnicze_tmp');

    insert into CC_KARTY_PLATNICZE_TMP
    (select c.stat_grstat_typ,
            c.stat_grstat_kod,
            c.stat_grstat_opis, 
            c.trwk_kod, 
            c.trwk_opis, 
            c.tykrt_typ, 
            c.tywyka_kod,
            c.tywyka_opis, 
            c.stat_kod, 
            c.bank_id_banku, 
            TMP_CC_NR_KARTY_SEQ.NEXTVAL,
            c.data_waznosci, 
            c.nazwa_na_karte, 
            c.rodzaj_karty, 
            c.limit_gotowkowy, 
            c.limit_zakupow, 
            c.limit_ogolny, 
            c.data_zastrzezenia, 
            c.osupr_pos_id, 
            c.osupr_pos_id_upr, 
            c.osupr_rapo_id, 
            c.poprzedni_numer_karty, 
            c.wnio_id, 
            c.zdjecie, 
            c.do_wznowienia, 
            c.data_generacji, 
            c.data_pin, 
            c.oplata_za_wydanie, 
            c.oplata_za_uzytkowanie, 
            c.oplata_za_wznowienie, 
            c.data_odbioru, 
            c.uwagi, 
            c.data_zgloszenia, 
            c.data_pocz_waznosci, 
            c.data_zm_stat, 
            c.aktywny, 
            c.data_zgl_rezygnacji, 
            c.czy_pobr_opl_stala, 
            c.data_deaktywacji, 
            c.dat_zm_statusu, 
            c.duplikat_do_generacji, 
            c.id_gold, 
            c.nazwa_na_karte_pos_rach, 
            c.nazwa_pliku_zastrz, 
            c.oplata_za_wyc_pk, 
            c.oplata_za_wyc_pr, 
            c.wyciag_pos_karty, 
            c.wyciag_pos_rach, 
            c.zmiana_pin, 
            c.adresat_wyciagu, 
            c.data_wzn_gold_card, 
            c.gold_card_do_gen, 
            c.przyczyna_zastrz, 
            c.id_posiadacza_prod, 
            kt.klient_prod_id,
            c.rodzaj_posiadacza, 
            ut.umowa_prod_id,
            c.data_wniosku, 
            c.modul_wprowadzajacy, 
            c.data_aktualizacji, 
            cit.c_ID_NEW,
            uit.um_id_new,
            kit.kl_id_new,
            c.numer_umowy, 
            c.data_aktywacji
      from  CC_KARTY_PLATNICZE c, CC_KARTY_PLATNICZE_ID_TMP cit, KLIENCI_ID_TMP kit, UMOWY_ID_TMP uit, KLIENCI_TMP kt, UMOWY_TMP ut
      where c.cc_karta_id = cit.c_id
        and c.umowa_id = uit.um_id (+)
        and c.klient_id = kit.kl_id (+)
        and kt.klient_id (+) = kit.kl_id_new
        and ut.umowa_id (+) = uit.um_id_new);

     commit; */

--  execute immediate 'SELECT TMP_PROD_ID_SEQ.NEXTVAL FROM dual';

--  execute immediate 'SELECT TMP_NR_UM_SEQ.NEXTVAL FROM dual';
  --powielanie danych
end loop;
  --COMMIT;
  exception 
  when others then 
  dbms_output.put_line(SQLERRM);
  rollback;
  
END;
/

--poszerzenie wielkoœci szerokoœci kolumn w poszczególnych tabelach
/*
declare
  len number;
begin
     SELECT to_number(DATA_LENGTH + 5) into len FROM user_tab_columns WHERE column_name = 'KLIENT_KOD' AND TABLE_NAME = 'IF1_KLIENCI';
     EXECUTE IMMEDIATE 'alter table if1_klienci modify klient_kod VARCHAR2('|| len ||')';
     
     SELECT to_number(DATA_LENGTH + 5) into len FROM user_tab_columns WHERE column_name = 'NOSTRO_KOD' AND TABLE_NAME = 'IF1_RACHUNKI_NOSTRO';
     EXECUTE IMMEDIATE 'alter table if1_klienci modify klient_kod VARCHAR2('|| len ||')';
END;
/
*/
/*
insert into klienci (select * from klienci_TMP);
commit;
insert into ANALITYKA (select * from ANALITYKA_TMP);
commit;
insert into UMOWY (select * from UMOWY_TMP);
commit;
insert into WNIOSKI (select * from WNIOSKI_TMP);
commit;
insert into ANEKSY (select * from ANEKSY_TMP);
commit;
insert into UMOWY_HARMONOGRAMY (select * from UMOWY_HARMONOGRAMY_TMP);
commit;
insert into umowy_harm_pozycje (select * from umowy_harm_pozycje_TMP);
commit;
insert into DOKUMENTY (select * from DOKUMENTY_TMP);
commit;
insert into DEKRETY (select * from DEKRETY_TMP);
commit;
insert into UMOWY_REJESTRY (select * from UMOWY_REJESTRY_TMP);
commit;
insert into IF1_KLIENCI (select * from IF1_KLIENCI_TMP);
commit;
insert into IF1_RACHUNKI_NOSTRO (select * from IF1_RACHUNKI_NOSTRO_TMP);
commit;
insert into IF1_UMOWY (select * from IF1_UMOWY_TMP);
commit;
insert into CC_KARTY_PLATNICZE (select * from CC_KARTY_PLATNICZE_TMP);
commit; */

commit;
 -- drop table KLIENCI_TMP;
 -- drop table ANALITYKA_TMP;
 -- drop sequence TMP_PROD_ID_SEQ;
 -- drop table wnioski_tmp;
 -- drop table umowy_tmp;

COMMIT;

spool off;

--@drop_tab;



