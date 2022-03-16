
from flask import render_template, redirect, session, request, flash
from flask_app import app

from flask_app.models.ninja import Ninja
from flask_app.models.dojo import Dojo



@app.route("/addNinja")
def addNinja():
    dojos=Dojo.get_all()

    return render_template("add_ninja.html", dojos=dojos)

@app.route("/addNinjaConfirm", methods=["POST"])
def addNinjaConfirm():
    Ninja.save(request.form)

    return redirect("/dojos")
