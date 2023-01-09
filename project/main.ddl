/* Удаление таблиц
DROP TABLE de11an.kore_stg_transactions;
DROP TABLE de11an.kore_stg_terminals;
DROP TABLE de11an.kore_stg_passport_blacklist;
DROP TABLE de11an.kore_stg_cards;
DROP TABLE de11an.kore_stg_accounts;
DROP TABLE de11an.kore_stg_clients;
DROP TABLE de11an.kore_dwh_fact_transactions;
DROP TABLE de11an.kore_dwh_fact_passport_blacklist;
DROP TABLE de11an.kore_dwh_dim_terminals_hist;
DROP TABLE de11an.kore_dwh_dim_cards_hist;
DROP TABLE de11an.kore_dwh_dim_accounts_hist;
DROP TABLE de11an.kore_dwh_dim_clients_hist;
DROP TABLE de11an.kore_rep_fraud;
*/

-- стэйджинг
create table de11an.kore_stg_transactions (
    trans_id varchar,
    trans_date date,
    card_num varchar,
    oper_type varchar,
    amt decimal,
    oper_result varchar,
    terminal varchar
);

create table de11an.kore_stg_terminals (
    terminal_id varchar,
    terminal_type varchar,
    terminal_city varchar,
    terminal_address varchar
);

create table de11an.kore_stg_passport_blacklist (
    passport_num varchar,
    entry_dt date
);

create table de11an.kore_stg_cards (
    card_num varchar,
    account_num varchar
);

create table de11an.kore_stg_accounts (
    account_num varchar,
    valid_to date,
    client varchar
);

create table de11an.kore_stg_clients (
    client_id varchar,
    last_name varchar,
    first_name varchar,
    patronymic varchar,
    date_of_birth date,
    passport_num varchar,
    passport_valid_to date,
    phone varchar
);

-- факты
create table de11an.kore_dwh_fact_transactions (
    trans_id varchar,
    trans_date date,
    card_num varchar,
    oper_type varchar,
    amt decimal,
    oper_result varchar,
    terminal varchar
);

create table de11an.kore_dwh_fact_passport_blacklist (
    passport_num varchar,
    entry_dt date
);

-- измерения
create table de11an.kore_dwh_dim_terminals_hist (
    terminal_id varchar,
    terminal_type varchar,
    terminal_city varchar,
    terminal_address varchar,
    effective_from timestamp,
    effective_to timestamp default to_timestamp('2999-12-31', 'YYYY-MM-DD'),
    delete_flg char(1)
);

create table de11an.kore_dwh_dim_cards_hist (
    card_num varchar,
    account_num varchar,
    effective_from timestamp,
    effective_to timestamp default to_timestamp ('2999-12-31', 'YYYY-MM-DD'),
    delete_flg char(1)
);

create table de11an.kore_dwh_dim_accounts_hist (
    account_num varchar,
    valid_to date,
    client varchar,
    effective_from timestamp,
    effective_to timestamp default to_timestamp ('2999-12-31', 'YYYY-MM-DD'),
    delete_flg char(1)
);

create table de11an.kore_dwh_dim_clients_hist (
    client_id varchar,
    last_name varchar,
    first_name varchar,
    patronymic varchar,
    date_of_birth date,
    passport_num varchar,
    passport_valid_to date,
    phone varchar,
    effective_from timestamp,
    effective_to timestamp default to_timestamp ('2999-12-31', 'YYYY-MM-DD'),
    delete_flg char(1)
);

-- отчет
create table de11an.kore_rep_fraud (
    event_dt date,
    passport varchar,
    fio varchar,
    phone varchar,
    event_type integer,
    report_dt date
);

----------------------------------------------------------------
-- Создание удалений "Терминалы"
create table demipt3.mknn_dwh_stg_terminals_del(
    terminal_id varchar)

-- Создание метаданных "Карты"
create table demipt3.mknn_meta_cards(
    max_update_dt timestamp(0));
insert into demipt3.mknn_meta_cards(max_update_dt)
values (to_timestamp('1900-01-01', 'YYYY-MM-DD'));

-- Создание удалений "Аккаунты"
create table demipt3.mknn_dwh_stg_accounts_del(
    account varchar)
-- Создание метаданных "Аккаунты"
create table demipt3.mknn_meta_accounts(
    max_update_dt timestamp(0));
insert into demipt3.mknn_meta_accounts(max_update_dt)
values (to_timestamp('1899-12-31', 'YYYY-MM-DD'));