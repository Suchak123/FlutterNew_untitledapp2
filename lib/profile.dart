
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed : () async{
      //       final firebaseDatabaseService = FirebaseDatabaseService();
      //       firebaseDatabaseService.getSingleUser();
      //     },
      //     child: Text('Get User Details'),
      //   ),
      //
      // ),

      // body: FutureBuilder(future: FirebaseDatabaseService().getUserDetailsUsingUid(),
      //     builder: (context, snapshot){
      //
      //     },
      // ),

// actions: [
// GestureDetector(
// onTap: () async {
// await showDialog(
// context: context,
// builder: (BuildContext dialogContext) {
// return AlertDialog(
// icon: Icon(Icons.warning),
// title: Text('Signout user'),
// content: Text('Are you sure you wnat to Signout?'),
// actions: [
// InkWell(
// child: Text('Ok'),
// onTap: () {
// final firebaseAuthService = FirebaseAuthService();
// firebaseAuthService.signout();
// Navigator.of(dialogContext).pop();
// Navigator.pushReplacementNamed(
// context, '/login');
// },
// ),
// InkWell(
// child: Text('Cancel'),
// onTap: () {
// Navigator.of(dialogContext).pop();
// },
// ),
// ],
// );
// });
// },
// child: Padding(
// padding: const EdgeInsets.only(right: 30),
// child: Icon(Icons.logout),
// ),
// ),
// ],

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/user_model.dart';
import 'service/firebase_database_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userId = "";
  @override
  void initState() {
    readUidFromSharedPreferences();
    super.initState();
  }

  void readUidFromSharedPreferences() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');

    if(id != null){
      setState(() {
        userId = id;
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('View Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: (userId.isNotEmpty)
        ? FutureBuilder(
            future: FirebaseDatabaseService().getUserDetailsUsingUid(uId: userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                  child: Text(
                  'Error fetching data',
                  style: TextStyle(color: Colors.white),
                  ),
                  );
                }

                if (snapshot.hasData) {
                print('Uid is $userId');
                final userModel = snapshot.data;
                return ListView(
                      children: [
                        ProfileImage(),
                        SizedBox(
                          height: 20,
                        ),
                        BasicDetails(userModel: userModel ),
                        SizedBox(
                          height: 20,
                        ),
                        MenuWidgets(
                          title: 'Settings',
                          onPressed: (){
                            print('Settings clicked');
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MenuWidgets(
                          title: 'Notifications',
                          onPressed: (){
                            print('Notifications clicked');
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MenuWidgets(
                          title: 'About App',
                          onPressed: (){
                            print('About clicked');
                          },
                        ),
                      ],
                    );
                  }
                }
                return Center(
                child: CircularProgressIndicator(),
                );
                },
                )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
    ),
    );
  }
}

///This widget is used to display the circular profile images
class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: CircleAvatar(
        radius: 18,
        backgroundImage: AssetImage('assets/images/imageluffy1.jpg'),
      ),
    );
  }
}

///This is the widget for displaying the basic details of the user
class BasicDetails extends StatelessWidget {

  BasicDetails({required this.userModel});
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userModel!=null
              ? Text('Name: ${userModel!.fullName}')
              : Text('Name: -'),
          SizedBox(
            height: 5,
          ),
          userModel!=null
          ? Text('Email: ${userModel!.emailAddress}')
          : Text('Email: -'),
          SizedBox(
            height: 5,
          ),
          userModel!=null
              ? Text('Phone: ${userModel!.phoneNumber}')
              : Text('Phone: -'),
          SizedBox(
            height: 5,
          ),
          userModel!=null
              ? Text('Address: ${userModel!.address}')
              : Text('Address: -'),
          SizedBox(
            height: 5,
          ),
          userModel!=null
              ? Text('Gender: ${userModel!.gender}')
              : Text('Gender: -'),

          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: ()=> ,
              child: Text('Edit Profile')),
        ],
      ),
    );
  }
}

///This widget is common for creating menus
class MenuWidgets extends StatelessWidget {
  MenuWidgets({required this.title, this.onPressed});

  String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(
                0,
                3,
              ), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}