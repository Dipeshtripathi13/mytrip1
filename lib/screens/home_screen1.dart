import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Image.asset('images/clip-1655.png')
              )
            ],
          )
        ],
      ),
      
    );
  }
}
