from flask import Flask, render_template, render_template_string
import pandas as pd
import psycopg2
import os

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST", "name-postgres-service")
DB_NAME = os.getenv("DB_NAME", "name_db")
DB_USER = os.getenv("DB_USER", "name_user")
DB_PASS = os.getenv("DB_PASS", "name_pass")


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
        cur.execute ("SELECT * FROM name_table;")
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

@app.route("/data")
def show_data():
    try:
        df = pd.read_csv("name.csv", engine="python")
        print(df.head(5))
        print((os.path.getsize("name.csv")))
        html_table = df.head(10).to_html(classes="data-table", index=False)
        return render_template("index.html",csv_path=CSV_PATH, table=html_table)
    except Exception as e:
        return render_template("index.html", csv_path=CSV_PATH, table=f"<p> Error: {e}</p>")

# data will come later
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5004)
