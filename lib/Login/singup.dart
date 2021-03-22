
import 'dart:ui';

import 'package:adm/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Login_screen.dart';

class Signup extends StatefulWidget {


  static const routeName = 'singUp';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  double _sigmaX = 1.0; // from 0-10
  double _sigmaY = 1.0; // from 0-10
  double _opacity = 0.5; // from 0-1.0
  bool See = true;

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Future<void> _submit() async
  {
      if(!_formKey.currentState.validate())
        {
          return;
        }
      _formKey.currentState.save();

      try
      {
        await Provider.of<Authentication>(context, listen: false).singUp(
            _authData['email'],
            _authData['password']
        );

        //Navigator.push(context, MaterialPageRoute(builder: (context) => new LoginScreen()));
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }catch(error){
        var errorMessage = 'Authentication failed';
        _showDialog(errorMessage);
      }
  }

  Map<String , String>_authData = {
    'email' : '',
    'password' : ''
  };

  void _showDialog(String msg){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('error'),
      content: Text(msg),
      actions: [
        MaterialButton(
            onPressed: (){
          Navigator.of(context).pop();
        },
          child: Text('Ok'),
        )
      ],
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Sign up', style: TextStyle(
            color: Colors.white),),

        actions: <Widget>[
          TextButton(
            child: Row(
              children: <Widget>[
                Text('Login', style: TextStyle(
                    color: Colors.white),),
                Icon(Icons.person ,color: Colors.white),
              ],
            ),

            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          )
        ],

      ),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://i.pinimg.com/originals/98/1a/b9/981ab9b2766ed363eba35cd51906cb35.jpg"),
                    fit: BoxFit.cover)
            ),
          ),


          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
              child: Card(
                color: Colors.black87.withOpacity(_opacity),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 400,
                  width: 300,
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // email
                          TextFormField(
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                labelText: 'Email', labelStyle: TextStyle(color: Colors.white,fontSize: 20.0,)),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value)
                            {
                              if(value.isEmpty || !value.contains('@'))
                              {
                                return 'invalid email';
                              }
                              return null;
                            },
                            onSaved:  (value)
                            {
                              _authData['email'] = value;
                              return value;
                            },
                          ),
                          SizedBox(height: 30,),
                          //password
                          TextFormField(
                            obscureText: See,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                suffixIcon: IconButton( onPressed: () {
                                  setState(() {
                                    See = !See;
                                  });
                                }, icon: Icon(
                                  See ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                                  color: Colors.white,

                                ),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                                labelText: 'Password', labelStyle: TextStyle(color: Colors.white,fontSize: 20.0,)),
                             // ປິລະຫັດ
                            controller: _passwordController,
                            validator: (value)
                            {
                              if(value.isEmpty || value.length<=5)
                              {
                                return 'invalid password';
                              }
                              return null;
                            },
                            onSaved: (value)
                            {
                              _authData['password'] = value;
                            },
                          ),

                          SizedBox(height: 30,),
                          //Confirm password
                          TextFormField(
                            obscureText: See,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                suffixIcon: IconButton( onPressed: () {
                                  setState(() {
                                    See = !See;
                                  });
                                }, icon: Icon(
                                  See ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                                  color: Colors.white,

                                ),
                                ),
                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                labelText: 'Confirm Password', labelStyle: TextStyle(color: Colors.white,fontSize: 20.0,)),
                            validator: (value)
                            {
                              if(value.isEmpty || value != _passwordController.text)
                              {
                                return 'invalid password';
                              }
                              return null;
                            },
                            onSaved: (value)
                            {

                            },
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(onPressed: ()
                          {
                                _submit();
                          },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: Text('Sign up', style: TextStyle(
                                  color: Colors.lime[800]),)
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
