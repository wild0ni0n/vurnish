from flask import Flask, jsonify, request, render_template
import requests
import os
app = Flask(__name__)

@app.route('/', methods=['GET'])
def main():
    return open(__file__).read()

@app.route('/debug', methods=['GET', 'POST'])
def debug():
    headers = {}
    for header in request.headers:
        headers[header[0]] = header[1]
    return jsonify(body=request.data.decode('utf-8'), headers=headers)

@app.route('/flag', methods=['GET', 'POST'])
def flag():
    url = request.args.get("url", type=str) or None
    if url:
        requests.post(url, data={"flag": os.environ['FLAG']})
    resp = "hello ;)"
    return resp

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
