from flask_app.config.mysqlconnection import connectToMySQL

from flask import flash
from flask_app.models.ninja import Ninja

class Dojo:
    def __init__(self, data):
        self.id = data["id"]
        self.name = data["name"]
        self.created_at = data["created_at"]
        self.updated_at = data["updated_at"]

        self.ninjas=[]
# clssmethod
# Crear una función que me rregre todos lso DOJOS
# return lista de obj

    @classmethod
    def get_all(cls):
        query="SELECT * FROM dojos"
        result= connectToMySQL('esquema_dojos_y_ninjas').query_db(query)
        dojos_arr=[]
        for i in result:
            dojos_arr.append(cls(i))
        return dojos_arr

    @classmethod
    def save(cls, formulario):
        query = "INSERT INTO dojos (name) VALUES (%(name)s)"
        result = connectToMySQL('esquema_dojos_y_ninjas').query_db(query, formulario)
        return result

    @classmethod
    def get_one_with_ninjas(cls, data ):
        query = "SELECT * FROM dojos LEFT JOIN ninjas ON dojos.id = ninjas.dojo_id WHERE dojos.id = %(id)s;"
        results = connectToMySQL('esquema_dojos_y_ninjas').query_db(query,data)
        print(results)
        dojo = cls(results[0])
        print(dojo)
        for row in results:
            n = {
                'id': row['ninjas.id'],
                'first_name': row['first_name'],
                'last_name': row['last_name'],
                'age': row['age'],
                'created_at': row['ninjas.created_at'],
                'updated_at': row['ninjas.updated_at']
            }
            dojo.ninjas.append(Ninja(n))

        return dojo