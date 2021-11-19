import 'package:flutter/material.dart';
import 'package:campaignhub/authent.dart';
import 'userpage.dart';
import 'global.dart' as global;
import 'backfunc.dart' as backfunc;
import 'package:campaignhub/googlebutton.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sizehelp.dart';
import 'createuserpage.dart';
import 'resetpasspage.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

//login page. login with existing account, google, or create account
class _Login extends State<Login> {
  int page = 0;
  String password = "password";
  String verifypassword = "verify password";
  String email = "email";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],

      body: Center(
        child: SingleChildScrollView (

          child: Container(
            padding: const EdgeInsets.all(0),
            width: displayWidth(context) * 0.9,
            height: displayHeight(context) -
                MediaQuery.of(context).padding.bottom,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white
            ),

            child: Column(
              children: <Widget>[

                SizedBox(
                  height: displayHeight(context) * .02,
                ),

                //Top Logo
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'The Campaign Hub',
                            style: TextStyle(
                              fontSize: displayWidth(context) * 0.09,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.red,
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            'The Campaign Hub',
                            style: TextStyle(
                              fontSize: displayWidth(context) * 0.09,
                              color: Colors.grey[850],
                            ),
                          ),
                        ],
                      )
                  ),
                ),

                SizedBox(
                  height: displayHeight(context) * .08,
                ),

                //email field (login and create account)
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                    ),
                    // Stroked text as border.
                    Text(
                      '   Email:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.055,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = .8
                          ..color = Colors.red,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      '   Email:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.055,
                        color: Colors.grey[850],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: displayHeight(context) * .015,
                ),

                //enter username (login and create account)
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 20),

                  child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.black)),
                        border: const OutlineInputBorder(),
                        labelStyle: new TextStyle(color: Colors.black,),
                        isDense: true,
                        //labelText: 'Username',
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      }
                  ),
                ),

                SizedBox(
                  height: displayHeight(context) * .05,
                ),

                //password field (login and create)
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                    ),
                    // Stroked text as border.
                    Text(
                      '   Password:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.055,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = .8
                          ..color = Colors.red,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      '   Password:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.055,
                        color: Colors.grey[850],
                      ),
                    ),
                  ],
                ),

                //enter password (login and create)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.black)),
                        border: const OutlineInputBorder(),
                        labelStyle: new TextStyle(color: Colors.black),
                        isDense: true,
                        //labelText: 'Username',
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      }
                  ),
                ),

                SizedBox(
                  height: displayHeight(context) * .05,
                ),

                // login button (login)
                Container (
                  height: displayHeight(context) * .08,
                  width: displayWidth(context) * .45,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(35)
                  ),
                  child: TextButton(
                    onPressed: () {
                      Authentication.signIn(email, password).then((data){

                        //success, push to user page
                        if (data == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserView()),
                          );
                        }

                        //user not exist
                        if (data == 1) {
                          setState(() {
                            page = 1;
                          });
                        }

                        //wrong password
                        if (data == 2) {
                          setState(() {
                            page = 2;
                          });
                        }
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.red, fontSize: displayWidth(context) * 0.055
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: displayHeight(context) * .015,
                ),

                //or sign in with google
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'or',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.04,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = .4
                          ..color = Colors.red,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'or',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.04,
                        color: Colors.grey[850],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: displayHeight(context) * .015,
                ),

                //google button
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return GoogleSignInButton();
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.red,
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: displayHeight(context) * 0.09,
                ),

                //forgot pass, make account
                RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Forgot Password',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: displayWidth(context) * 0.045,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ResetPass()),
                                  );
                                }),
                          TextSpan(
                              text: ' | ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: displayWidth(context) * 0.045,
                              )
                          ),
                          TextSpan(
                              text: 'Create Account',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: displayWidth(context) * 0.045,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CreateUser()),
                                  );
                                }),
                        ]
                    )
                ),

                //error messages
                if (page == 1) RichText(
                  text: TextSpan(
                      text: 'error: user with email does not exist',
                      style: TextStyle(
                        color: Colors.red[800],
                        fontSize: displayWidth(context) * 0.04,
                      )
                  ),
                ),

                if (page == 2) RichText(
                  text: TextSpan(
                      text: 'error: password failed',
                      style: TextStyle(
                        color: Colors.red[800],
                        fontSize: displayWidth(context) * 0.04,
                      )
                  ),
                ),

              ],
            ),

          ),

        ),
      ),

    );
  }
}