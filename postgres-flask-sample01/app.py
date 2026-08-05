from flask import Flask, render_template, render_template_string
# import pandas as pd
import psycopg2
import os

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASS = os.getenv("DB_PASS")


@app.route("/")
def index():

    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASS
        )

        cur = conn.cursor()
        cur.execute ("SELECT * FROM people;")
        rows = cur.fetchall()
        cur.close()
        conn.close()

        html = "<h3> Data from PostgreSQL </h3> <table border='1'>"
        for row in rows:
            html += "<tr>" + "".join([f"<td>{str(cell)}</td>" for cell in row]) + "</tr>"
        html += "</table>"
        return html
    except Exception as e:
        return f"<p> Error: {str(e)}</p>"

@app.route("/health")
def health ():
    return {"status" : "ok"}, 200


# data will come later
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5004)
