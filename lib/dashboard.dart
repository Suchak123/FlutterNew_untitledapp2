import 'package:flutter/material.dart';
import 'package:untitledapp2/service/base_auth_service.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          GestureDetector(

            onTap: (){
              showDialog (context: context, builder: (BuildContext dialogContext){
                  return AlertDialog(
                  icon: Icon(Icons.warning),
                  title: Text('Signout'),
                  content: Text("Are you sure you want to signout?"),
                  actions: [
                    InkWell(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text('Ok'),
                        ),

                      onTap: (){
                        final firebaseAuthService = FirebaseAuthService();
                        firebaseAuthService.signout();
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    ),

                    InkWell(
                        child: Text('Cancel'),
                      onTap: (){
                          Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });

            },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.logout),
              ),

          ),
        ],
      ),
      body: Center(
        child: Stack(
        children: <Widget>[
          Container(

            child: Image.asset('assets/images/imageluffy1.jpg', height: 400,width: MediaQuery.of(context).size.width),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Luffy Bounty: 4,000,000,000 berries', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),),
          ),
        ],
        ),
      ),
      );
    


    // Widget buildBasicCard(BuildContext context){

    }
  }

