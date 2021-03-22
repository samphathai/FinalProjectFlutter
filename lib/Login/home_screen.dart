import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {

  static const routeName = '/home';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home_screen'),
      ),
      body: Center(
        child: Text(
          'This is my home', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
      ),
    );
  }
}
