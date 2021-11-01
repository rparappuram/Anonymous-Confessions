import 'package:flutter/material.dart';
import 'package:twilio_app_hack/providers/input_providers.dart';

class AnimatedTextInput extends StatefulWidget {

  TextEditingController controller;
  String type;

  AnimatedTextInput(this.controller,this.type);

  @override
  _AnimatedTextInputState createState() => _AnimatedTextInputState(controller, type);
}

class _AnimatedTextInputState extends State<AnimatedTextInput>
with SingleTickerProviderStateMixin {

  TextEditingController _textInputController;
  String  _type;

  _AnimatedTextInputState(this._textInputController, this._type);

  late ColorTween _colorTween;
  late Tween<double> _sizeTween;
  late AnimationController _controller;
  late CurvedAnimation _animation;
  FocusNode _focus = new FocusNode();

  bool selected = false;

  void _onFocusChange(){
    selected = !selected;
    if (selected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focus.addListener(() {
      _onFocusChange();
    });
    
    _colorTween = ColorTween(
      begin: Colors.transparent,
      end: Colors.white30
    );
    _sizeTween = Tween<double>(
      begin: 1.0,
      end: 1.1
    );

    _controller = AnimationController(
      vsync: this,
        duration: Duration(milliseconds: 500),
    )..addListener(() {
      setState(() {

      });
    });

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: TextField(
        focusNode:_focus,
        controller: _textInputController,
        keyboardType: (_type == 'num') ? TextInputType.phone : TextInputType.multiline,
        style: TextStyle(
            color: Colors.white
        ),
        decoration: InputDecoration(
            hintText: (_type == 'num') ? 'Phone Number' : 'Enter Your Confession!',
            hintStyle: TextStyle(
              color: Colors.white60
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.green,
                width: 2.0
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.white60,
                  width: 2.0,
                ),
            ),
            filled: true,
            fillColor: _colorTween.animate(_animation).value
        ),
      ),
    );
  }
}
