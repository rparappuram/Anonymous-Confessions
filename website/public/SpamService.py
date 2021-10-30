from bs4 import BeautifulSoup
from flask import Blueprint, jsonify, request

from Model import Model

spam_service = Blueprint('spam_service', __name__)

@spam_service.route('/get_spam', methods=['PUT'])
def textCompare1():
    input = request.json
    text = input['text']
    text = BeautifulSoup(text, "lxml").text
    SpamModel = Model("spam.csv")
    output = SpamModel.predict(text)
    result = {}
    result['label'] = output[0]
    return jsonify(result)