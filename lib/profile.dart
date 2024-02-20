import 'package:flutter/material.dart';
import 'package:untitledapp2/service/firebase_database_service.dart';

import 'service/base_auth_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          GestureDetector(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      icon: Icon(Icons.warning),
                      title: Text('Signout user'),
                      content: Text('Are you sure you wnat to Signout?'),
                      actions: [
                        InkWell(
                          child: Text('Ok'),
                          onTap: () {
                            final firebaseAuthService = FirebaseAuthService();
                            firebaseAuthService.signout();
                            Navigator.of(dialogContext).pop();
                            Navigator.pushReplacementNamed(
                                context, '/login');
                          },
                        ),
                        InkWell(
                          child: Text('Cancel'),
                          onTap: () {
                            Navigator.of(dialogContext).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed : () async{
            final firebaseDatabaseService = FirebaseDatabaseService();
            firebaseDatabaseService.getUsers();
          },
          child: Text('Get User Details'),
        ),

      ),

    );
  }
}
