from flask import Flask, render_template, request
from sqlalchemy import text
from database import engineer, connect, serialize
import json

app = Flask(__name__)


@app.route('/app')
def app():
    return render_template('../lib/main.dart')
    # return f"<p>Hello, {name}</p>"


######################################################################################################################################
# GROUPE 1
######################################################################################################################################

# 1- Lister le nom et le prénom des musiciens, ordonnées par leur date de naissance
# SELECT first_name. last_name, birthdate FROM artist ORDER BY birthdate ASC
@app.route("/names_and_birthdate")
def names_and_birthdate():
    fields = ['first_name', 'last_name', 'birthdate']
    with connect(engineer()) as connector:
        result = connector.execute(
            text(f"SELECT {','.join(fields)} FROM artist ORDER BY birthdate ASC"))
    response = [data for data in result.all()]
    return render_template('/groupe1/01names_and_birthdate.html', response=response)
