import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_1/screens/home_screen1.dart';
import 'package:project_1/screens/welcome_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  


  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
    
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){ 
        return const Center(child: CircularProgressIndicator(
    
          semanticsLabel: 'Linera progress indicator',
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ));

          
        } 
        else if (snapshot.hasData) {
          return const HomeScreen();

          
        } 
        else if (snapshot.hasError) {
          return const Center(child: Text('Something Went Wrong!'));
        }
          
        
        else {
          return WelcomeScreen();
        }
      },
    ),
  );
  }