import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitledapp2/service/base_auth_service.dart';
// import 'package:flutter_svg/svg.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _emailRegexPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      body: Center(
        child: Container(
          width: kIsWeb
              ? MediaQuery.of(context).size.width / 1.5
              : MediaQuery.of(context).size.width,
          height: kIsWeb
              ? MediaQuery.of(context).size.height / 1.5
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
                            top: 30.0, left: 15, right: 15),
                        child: Form(
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
                                onTap: () =>
                                    Navigator.of(context).pushNamed('/login'),
                                child: RichText(
                                  // textWidthBasis: TextWidthBasis.longestLine,
                                  text: TextSpan(
                                    text: "Already have an account?",
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
                                controller: _emailAddressController,
                                maxLength: 30,
                                maxLines: 1, //lines or height of box
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email address',
                                ),
                                validator: (emailValue) {
                                  if (emailValue == null ||
                                      emailValue.trim().isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  final regex = RegExp(_emailRegexPattern);
                                  if (!regex.hasMatch(emailValue)) {
                                    return 'Please enter a valid email';
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
                                validator: (phoneNumberValue) {
                                  if (phoneNumberValue == null ||
                                      phoneNumberValue.trim().isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                              ),

                              TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Enter your password",
                                  border: OutlineInputBorder(),

                                  // labelText: "email"
                                ),
                                validator: (passwordValue) {
                                  if (passwordValue == null ||
                                      passwordValue.trim().isEmpty) {
                                    return 'Please Enter password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _streetAddressController,
                                keyboardType: TextInputType.streetAddress,
                                maxLength: 10,
                                maxLines: 2, //lines or height of box
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your address',
                                ),
                                validator: (streetAddressValue) {
                                  if (streetAddressValue == null ||
                                      streetAddressValue.trim().isEmpty) {
                                    return 'Please Enter address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState != null) {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        final email =
                                            _emailAddressController.text;
                                        final password =
                                            _passwordController.text;
                                        final firebaseAuth =
                                            FirebaseAuthService();
                                        firebaseAuth
                                            .signUpUserWithEmailAndPassword(
                                                email, password);
                                        Navigator.pushNamed(context, '/login');
                                        //print('The Enter First Name ${_fullNameController.text}');
                                        //print('The email address is  ${_emailAddressController.text}');
                                        //print('The Enter phone number ${_phoneNumberController.text}');
                                        //print('The password is ${_passwordController.text}');
                                        //print('The street address ${_streetAddressController.text}');
                                      }
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  // style: ElevatedButton.styleFrom(
                                  //     backgroundColor: Colors.deepPurple),
                                ),
                              ),

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
