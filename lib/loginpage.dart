import 'package:flutter/material.dart';
import 'package:campaignhub/auth.dart';
import 'userpage.dart';
import 'auth.dart' as auth;
import 'global.dart' as global;
import 'backfunc.dart' as backfunc;
import 'package:campaignhub/googlebutton.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sizehelp.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

//login page. login with existing account, google, or create account
class _Login extends State<Login> {
  int page = 0;
  String username = "username";
  String password = "password";
  String verifypassword = "verify password";
  String tempemail = "email";

  void createAccount() {
    int acc = register();
  }

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

                if (page == 0 || page == 2) SizedBox(
                  height: displayHeight(context) * .08,
                ),

                if (page == 1 || page == 4) SizedBox(
                  height: displayHeight(context) * .08,
                ),

                //email field (login and create account)
                if (page == 0 || page == 1 || page == 4)  Stack(
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

                if (page == 0 || page == 1 || page == 4) SizedBox(
                  height: displayHeight(context) * .015,
                ),

                //enter username (login and create account)
                if (page == 0 || page == 1 || page == 4) Padding(
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
                          tempemail = value;
                        });
                      }
                  ),
                ),

                if (page == 0) SizedBox(
                  height: displayHeight(context) * .05,
                ),

                if (page == 1 || page == 4) SizedBox(
                  height: displayHeight(context) * .05,
                ),

                //password field (login and create)
                if (page == 0 || page == 1 || page == 4) Stack(
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
                if (page == 0 || page == 1 || page == 4) Padding(
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

                if (page == 0) SizedBox(
                  height: displayHeight(context) * .05,
                ),

                if (page == 1 || page == 4) SizedBox(
                  height: displayHeight(context) * .05,
                ),

                //confirm password (create account)
                if (page == 1 || page == 4) Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                    ),
                    // Stroked text as border.
                    Text(
                      '   Confirm Password:',
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
                      '   Confirm Password:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.055,
                        color: Colors.grey[850],
                      ),
                    ),
                  ],
                ),

                //enter confirmed password (create account)
                if (page == 1 || page == 4) Padding(
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
                          verifypassword = value;
                        });
                      }
                  ),
                ),

                if (page == 1 || page == 4) SizedBox(
                  height: displayHeight(context) * .03,
                ),

                //email to verify text (change password)
                if (page == 2)  Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                    ),
                    // Stroked text as border.
                    Text(
                      '   Enter Account Email:',
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
                      '   Enter Account Email:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.055,
                        color: Colors.grey[850],
                      ),
                    ),
                  ],
                ),

                if (page == 2) SizedBox(
                  height: displayHeight(context) * 0.02,
                ),

                //enter email to verify (change password)
                if (page == 2) Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),

                  child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(borderSide: const BorderSide(color: Colors.black)),
                        border: const OutlineInputBorder(),
                        labelStyle: new TextStyle(color: Colors.black),
                        isDense: true,
                        //labelText: 'Username',
                      ),
                      onChanged: (value) {
                        setState(() {
                          tempemail = value;
                        });
                      }
                  ),
                ),

                //new password (change pass page 2)

                //enter new password (change pass page 2)

                // login button (login)
                if (page == 0) Container (
                  height: displayHeight(context) * .08,
                  width: displayWidth(context) * .45,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(35)
                  ),
                  child: TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.red, fontSize: displayWidth(context) * 0.055
                      ),
                    ),
                  ),
                ),

                if (page == 0) SizedBox(
                  height: displayHeight(context) * .015,
                ),

                //or sign in with google
                if (page == 0) Stack(
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

                if (page == 0) SizedBox(
                  height: displayHeight(context) * .015,
                ),

                //google button
                if (page == 0) FutureBuilder(
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

                if (page == 0) SizedBox(
                  height: displayHeight(context) * 0.09,
                ),

                //create account button (create account)
                if (page == 1 || page == 4) Container (
                  height: displayHeight(context) * .08,
                  width: displayWidth(context) * .55,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(35)
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (password == verifypassword) {
                        int acc = auth.register(tempemail, password, context);
                      }
                      else {
                        setState(() {
                          page = 4;
                        });
                      }
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.red, fontSize: displayWidth(context) * 0.055
                      ),
                    ),
                  ),
                ),

                if (page == 1 || page == 4) SizedBox(
                  height: displayHeight(context) * 0.09,
                ),

                if (page == 2) SizedBox(
                  height: displayHeight(context) * 0.3,
                ),

                //verify email button (change password)
                if (page == 2) Container (
                  height: displayHeight(context) * .08,
                  width: displayWidth(context) * .6,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(35)
                  ),
                  child: TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Send Verification',
                      style: TextStyle(
                          color: Colors.red, fontSize: displayWidth(context) * 0.055
                      ),
                    ),
                  ),
                ),

                //update password button (change password page 2)

                //forgot pass, make account
                if (page == 0) RichText(
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
                                  setState(() {
                                    page = 2;
                                  });
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
                                  setState(() {
                                    page = 1;
                                  });
                                }),
                        ]
                    )
                ),

                if (page == 2) SizedBox(
                  height:displayHeight(context) * 0.09,
                ),

                //return to sign in (create account and change password)
                if (page == 1 || page == 2 || page == 4) RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Return to Sign In',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: displayWidth(context) * 0.045,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    page = 0;
                                  });
                                }),
                        ]
                    )
                ),

                if (page == 4) SizedBox(
                  height:displayHeight(context) * 0.08,
                ),

                if (page == 4) RichText(
                  text: TextSpan(
                      text: 'error: passwords do not match',
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