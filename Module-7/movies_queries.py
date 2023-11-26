# Sam Segars
# CSD-310
# 11/26/2023
# Code used from Module 6 Assignment 
#Objective: Query Tables from Database to retrieve data using python.
import mysql.connector
from mysql.connector import errorcode

config = {
    "user": "movies_user",
    "password": "popcorn",
    "host": "127.0.0.1",
    "database": "movies",
    "raise_on_warnings": True
}
try:
    db = mysql.connector.connect(**config)


    print("\n Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"],config["database"]))

    input("\n\n Press any key to continue...")
    
    #Creates Cursor Object
    cursor = db.cursor()
    #Executes the Query using the cursor
    cursor.execute("select studio_id, studio_name  from studio;")
    #Assigns the results of query to a variable for later use
    studios = cursor.fetchall()
    
    cursor.execute("select genre_id, genre_name from genre;")
    genres = cursor.fetchall()

    cursor.execute("select film_name, film_runtime from film where film_runtime < 120;")
    runtimes = cursor.fetchall()
    
    cursor.execute("select film_name, film_director from film order by film_director;")
    directors = cursor.fetchall()

    print("Studio Records:\n")
    #Iterates through each entry in studios variable (from the query) to deliver data in a formatted manner.
    for studio in studios:
        print("Studio ID: {}\nStudio Name: {} \n".format(studio[0], studio[1]))

    print("Genre Records:\n")
    for genre in genres:
        print("Genre ID: {}\nGenre Name: {} \n".format(genre[0], genre[1]))
    
    print("Runtime Records:\n")
    for runtime in runtimes:
        print("Movie Name: {}\nRuntime: {}\n".format(runtime[0],runtime[1]))
    
    print("Director Records:\n")
    for director in directors:
        print("Movie Name: {}\nDirector: {}\n".format(director[0], director[1]))

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print(" The supplied username or password is invalid")

    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print(" The specified database does not exist")

    else:
        print(err)

finally:
    db.close()