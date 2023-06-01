from flask import Flask
import time

app = Flask(__name__)

@app.route('/clock')
def clock():
    timestamp = time.time()
    return str(timestamp)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

