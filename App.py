from flask import Flask

from SpamService import spam_service

def create_app():
    app = Flask(__name__)
    app.register_blueprint(spam_service)
    return app