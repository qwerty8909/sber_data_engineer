import psycopg2
import psycopg2.extras as extras
import pandas as pd
import numpy as np

# подключаемся к серверу
conn = psycopg2.connect(database = "edu",
                        host = "de-edu-db.chronosavant.ru",
                        user = "de11an",
                        password = "peregrintook",
                        port = "5432")
conn.autocommit = False
cursor = conn.cursor()

# берем таблицу med_name
cursor.execute("select * from de.med_name")
med_name = cursor.fetchall()
med_name = pd.DataFrame(med_name, columns=['id', 'name', 'phone'])
# берем таблицу med_an_name
cursor.execute("select * from de.med_an_name")
med_an_name = cursor.fetchall()
med_an_name = pd.DataFrame(med_an_name, columns=['id', 'name', 'is_simple', 'min_value', 'max_value'])
# берем 2 таблицы medicine.xlsx
sheet_easy = pd.read_excel( 'medicine.xlsx', sheet_name='easy', header=0, index_col=None )
sheet_hard = pd.read_excel( 'medicine.xlsx', sheet_name='hard', header=0, index_col=None )

# странно, приведение типов в столбце не помогает, сделал через замену числа на строку в ячейке
sheet_easy.loc[sheet_easy["Анализ"] == 890, "Анализ"] = "890"
sheet_hard.loc[sheet_hard["Анализ"] == 890, "Анализ"] = "890"
# переименовываем столбцы для объединения
med_name.rename(columns={'id':'Код пациента'}, inplace=True)
med_an_name.rename(columns={'id':'Анализ', 'name':'name_an'}, inplace=True)

# объединяем таблицы
df1 = pd.merge(med_name, sheet_easy, on = 'Код пациента', how = 'left')
df2 = pd.merge(df1, med_an_name, on = 'Анализ', how = 'left')

# создаем столбец с результатом анализа
conditions = [
    (df2 ['Значение'] < df2 ['min_value']),
    (df2 ['Значение'] > df2 ['max_value']),
    ((df2 ['Значение'] >= df2 ['min_value'])&(df2 ['Значение'] <= df2 ['max_value']))
]
values = ['Понижен', 'Повышен', 'Норма']
df2['result'] = np.select(conditions, values)

# создаем таблицу с выборкой
df_final = df2[['phone', 'name', 'name_an', 'result']]
df_final = df_final[(df_final ['result'] != 'Норма')]

# сохраняем в файл
df_final.to_excel( 'med_results_easy.xlsx', sheet_name='sheet1', header=True, index=False )

# сохраняем в базу на сервере
def execute_values(conn, df, table):
    tuples = [tuple(x) for x in df.to_numpy()]
    cols = ','.join(list(df.columns))
    query = "INSERT INTO %s(%s) VALUES %%s" % (table, cols)
    cursor = conn.cursor()
    try:
        extras.execute_values(cursor, query, tuples)
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print("Error: %s" % error)
        conn.rollback()
        cursor.close()
        return 1
    cursor.close()

sql = '''CREATE TABLE de11an.kore_med_results_easy(phone varchar(20),name varchar(50), name_an varchar(50), result varchar(10));'''
cursor.execute(sql)
execute_values(conn, df_final, 'de11an.kore_med_results_easy')

# отключаемся
conn.commit()
cursor.close()
conn.close()