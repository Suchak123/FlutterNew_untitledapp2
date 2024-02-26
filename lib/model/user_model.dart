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
}
