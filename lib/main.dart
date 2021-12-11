import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_1/screens/home_screen1.dart';
import 'package:project_1/screens/homepage.dart';
import 'package:project_1/screens/login_screen.dart';
import 'package:project_1/screens/signup_screen.dart';
import 'package:project_1/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'auth/google_sign_in.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyTrip());
  
}

class MyTrip extends StatelessWidget {
  const MyTrip({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),

    child: MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData.dark().copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.indigo)),
      home: const HomePage(),
    ),
  );
}