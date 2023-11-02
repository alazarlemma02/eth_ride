import 'package:eth_ride/concern/common.dart';
import 'package:eth_ride/services/firebase_services.dart';
import 'package:eth_ride/view/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseServices firebaseServices = FirebaseServices();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final CommonMethods commonMethods = CommonMethods(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(commonMethods.getWidth() * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: commonMethods.getHeight() * 0.3,
                  child: const Center(
                    child: Image(
                      image: AssetImage("assets/images/logo.jpeg"),
                    ),
                  )),
              SizedBox(
                  height: commonMethods.getHeight() * 0.06,
                  child: Center(
                    child: Text(
                      "Hello👋, Register As A Rider",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Signatra",
                        color: CommonMethods.primaryColor,
                      ),
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(
                    left: commonMethods.getWidth() * 0.04,
                    right: commonMethods.getWidth() * 0.04),
                height: commonMethods.getHeight() * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            style: BorderStyle.none,
                          ),
                        ),
                        labelText: "Full Name",
                        labelStyle: const TextStyle(fontSize: 14),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            style: BorderStyle.none,
                          ),
                        ),
                        labelText: "Phone Number",
                        labelStyle: const TextStyle(fontSize: 14),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
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
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            style: BorderStyle.none,
                          ),
                        ),
                        labelText: "Passowrd",
                        labelStyle: const TextStyle(fontSize: 14),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            style: BorderStyle.none,
                          ),
                        ),
                        labelText: "Confirm Passowrd",
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
                        backgroundColor: CommonMethods.primaryColor,
                        minimumSize: Size(commonMethods.getWidth() * 0.9,
                            commonMethods.getHeight() * 0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_nameController.text.isEmpty ||
                            _phoneController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _confirmPasswordController.text.isEmpty) {
                          commonMethods
                              .showSnackBar("Please fill all the fields");
                        } else if (_nameController.text.length < 5) {
                          commonMethods.showSnackBar(
                              "Name must be atleast 5 characters long");
                        } else if (!_emailController.text.contains("@")) {
                          commonMethods
                              .showSnackBar("Please enter a valid email");
                        } else if (_phoneController.text.length < 10) {
                          commonMethods.showSnackBar(
                              "Please enter a valid phone number");
                        } else if (_passwordController.text.length < 6) {
                          commonMethods.showSnackBar(
                              "Password must be atleast 6 characters long");
                        } else if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          commonMethods.showSnackBar(
                              "Password and Confirm Password does not match");
                        } else {
                          firebaseServices.registerUser(
                              _emailController.text,
                              _passwordController.text,
                              _phoneController.text,
                              _nameController.text,
                              context);
                        }
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text("Already have an account? Sign In",
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
