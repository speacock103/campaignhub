import 'package:flutter/material.dart';
import 'package:campaignhub/authent.dart';
import 'userpage.dart';
import 'loginpage.dart';
import 'createuserpage.dart';
import 'global.dart' as global;
import 'backfunc.dart' as backfunc;
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sizehelp.dart';

class ResetPass extends StatefulWidget {
  @override
  _ResetPass createState() => _ResetPass();
}

class _ResetPass extends State<ResetPass> {
  int page = 0;
  String email = "email";
  String password = "password";
  String verifypassword = "verify password";

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

                //enter email text field
                Stack(
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

                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),

                //enter email field
                Padding(
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
                          email = value;
                        });
                      }
                  ),
                ),

                SizedBox(
                  height: displayHeight(context) * 0.3,
                ),

                //send email button, reset page to enter code
                Container (
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

                SizedBox(
                  height:displayHeight(context) * 0.09,
                ),

                //return to login page
                RichText(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login()),
                                  );
                                }),
                        ]
                    )
                ),

                SizedBox(
                  height:displayHeight(context) * 0.08,
                ),

                //display error messages

              ],
            ),

          ),

        ),
      ),

    );
  }
}