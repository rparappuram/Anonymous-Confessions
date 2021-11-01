import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:provider/provider.dart';

import '../providers/input_providers.dart';

class SendConfessionButton extends StatefulWidget {
  const SendConfessionButton({Key? key}) : super(key: key);

  @override
  _SendConfessionButtonState createState() => _SendConfessionButtonState();
}

class _SendConfessionButtonState extends State<SendConfessionButton> with SingleTickerProviderStateMixin{

  final _duration = Duration(milliseconds: 250);
  late SizeTween _sizeAnimate;

  late AnimationController _controller;
  late CurvedAnimation _animation;

  // on hover checks
  bool _isActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: _duration
    )..addListener(() {setState(() {
      
    });});

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  }


  @override
  Widget build(BuildContext context) {

    TextEditingController _textProviderNumber = Provider.of<InputProviders>(context).getTextCN;
    TextEditingController _textProviderMessage = Provider.of<InputProviders>(context).getTextCM;

    _sizeAnimate = _sizeAnimate = SizeTween(
        begin: Size(
            275,
            50
        ),
      end: Size(
          250,
          45
      )
    );


    return Container(
      height: 75,
      width: 300,
      child: Center(
        child: GestureDetector(
          onTapDown: (_) {
            _isActive = !_isActive;
            _controller.forward();
          },
          onTapUp: (_) {
            _isActive = !_isActive;
            _controller.reverse();
            showDialog<String>(
              context: context,
              builder: (BuildContext context) {


                bool isSpam = _textProviderMessage.text.contains('FREE');
                String l1 = (isSpam) ? 'Spam detected!\nCannot send message' : 'Confession sent to ${_textProviderNumber.text}!\nSend another confession?';
                String l2 = (isSpam) ? 'Try again' : 'Yes!';
                String l3 = (isSpam) ? 'Spam Detected!' : 'Confession Sent!';

                return AlertDialog(
                backgroundColor: Colors.black54,
                title: Text(l3,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                content: Text(l1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      _textProviderMessage.clear();
                      Navigator.pop(context, 'Yes!');
                    },
                    child: Text(l2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.green,
                    ),),
                  ),
                ],
              );}
            );
          },
          child: Container(
            width: _sizeAnimate.evaluate(_animation)!.width,
            height: _sizeAnimate.evaluate(_animation)!.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(48, 184, 111,1.0)
            ),
            child: Center(
                child: Text(
                    'Send Confession!',
                  style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
            ),
          ),


        ),
      ),
    );
  }
}

class _buildPopUpDialog {
}


