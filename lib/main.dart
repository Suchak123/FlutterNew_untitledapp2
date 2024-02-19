
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitledapp2/dashboard.dart';
import 'package:untitledapp2/list_view.dart';
import 'package:untitledapp2/login.dart';
import 'package:untitledapp2/profile.dart';
import 'package:untitledapp2/register.dart';
import 'package:untitledapp2/splash.dart';
import 'package:untitledapp2/topPicks.dart';
import 'package:untitledapp2/utils/firebase_default_options.dart';

import 'grid_view.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  //for firebase initialize
  initializeFirebase();

  runApp(MaterialApp(
    title: 'Flutter App!!',
    theme: ThemeData(
      colorSchemeSeed: Colors.lightGreenAccent,
      useMaterial3: false,
      brightness: Brightness.light,
      fontFamily: 'BebasNeue',
    ),
    darkTheme: ThemeData(
      colorSchemeSeed: Colors.yellow,
      useMaterial3: false,
      brightness: Brightness.light,
    ),
    routes:{
      '/':(BuildContext context)=>Splash(),
      '/main': (context)=>MyApp(),
      '/grid':(context)=>Grid(),
      '/dashboard':(context)=>Dashboard(),
      '/listViewScreen': (context)=> ListViewScreen(),
      '/topPicks': (context)=> TopPicks(),
      '/login': (context)=> Login(),
      '/register': (context)=> Register(),
      '/profile': (context) => Profile(),
    } ,
    debugShowCheckedModeBanner: false,
  ));
}

void initializeFirebase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

//   FirebaseAuth.instance.signInWithPhoneNumber('+9779841798250')
//       .then((value) => print('Login Screen $value'),)
//       .catchError((error) => print('Auth Error'));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );

  }
}

