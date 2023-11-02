import 'package:eth_ride/concern/common.dart';
import 'package:eth_ride/services/firebase_services.dart';
import 'package:eth_ride/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseServices firebaseServices = FirebaseServices();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final CommonMethods commonMethods = CommonMethods(context: context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(commonMethods.getWidth() * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: commonMethods.getHeight() * 0.4,
                  child: const Center(
                    child: Image(
                      image: AssetImage("assets/images/logo.jpeg"),
                    ),
                  )),
              SizedBox(
                  height: commonMethods.getHeight() * 0.05,
                  child: const Center(
                    child: Text("Welcome Rider",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Signatra",
                            color: Color.fromRGBO(5, 182, 252, 100))),
                  )),
              Container(
                padding: EdgeInsets.only(
                    left: commonMethods.getWidth() * 0.04,
                    right: commonMethods.getWidth() * 0.04),
                height: commonMethods.getHeight() * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            style: BorderStyle.none,
                          ),
                        ),
                        labelText: "Email",
                        labelStyle: const TextStyle(fontSize: 14),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            style: BorderStyle.none,
                          ),
                        ),
                        labelText: "passowrd",
                        labelStyle: const TextStyle(fontSize: 14),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: commonMethods.getHeight() * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(5, 182, 252, 100),
                        minimumSize: Size(commonMethods.getWidth() * 0.9,
                            commonMethods.getHeight() * 0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (!_emailTextEditingController.text.contains("@")) {
                          commonMethods
                              .showSnackBar("Email address is not valid");
                        } else if (_passwordTextEditingController
                            .text.isEmpty) {
                          commonMethods.showSnackBar("Password is mandatory");
                        } else {
                          firebaseServices.signinUser(
                              _emailTextEditingController.text,
                              _passwordTextEditingController.text,
                              context);
                        }
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text("Don't have an account? Sign Up",
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
