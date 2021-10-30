from flask import Flask

def create_app():
    app = Flask(__name__)
    from SpamService import spam_service
    app.register_blueprint(spam_service)
    return app