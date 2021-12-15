import 'package:flutter/material.dart';
import 'package:project_1/auth/google_sign_in.dart';
import 'package:project_1/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class AHome extends StatefulWidget {
  const AHome({ Key? key }) : super(key: key);

  @override
  _AHomeState createState() => _AHomeState();
}

class _AHomeState extends State<AHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: const Text("MyTrip",
                      style: TextStyle(
                        fontFamily: 'PacificoRegular',
                        color: Colors.white,
                        fontSize: 25,
                      )),
        ),
      actions: <Widget>[
        MyStatelessWidget()
      ]
        
      ),
       drawer: Drawer(
        child: ListView(children:  [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text('OPTIONS'),
            
            
          )
        ,
        ListTile(
          title: Text("profile"),
          onTap: () {
             Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfileScreen()));

      

          },
        ),
         ListTile(
          title: const Text("settings"),
        )
        ],),
      ),
      body: Center(child: Text('Home page')),
      
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
