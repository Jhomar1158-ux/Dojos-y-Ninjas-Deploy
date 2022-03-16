
from flask import render_template, redirect, session, request, flash
from flask_app import app

from flask_app.models.ninja import Ninja
from flask_app.models.dojo import Dojo

@app.route("/dojos")
def index():
    dojos_here=Dojo.get_all()
    return render_template('index.html', dojos_here=dojos_here)


@app.route("/dojoRegistro", methods=["POST"])
def dojoRegistro():
    print(request.form)
    Dojo.save(request.form)
    return redirect("/dojos")


@app.route("/dojoShow/<int:id>")
def dojoShow(id):
    data={
        "id":id
    }
    dojo=Dojo.get_one_with_ninjas(data)
    print("===")
    print(dojo)
    return render_template("show_dojo.html", dojo=dojo)

