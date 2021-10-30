from flask import Blueprint, jsonify, request
from twilio.rest import Client

from Model import Model

spam_service = Blueprint('spam_service', __name__)

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
    message = input['message']
    account_sid = "AC4c2afe024568679028027bc192bedd85"
    auth_token  = "226fe866c6e822abffd193a1be62b767"
    client = Client(account_sid, auth_token)
    message = client.messages.create(
        to=f'+1{number}',
        from_="+12058582783",
        body=message
    )
    result = {}
    result['message'] = 'hi'
    return jsonify(result)