from flask import Flask
import os, sys

app = Flask(__name__)
var = 'APP_MSG'
msg = os.environ[var] if var in os.environ else 'APP_MSG environment variable not set!'

print('going to print:', msg, file=sys.stderr)

@app.route("/")
def hello():
    return msg
