import 'package:eth_ride/concern/common.dart';
import 'package:eth_ride/view/screens/home.dart';
import 'package:eth_ride/view/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child("users");

  void registerUser(String email, String password, String phoneNumber,
      String name, BuildContext context) async {
    try {
      final User firebaseUser = (await _firebaseAuth
              .createUserWithEmailAndPassword(email: email, password: password))
          .user!;
      if (firebaseUser != null) {
        Map userDataMap = {
          "name": name.trim(),
          "email": email.trim(),
          "phone": phoneNumber.trim(),
        };
        databaseReference.child(firebaseUser.uid).set(userDataMap);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
              child: Text(
                "User Registered Successfully!",
                style: const TextStyle(fontSize: 14, color: Colors.green),
              ),
            ),
            backgroundColor: Colors.white,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
              child: Text(
                "User Not Registered!",
                style: const TextStyle(fontSize: 14, color: Colors.red),
              ),
            ),
            backgroundColor: CommonMethods.primaryColor,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              e.message.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
          backgroundColor: CommonMethods.primaryColor,
        ),
      );
    }
  }

  void signinUser(String email, String password, BuildContext context) async {
    try {
      final User firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (firebaseUser != null) {
        try {
          DatabaseEvent snapshot =
              await databaseReference.child(firebaseUser.uid).once();
          if (snapshot != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    "Welcome back,👋",
                    style: TextStyle(
                      fontSize: 14,
                      color: CommonMethods.primaryColor,
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        } catch (error) {
          // Handle any potential errors here.
          print("Error: $error");
        }
      } else {
        _firebaseAuth.signOut();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
              child: Text(
                "Please create an account first!",
                style: const TextStyle(fontSize: 14, color: Colors.red),
              ),
            ),
            backgroundColor: CommonMethods.primaryColor,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              e.message.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
          backgroundColor: CommonMethods.primaryColor,
        ),
      );
    }
  }
}
