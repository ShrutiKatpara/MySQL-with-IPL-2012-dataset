import mysql.connector
from mysql.connector import Error
import pandas as pd
from queries import *

def create_server_connection(host_name, user_name, user_password):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password
        )
        print("MySQL Database connection successful")
    except Error as err:
        print(f"Error: '{err}'")

    return connection

def create_db_connection(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=db_name
        )
        print("MySQL Database connection successful")
    except Error as err:
        print(f"Error: '{err}'")

    return connection

def create_database(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print("Database created successfully")
    except Error as err:
        print(f"Error: '{err}'")

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query successful")
    except Error as err:
        print(f"Error: '{err}'")

pw = "$$$Mtar2022"

connection = create_server_connection("localhost", "root", pw)

create_db_mydb = """create database assignment3;"""

db = create_database(connection, create_db_mydb)

connection = create_db_connection("localhost", "root", pw, db) # Connect to the Database

execute_query(connection, use_assignment3)

execute_query(connection, "SET GLOBAL local_infile=1;")

execute_query(connection, create_table_batsman_scored)

execute_query(connection, load_csv_batsman_scored)

execute_query(connection, "describe batsman_scored;")