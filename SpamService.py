from flask import Blueprint, jsonify, request, Flask
from twilio.rest import Client

from Model import Model

spam_service = Blueprint('spam_service', __name__)
main = Flask( __name__)

@main.route('/static/<filename>', methods = ['GET'])
def root(filename):
    val = main.send_static_file(filename)
    return val

@spam_service.route('/get_spam', methods=['PUT'])
def determineSpam():
    input = request.json
    text = input['text']
    SpamModel = Model("spam.csv")
    output = SpamModel.predict(text)
    if (output == 'ham'):
        result = {'label': False}
    else:
        result = {'label': True}
    return jsonify(result)

@spam_service.route('/number', methods = ['PUT'])
def sendMessage():
    input = request.json
    number = input['number']
    text = input['text']
    account_sid = "AC4c2afe024568679028027bc192bedd85"
    auth_token  = "c93eecd2fd624f235b6144dc12ffd859"
    client = Client(account_sid, auth_token)
    message = client.messages.create(
        to=f'+1{number}',
        from_="+12058582783",
        body=text
    )
    result = {}
    result['message'] = 'hi'
    return jsonify(result)