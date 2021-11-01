import 'package:flutter/cupertino.dart';

class InputProviders with ChangeNotifier {
  final _textControllerNumber = TextEditingController();
  final _textControllerMessage = TextEditingController();

   String get getNumberText {
     return _textControllerNumber.text;
   }

   String get getMessageText {
     return _textControllerMessage.text;
   }

   TextEditingController get getTextCN {
     return _textControllerNumber;
   }

   TextEditingController get getTextCM {
     return _textControllerMessage;
   }

   void clearCM() {
     _textControllerMessage.text = '';
   }
}