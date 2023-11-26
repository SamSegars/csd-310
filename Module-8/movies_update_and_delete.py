# Sam Segars
# CSD-310
# 11/26/2023
# Code used from Module 6 and 8 Assignments 
#Objective: Query Tables and perform various changes.
import mysql.connector
from mysql.connector import errorcode

def show_films(cursor, title):
    cursor.execute("select film_name as Name, film_director as Director, genre_name as Genre, studio_name as 'Studio Name' from film inner join genre on film.genre_id=genre.genre_id inner join studio on film.studio_id=studio.studio_id;")

    films = cursor.fetchall()

    print("\n --{} --".format(title) )
    for film in films:
        print("Film Name: {}\nDirector: {}\nGenre Name ID: {}\nStudio Name: {}\n".format(film[0],film[1],film[2],film[3]))

config = {
    "user": "movies_user",
    "password": "popcorn",
    "host": "127.0.0.1",
    "database": "movies",
    "raise_on_warnings": True
}
try:
    db = mysql.connector.connect(**config)
    cursor = db.cursor()
    print("\n Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"],config["database"]))

    input("\n\n Press any key to continue...")

    show_films(cursor,"DISPLAYING FILMS")
    cursor.execute("INSERT INTO film (film_director, film_name, film_releaseDate, film_runtime, genre_id, studio_id) VALUES ('David Leitch', 'Deadpool 2', 2018, 119, 3, 1);")
    show_films(cursor, "DISPLAYING FILMS AFTER INSERT")
    
    cursor.execute("Update film set genre_id = 1 where film_id = 2;")
    show_films(cursor,"DISPLAYING FILMS AFTER UPDATE - Changed Alien to Horror")
    
    cursor.execute("DELETE FROM film where film_id = 1;")
    show_films(cursor,"DISPLAYING FILMS AFTER DELETE")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print(" The supplied username or password is invalid")

    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print(" The specified database does not exist")

    else:
        print(err)
finally:
    db.close()