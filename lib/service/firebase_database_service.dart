import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseService{
  final usersList = [];
  final _firestoreDb = FirebaseFirestore.instance;

  Future getSingleUser() async{
    try{
      final CollectionReference _usersCollectionReference = await _firestoreDb.collection('users');
      var user1Details = await _usersCollectionReference.doc('user1').get();

      if(user1Details.exists) {
        print('The User1 Details is ${user1Details.data()}');
      } else{
        print('User DEtails not found');
      }
      return usersList;
    }on FirebaseException catch(e){
      print('Error in firebase database: $e');
      throw e;
    }
    catch(e){
      print('Unknown error: $e');
      throw e;
    }

  }

  Future getUser() async{
    try{
      final CollectionReference _usersCollectionReference = await _firestoreDb.collection('users');
      await _usersCollectionReference.get().then((querySnapshot){
        for(var result in querySnapshot.docs){
          usersList.add(result.data());
        }
      });

      return usersList;
      // if(user1Details.exists) {
      //   print('The User1 Details is ${user1Details.data()}');
      // } else{
      //   print('User DEtails not found');
      // }
      // return usersList;
    }on FirebaseException catch(e){
      print('Error in firebase database: $e');
      throw e;
    }
    catch(e){
      print('Unknown error: $e');
      throw e;
    }

  }
}