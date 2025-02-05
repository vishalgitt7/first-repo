from flask import Flask, render_template
import os

app = Flask(__name__, static_folder='static')

@app.route("/")
def home():
    return render_template("index.html")

if __name__ == "__main__":
    print(f"Current environment: {os.getenv('FLASK_ENV', 'production')}")
    
    from waitress import serve  # Waitress for production
    
    env = os.getenv("FLASK_ENV", "production")
    
    print("Running with Waitress WSGI server...")
    serve(app, host="0.0.0.0", port=8000)



