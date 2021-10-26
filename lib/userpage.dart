import 'package:flutter/material.dart';
import 'package:campaignhub/auth.dart';
import 'main.dart';
import 'loginpage.dart';
import 'global.dart' as global;
import 'backfunc.dart' as backfunc;
import 'package:flutter/gestures.dart';
import 'sizehelp.dart';

class UserView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('The Campaign Hub'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          bottom: PreferredSize(
              child: Container(
                color: Colors.red,
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
        ),

        body: Center(

        child: SingleChildScrollView (

          child: Container(

            child: Column(

                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Logout',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Authentication.signOut(context: context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login())
                                    );
                                  }),
                          ]
                      )
                  ),
                ]

            ),

          )

        )

        )
    );
  }

}