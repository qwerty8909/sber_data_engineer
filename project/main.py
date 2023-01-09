#!/usr/bin/python3

import os
import psycopg2
import pandas as pd

# подключения к БД
connection_bnk = psycopg2.connect(
    database = "bank",
    host = "de-edu-db.chronosavant.ru",
    port = "5432",
    user = "bank_etl",
    password = "bank_etl_password"
)

connection_edu = psycopg2.connect(
    database = "edu",
    host = "de-edu-db.chronosavant.ru",
    port = "5432",
    user = "de11an",
    password = "perigrintook"
)

# отключение автокоммита
connection_bnk.autocommit = False
connection_edu.autocommit = False
# создание курсоров
cursor_bnk = connection_bnk.cursor()
cursor_edu = connection_edu.cursor()