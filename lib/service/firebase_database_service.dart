import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseService{
  final usersList = [];
  final _firestoreDb = FirebaseFirestore.instance;

  Future getUsers() async{
    try{
      final CollectionReference _usersCollectionReference = await _firestoreDb.collection('users');
      var user1Details = await _usersCollectionReference.doc('user1').get();
      print('The User1 Details is ${user1Details.data()}');
      return user1Details;
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