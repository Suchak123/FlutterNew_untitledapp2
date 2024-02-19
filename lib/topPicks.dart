import 'package:flutter/material.dart';
import 'package:untitledapp2/model/topicsModel.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Top Picks'),
        backgroundColor: Colors.redAccent.withOpacity(0.5),

      ),
      body: Container(
        height: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: topPicksList.length,
            itemBuilder: (context, index){
              final topPicks = topPicksList[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent,
                        spreadRadius: 3,
                        blurRadius: 3,
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Image.network(topPicks.url ?? 'blob:https://www.facebook.com/05580037-45a8-4b96-af5e-5a39c1586d8a', height: 250, width: 250,),
                      SizedBox(height: 30,),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.star,size: 20,color: Colors.yellow),
                          topPicks.rating !=null? Text('${topPicks.rating}', style: TextStyle(color: Colors.white),): Text('0.0'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      topPicks.title != null
                          ? Text(topPicks.title!, style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      )
                      : Text('Title'),


                    ],

                  ),

                  padding: EdgeInsets.all(20),

                ),
              );

            }
        ),
      ),
    );
  }
}

