import 'package:flutter/material.dart';
import 'package:twilio_app_hack/pages/home_screen.dart';
import 'package:twilio_app_hack/pages/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TwilioAppHack',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
