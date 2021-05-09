import csv
import psycopg2

conn = psycopg2.connect("host=localhost dbname=zno_db user=postgres password = pgAdmin port=5432")
cur = conn.cursor()

query1 = '''
    SELECT Location.RegName, Test.TestYear, min(Test.Ball100)
    FROM Test JOIN Person ON
        Test.OUTID = Person.OUTID
    JOIN Location ON
        Person.LocationId = Location.LocationId
    WHERE Test.SubjectName = 'Фізика' AND
        Test.Status = 'Зараховано'
    GROUP BY Location.RegName, Test.TestYear
    '''
cursor.execute(query1)
with open('result.csv', 'w', encoding="utf-8") as result:
    writer = csv.writer(result)
    writer.writerow(['Область', 'Мінімальний бал', 'Рік'])
    row = cur.fetchone()
    while row:
        writer.writerow(row)
        row = cur.fetchone()
        
#conn.commit()
cur.close()
conn.close()
