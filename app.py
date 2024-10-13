from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def hello():
    greeting_message = "Merhaba ArgoCD v3"
    return render_template('index.html', message=greeting_message)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
