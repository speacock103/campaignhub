import 'package:flutter/material.dart';
import 'package:campaignhub/authent.dart';
import 'userpage.dart';
import 'loginpage.dart';
import 'global.dart' as global;
import 'backfunc.dart' as backfunc;
import 'package:flutter/gestures.dart';
import 'sizehelp.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUser createState() => _CreateUser();
}

class _CreateUser extends State<CreateUser> {
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

                  //email enter text
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

                  //email enter field
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

                  //password text field
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

                  SizedBox(
                    height: displayHeight(context) * .015,
                  ),

                  //password enter field
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

                  //confirm pass text
                  Stack(
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

                  SizedBox(
                    height: displayHeight(context) * .015,
                  ),

                  //confirm pass enter field
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
                            verifypassword = value;
                          });
                        }
                    ),
                  ),

                  SizedBox(
                    height: displayHeight(context) * .03,
                  ),

                  Container (
                    height: displayHeight(context) * .08,
                    width: displayWidth(context) * .55,
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(35)
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (password == verifypassword) {
                          Authentication.registerEmail(email, password, context: context).then((data){

                            //success, push to make user name
                            if (data == 0) {

                            }

                            //weak pass
                            if (data == 1) {
                              setState(() {
                                page = 1;
                              });
                            }

                            //account already exist
                            if (data == 2) {
                              setState(() {
                                page = 2;
                              });
                            }
                          });
                        }

                        //passwords do not match
                        else {
                          setState(() {
                            page = 3;
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

                  SizedBox(
                    height: displayHeight(context) * 0.09,
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
                  if (page == 1) RichText(
                    text: TextSpan(
                        text: 'error: password too weak',
                        style: TextStyle(
                          color: Colors.red[800],
                          fontSize: displayWidth(context) * 0.04,
                        )
                    ),
                  ),

                  if (page == 2) RichText(
                    text: TextSpan(
                        text: 'error: account with email already exist',
                        style: TextStyle(
                          color: Colors.red[800],
                          fontSize: displayWidth(context) * 0.04,
                        )
                    ),
                  ),

                  if (page == 3) RichText(
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