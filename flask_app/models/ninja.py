from flask_app.config.mysqlconnection import connectToMySQL


from flask import flash

class Ninja:
    def __init__(self, data):
        self.id = data["id"]
        self.first_name = data["first_name"]
        self.last_name = data["last_name"]
        self.age = data["age"]
        self.created_at = data["created_at"]
        self.updated_at = data["updated_at"]

    @classmethod
    def save(cls, formulario):
        #formulario = {
        #     "first_name": "Elena",
        #     "last_name": "De Troya",
        #     "email": "elena@cd.com",
        #     "password": "91289128snkndsaajdyasdl"
        # }
        query = "INSERT INTO ninjas (first_name, last_name, age, dojo_id) VALUES (%(first_name)s, %(last_name)s, %(age)s, %(dojo_id)s)"
        nuevoId = connectToMySQL('esquema_dojos_y_ninjas').query_db(query, formulario)
        return nuevoId
    
    @classmethod
    def get_all(cls):
        query="SELECT * FROM ninjas"
        result= connectToMySQL('esquema_dojos_y_ninjas').query_db(query)
        ninjas_arr=[]
        for i in result:
            ninjas_arr.append(cls(i))
        return ninjas_arr

    