import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitledapp2/model/user_model.dart';

class FirebaseDatabaseService {
  final usersList = [];
  final _firestoreDb = FirebaseFirestore.instance;

  Future getSingleUser() async {
    try {
      final CollectionReference _usersCollectionReference =
          await _firestoreDb.collection('users');
      var user1Details = await _usersCollectionReference.doc('user1').get();

      if (user1Details.exists) {
        print('The User1 Details is ${user1Details.data()}');
      } else {
        print('User DEtails not found');
      }
      return usersList;
    } on FirebaseException catch (e) {
      print('Error in firebase database: $e');
      throw e;
    } catch (e) {
      print('Unknown error: $e');
      throw e;
    }
  }

  Future getUser() async {
    try {
      final CollectionReference _usersCollectionReference =
          await _firestoreDb.collection('users');
      await _usersCollectionReference.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
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
    } on FirebaseException catch (e) {
      print('Error in firebase database: $e');
      throw e;
    } catch (e) {
      print('Unknown error: $e');
      throw e;
    }
  }

  //This function is used to create a user in Cloud Firebase
  void createUserInCloudFirebase({required UserModel userModel}) async {
    try {
      final CollectionReference _usersCollectionReference =
          await _firestoreDb.collection('users');

      await _usersCollectionReference.add(userModel.toJson()).whenComplete(() {
        print('User Created Success');
      });
    } catch (e) {
      print('Something went wrong $e');
    }
  }

  //this function is used to get user details using uId

  Future<UserModel?> getUserDetailsUsingUid({required String uId}) async {
    try {
      final CollectionReference _usersCollectionReference =
          await _firestoreDb.collection('users');
      final snapShot =
          await _usersCollectionReference.where('id', isEqualTo: uId).get();
      // final userModel = await snapShot.docs
      //     .map((doc) => UserModel.fromJson(
      //         doc as QueryDocumentSnapshot<Map<String, dynamic>>))
      //     .single;
      // return userModel;
      final userModel = await snapShot.docs.map((doc) => UserModel.fromJson(
          doc as QueryDocumentSnapshot<Map<String, dynamic>>)).single;
      return userModel;
    } catch (e) {
      print('Error! $e');
    }
    return null;
  }
}
