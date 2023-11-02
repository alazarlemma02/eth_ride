import 'package:eth_ride/view/screens/home.dart';
import 'package:eth_ride/view/screens/signin_screen.dart';
import 'package:eth_ride/view/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETH RIDES',
      theme: ThemeData(
        fontFamily: "Brand-Bold",
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(5, 182, 252, 50)),
        useMaterial3: true,
      ),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SignInScreen(),
        "/signup": (context) => const SignUpScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
