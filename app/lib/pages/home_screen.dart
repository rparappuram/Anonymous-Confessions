import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twilio_app_hack/providers/input_providers.dart';
import 'package:twilio_app_hack/widgets/send_confession_btn.dart';

import '../widgets/text_input_group.dart';

class HomeScreen extends StatefulWidget {

  static final pageName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _textControllerNumber = TextEditingController();
  final _textControllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black,
                  Color.fromRGBO(32, 20, 82, 1.0)
                ]
              )
            ),
            padding: EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 20
            ),
            child: ChangeNotifierProvider(
              create: (ctx) => InputProviders(),
              child: Column(
                children: [
                  Container(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 15
                    ),
                      height: constraints.maxWidth * 0.35,
                      width: constraints.maxWidth * 0.35,
                      child: Image.asset(
                          'assets/user-secret-solid.png',
                        color: Colors.white,
                      )
                  ),
                  Text(
                      'Anonymous Confessions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin:EdgeInsets.only(top:5),
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                          'A way to let your special other know that you like them without them knowing who you are.',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.08,
                  ),
                  TextInputGroup(),
                  SendConfessionButton()
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
