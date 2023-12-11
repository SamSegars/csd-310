from mysql.connector import errorcode
import mysql.connector.conversion
from datetime import datetime

#Question #3: Employee time. During the last four quarters, how many hours did each employee work?
#A report on the hours each employee worked during the last four quarters.

conn = {
    "user": "bacchusWinery",
    "password": "password",
    "host": "127.0.0.1",
    "database": "bacchus",
    "raise_on_warnings": True
}
try:
    db = mysql.connector.connect(**conn)
    cursor = db.cursor()

    print("Connected...")
    input("Press any key to continue...")

    cursor.execute("SELECT employee_id, SUM(hours) AS TotalHours FROM hours GROUP BY employee_id ")

    results = cursor.fetchall()

    employeeArray = ['Employee ID', 'Hours Worked']
    current = datetime.now()

    print(" -- Hours Worked Report --")
    print("Pulled on: {}".format(current.ctime()))

    for row in results:
        pullArr = []

        for entry in row:
            pullArr.append(entry)
        i = 0
        print(" ")

        for entry in pullArr:
            print(employeeArray[i] + ': ' + str(entry))
            i += 1

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("The supplied username or password is invalid")

    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("The specified database does not exist")

    else:
        print(err)
