from flask import Flask, render_template, render_template_string
import pandas as pd
import os

app = Flask(__name__)

CSV_PATH = os.getenv("CSV_PATH","name.csv")

@app.route("/")
def index():
    return  render_template("index.html", csv_path=CSV_PATH)

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
