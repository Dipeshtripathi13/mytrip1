import 'package:flutter/material.dart';
import 'package:project_1/screens/home_screen1.dart';
import 'package:project_1/screens/login_screen.dart';
import 'package:project_1/screens/signup_screen.dart';
import 'package:project_1/screens/welcome_screen.dart';

void main() {
  runApp(const MyTrip());
  
}

class MyTrip extends StatelessWidget {
  const MyTrip({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(

        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
