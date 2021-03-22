import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:adm/Login/Homepage.dart';
import 'package:adm/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'singup.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'logIn';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double _sigmaX = 1.0; // from 0-10
  double _sigmaY = 1.0; // from 0-10
  double _opacity = 0.5; // from 0-1.0
  bool See = true;

  double screen;
  //bool _securetext = true;
  String email,password;

  final GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
    {
      return;
    }
    _formKey.currentState.save();

    try
    {
      await Provider.of<Authentication>(context, listen: false).singIn(
          _authData['email'],
          _authData['password']
      );

      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }catch(error){
      var errorMessage = 'ngong';
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
        backgroundColor: Colors.black,
        title: Text('Login' , style: TextStyle(
            color: Colors.white),),
        actions: <Widget>[
          TextButton(
            child: Row(
              children: <Widget>[
                Text('Sign up', style: TextStyle(
                    color: Colors.white),),
                Icon(Icons.person_add ,color: Colors.white),
              ],
            ),

            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new Signup()));
            },
          )
        ],
      ),
      body: Container(

        child: Stack(
          children: <Widget>[
            Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://i.pinimg.com/originals/98/1a/b9/981ab9b2766ed363eba35cd51906cb35.jpg"),
                        fit: BoxFit.cover)
                ),
                // child: Center(child: Text('Set Full Screen Background Image in Flutter',
                //   textAlign: TextAlign.center, style:
                //   TextStyle(color: Colors.brown, fontSize: 25, fontWeight: FontWeight.bold),),)
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
                    height: 260,
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
                                  labelText: 'Email', labelStyle: TextStyle(color: Colors.white,fontSize: 20.0)),
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
                              },
                            ),
                            SizedBox(height: 30,),
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
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.white,fontSize: 20.0)
                              ),
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
                            ElevatedButton(
                                onPressed: () {
                                    _submit();
                              },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  padding: EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Text('LOGIN', style: TextStyle(
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
      ),
    );
  }
}
