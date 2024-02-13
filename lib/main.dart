
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitledapp2/dashboard.dart';
import 'package:untitledapp2/list_view.dart';
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
    } ,
    debugShowCheckedModeBanner: false,
  ));
}

void initializeFirebase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  FirebaseAuth.instance.signInWithPhoneNumber('+9779841798250')
      .then((value) => print('Login Screen $value'),)
      .catchError((error) => print('Auth Error'));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  int _currentIndex = 0;

  final pages = [
    Dashboard(),
    TopPicks(),
    ListViewScreen()
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.holiday_village),
              label: 'Dashboard'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.holiday_village),
              label: 'List View'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_sharp),
              label: 'Account'
          )
        ],

    ),
    body: pages.elementAt(_currentIndex),

    );

  }
}

