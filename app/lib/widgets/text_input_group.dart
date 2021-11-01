import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twilio_app_hack/widgets/animated_text_input.dart';

import '../providers/input_providers.dart';
import '../widgets/send_confession_btn.dart';

class TextInputGroup extends StatefulWidget {
  const TextInputGroup({Key? key}) : super(key: key);

  @override
  _TextInputGroupState createState() => _TextInputGroupState();
}

class _TextInputGroupState extends State<TextInputGroup> {



  @override
  Widget build(BuildContext context) {

    final _textControllerNumber = Provider.of<InputProviders>(context).getTextCN;
    final _textControllerMessage = Provider.of<InputProviders>(context).getTextCM;

    return Column(
      children: [
        AnimatedTextInput(_textControllerNumber, 'num'),
        Container(height: 15,),
        AnimatedTextInput(_textControllerMessage, 'mes'),
        Container(height: 10,),
      ],
    );
  }
}
