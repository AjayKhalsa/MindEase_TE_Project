import 'package:flutter/material.dart';
import 'package:flutter_app3/services/auth.dart';
import 'package:flutter_app3/shared/constants.dart';
import 'package:flutter_app3/shared/loading.dart';
import 'package:flutter_app3/styleguide/colors.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_app3/screens/authenticate/sign_in_doctor.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  static String userv = '';
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
              title: Text('Sign in'),
              actions: <Widget>[
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[400]), //Background Color
                    elevation: MaterialStateProperty.all(0), //Defines Elevation
                    shadowColor:
                        MaterialStateProperty.all(brown), //Defines shadowColor
                  ),
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: SingleChildScrollView(
                              child: Form(
                  key: _formKey,

                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Text(
                "Welcome To MentalEase",
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
        
            SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.20,
            ),
                      SizedBox(height: size.height * 0.05),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'password'),
                        validator: (val) =>
                            val.length < 6 ? 'Enter an 6+ chars long' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      DropdownButton<String>(
                        items: <String>['User', 'Doctor'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) =>
                            setState(() => SignIn.userv = value),
                      ),
                      SizedBox(height: 12.0),

                      ElevatedButton(
                        // color: Colors.pink[400],
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(pink), //Background Color
                          elevation:
                              MaterialStateProperty.all(3), //Defines Elevation
                          shadowColor: MaterialStateProperty.all(
                              pink), //Defines shadowColor
                        ),
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'invalid password or email';
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      // RaisedButton(
                      //   color: Colors.pink[400],
                      //   child: Text(
                      //     'Login as Doctor',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onPressed: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) => LoginDoctor(),
                      //       ),
                      //     );
                      //   },
                      // ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
