import 'package:flutter/material.dart';

class Login extends StatefulWidget{

  @override
  _LoginState createState() => _LoginState();
}
String username;

class _LoginState extends State<Login> {
  var _rememberMe=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.teal[400],
                  Colors.teal[500],
                  Colors.teal[600],
                  Colors.teal[700],
                  Colors.teal[800],
                ],
                // stops: [0.2, 0.4, 0.9, 0.15],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Register", style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 30.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Email", style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        // decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.email,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your Email',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Password", style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        // decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your Password',
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () =>
                              print('forgot password botton password'),
                          padding: EdgeInsets.only(right: 0.0),
                          child: Text('Forgot Password', style: TextStyle(
                            color: Colors.white, fontFamily: 'OpenSans',),
                          ),
                        ),
                      ),


                      // checkbox about remamber
                      Container(
                        child: Row(
                          children: <Widget>[
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                value: _rememberMe,
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value;
                                  });
                                },
                              ),
                            ),
                            Text("Remember me",
                              style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {},
                            style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text('LOGIN', style: TextStyle(
                                color: Colors.teal),)
                        ),


                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


