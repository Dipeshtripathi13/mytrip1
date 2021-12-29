import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_1/auth/google_sign_in.dart';
import 'package:project_1/inside_home_screens/about_us.dart';
import 'package:project_1/inside_home_screens/homework/ahome.dart';
import 'package:project_1/inside_home_screens/mapwork/location.dart';
import 'package:project_1/inside_home_screens/mapwork/map.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);
 // static const String id = 'home_screen';
 static final String title = 'Firebase Download';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   // ignore: prefer_final_fields
   List<Widget> _widgetOptions = <Widget>[
     AHome(),
      //const Text(
       //'Index 0: Home',
      // style: optionStyle,
    // ),
     // const Text(
      // 'Index 1: Map',
       //style: optionStyle,
     //),
    MapPage(),
  // const Text(
   //  'Index 2: ToDo DataFromAPI Here',
  //    style: optionStyle,
      
    //),
DashboardScreen(),
    //const DataFromAPI(),//temporyly paused

    // const Text(
      // 'Index 3: add',
      // style: optionStyle,
    // ),
      const AboutUsScreen() //implement about us screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

@override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
     
    return Scaffold(
     
           body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),

        //add the body code here
    
      ),

      //botthmNavigation bar 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_rounded),
            label: 'Offer',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
            backgroundColor: Colors.pink,
            
          ),
      ],
      currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

     
      
    );
  }
  
  
}



class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:const Icon(
                   Icons.logout,
                   color: Colors.white,
                   size: 30,
                 ),
                 tooltip: 'Log out',
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alert!!'),
          content: const Text('Are you sure you want to log out??'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final provider =
                   Provider.of<GoogleSignInProvider>(context, listen: false);
                   provider.logout();
                   Navigator.pop(context, 'Log out');
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
      
    );
  }
}
