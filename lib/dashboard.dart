import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Picks'),
        actions: [
          Icon(Icons.plus_one),
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
    


    Widget buildBasicCard(BuildContext context){

    }
  }
}
