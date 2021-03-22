import 'package:adm/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Login/Homepage.dart';
import 'Login/Login_screen.dart';
import 'Login/singup.dart';


void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
              value: Authentication(),
          )
        ],

            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: 'logIn',

              routes: {
                'logIn' : (context) => LoginScreen(),
                'singUp' : (context) => Signup(),
                'home' : (context) => HomePage(),
              },
    ),
    );
  }
}


