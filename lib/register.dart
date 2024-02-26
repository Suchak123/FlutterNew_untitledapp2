import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitledapp2/model/user_model.dart';
import 'package:untitledapp2/service/base_auth_service.dart';
import 'package:untitledapp2/service/firebase_database_service.dart';
// import 'package:flutter_svg/svg.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final _formKey= GlobalKey<FormState>(); //underscore : private
  final _fullNameController=TextEditingController();
  final _emailAddressController=TextEditingController();
  final _phoneNumberController=TextEditingController();
  final _passwordController=TextEditingController();
  final _streetAddressController=TextEditingController();
  final _emailRegexPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      body: Center(
        child: Container(
          width: kIsWeb
              ? MediaQuery.of(context).size.width / 1.25
              : MediaQuery.of(context).size.width,
          height: kIsWeb
              ? MediaQuery.of(context).size.height / 1.25
              : MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Wrap(
                children: [
                  FractionallySizedBox(
                    widthFactor: kIsWeb ? 0.5 : 1,
                    child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, left: 20, right: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: ()=> Navigator.of(context).pushNamed('/login'),
                                child: RichText(
                                  // textWidthBasis: TextWidthBasis.longestLine,
                                  text: TextSpan(
                                    text: "Already have a account?",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: "Login",
                                          style: TextStyle(
                                              color: Colors.pink,
                                              decoration:
                                              TextDecoration.underline))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _fullNameController,
                                keyboardType: TextInputType.name,
                                maxLength: 30,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter full name',
                                ),
                                validator: (fullNameValue){
                                  if (fullNameValue==null || fullNameValue.trim().isEmpty){
                                    return 'Please Enter Full Name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _emailAddressController,
                                maxLength: 30,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email address',
                                ),
                                validator: (emailValue){
                                  if (emailValue==null || emailValue.trim().isEmpty){
                                    return 'Please enter your email address';
                                  }
                                  final regex= RegExp(_emailRegexPattern);
                                  if (!regex.hasMatch(emailValue)){
                                    return'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _phoneNumberController,
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your phone number',
                                ),
                                validator: (phoneNumberValue){
                                  if (phoneNumberValue==null || phoneNumberValue.trim().isEmpty){
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 2.5,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                maxLength: 20,
                                obscureText: true,  //making non visible password
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your password',
                                ),
                                validator: (passwordValue){
                                  if (passwordValue==null || passwordValue.trim().isEmpty){
                                    return 'Please Enter password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 2.5,),
                              TextFormField(
                                controller: _streetAddressController,
                                keyboardType: TextInputType.streetAddress,
                                maxLength: 20,
                                maxLines: 1, //lines or height of box
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your address',
                                ),
                                validator: (streetAddressValue){
                                  if (streetAddressValue==null || streetAddressValue.trim().isEmpty){
                                    return 'Please Enter address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(),
                                  onPressed: ()async{
                                    if (_formKey.currentState!= null){
                                      if(_formKey.currentState!.validate()){
                                        _formKey.currentState!.save();
                                        final email = _emailAddressController.text;
                                        final password = _passwordController.text;
                                        final firebaseAuth = FirebaseAuthService();
                                        final user = await firebaseAuth.signUpUserWithEmailAndPassword(email, password);

                                        if(user!=null){
                                          final userModel = UserModel(
                                            uId: user.uid,
                                            fullName: _fullNameController.text,
                                            emailAddress: _emailAddressController.text,
                                            phoneNumber: int.parse(_phoneNumberController.text),
                                            address: _streetAddressController.text,
                                          );
                                          final firebaseDatabaseService = FirebaseDatabaseService();
                                          firebaseDatabaseService.createUserInCloudFirebase(userModel: userModel);
                                          Navigator.pushNamed(context, '/login');

                                        } else{
                                          print('Databse couldnt be created');
                                        }
                                      }
                                    }
                                    // Navigator.pushNamed(context, '/main')
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 10, 50, 10),
                                    child: Text("Register"),
                                  ),
                                ),
                              )

                              // RichText(text: "Do not have a account yet?")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  kIsWeb
                      ? FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage('images/imageluffy1.jpg'),
                          // Replace with your image path
                          fit: BoxFit
                              .cover, // You can adjust the fit property as needed
                        ),
                      ),
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      // child: SvgPicture.network('https://svgur.com/i/yCT.svg'),
                    ),
                  )
                      : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}