import 'package:flutter/material.dart';
import 'package:campaignhub/auth.dart';
import 'package:campaignhub/googlebutton.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'global.dart' as global;
import 'backfunc.dart' as backfunc;
import 'userpage.dart';
import 'loginpage.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

//check login state. if user session exist, send to user page. if not, send to login page
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      global.login = 0;
    } else {
      global.login = 1;
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Check() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    if (global.login == 1) {
      return UserView();
    }
    return Login();
  }
}