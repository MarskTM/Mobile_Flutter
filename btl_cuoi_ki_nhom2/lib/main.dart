import 'pages/mainPage.dart';
import 'pages/welcomePage.dart';
import 'pages/welcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ecommerce());
}

class ecommerce extends StatelessWidget {
  const ecommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcomeScreen(),
    );
  }
}
