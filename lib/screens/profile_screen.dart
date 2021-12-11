import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_1/auth/google_sign_in.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);
  static const String id = 'home_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
@override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title:const Text('PROFILE'),
      
        
      ),
       
      body: Column(
        children: [
          const Text('welcome to profile'),
          const Center(child: SizedBox(height: 32,)),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          const SizedBox(
            height: 8,
          ),
          Text('Name: ' + user.displayName! ,
          style: const TextStyle(color: Colors.white,fontSize: 16),),
           const SizedBox(
            height: 8,
          ),
          Text('Email: ' + user.email! ,
          style: const TextStyle(color: Colors.white,fontSize: 16),)
        ],
      )
      
    );
  }
}


