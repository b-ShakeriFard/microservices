from flask import Flask, render_template
import psycopg2
import os

app = Flask(__name__)

DB_CONFIG = {
        "dbname": os.getenv("DB_NAME"), 
        "user": os.getenv("DB_USER"),
        "password": os.getenv("DB_PASSWORD"),
        "host": os.getenv("DB_HOST")
}

def get_db_connection():
    return psycopg2.connect(**DB_CONFIG)

@app.route("/")
def index():
    conn = get_db_connection()
    cur = conn.cursor()


    #  cur = conn.cursor()
    cur.execute("""
        SELECT id, title, category, duration, recurrence, status
        FROM tasks
        ORDER BY created_at DESC;
        """)

    rows = cur.fetchall()

    cur.close()
    conn.close()

    tasks = [
        {
            "id": r[0],
            "title": r[1],
            "category": r[2],
            "duration": r[3],
            "recurrence": r[4],
            "status": r[5],
        }
        for r in rows
    ]

    return render_template("index.html", tasks=tasks)

if __name__ == "__main__":
    app.run(
            host="0.0.0.0",
            port=5004,
            debug=True)


