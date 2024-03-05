import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uId;
  String? fullName;
  int? phoneNumber;
  String? emailAddress;
  String? address;
  String? gender;

  UserModel({
      this.uId,
      this.fullName,
      this.phoneNumber,
      this.address,
      this.emailAddress,
      this.gender,
      });

  toJson(){
    return {
      'id':uId,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'address': address,
      'email_address': emailAddress,
      'gender': gender,
    };
  }

  factory UserModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>>documentSnapshot){
    final snapshot = documentSnapshot.data();
    return UserModel(
      fullName: snapshot['full_name'],
      phoneNumber: snapshot['phone_number'],
      address: snapshot['address'],
      emailAddress: snapshot['email_address'],
        gender: snapshot['gender']
    );
  }
}
