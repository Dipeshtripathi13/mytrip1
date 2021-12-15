import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  // static const String id = 'welcome_screen';

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1E33),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(child: Image.asset('images/bus.png'), height: 200),
                const Text("MyTrip",
                    style: TextStyle(
                      fontFamily: 'PacificoRegular',
                      color: Colors.white,
                      fontSize: 25,
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("App version - 1.0.0"),
                ),
                ListTile(
                
                  title: Text('View Licence'),
                  trailing: Icon(Icons.keyboard_arrow_right_sharp,
                      color: Colors.white),

                  //onTap calls When ListTile Taps
                  onTap: () {
                    showDialog();
                  },
                ),
                Divider(
                  color: Colors.teal.shade100,
                ),
                ListTile(
                  title: Text('Rate Us'),
                  trailing: Icon(Icons.keyboard_arrow_right_sharp,
                      color: Colors.white),

                  //onTap calls When ListTile Taps
                  onTap: () async {
                    //navigate to play store to rate the app
                    const url = "https://flutter.io";
                    if (await canLaunch(url))
                      await launch(url);
                    else
                      // can't launch url, there is some error
                      throw "Could not launch $url";
                  },
                ),
                SizedBox(
                  height: 8,
                  width: double.infinity,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [IconButton(
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: ()async {
                    //navigate to play store to rate the app
                    const url = "https://www.facebook.com/parshuram.dhungana.56";
                    if (await canLaunch(url))
                      await launch(url);
                    else
                      // can't launch url, there is some error
                      throw "Could not launch $url";
                  },
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                      color: Colors.white,
                     // size: 30,
                   
                    onPressed: () {

                      //implement twiter account here
                    },
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDialog() {
    showAboutDialog(
        context: context,
        applicationName: 'MyTrip',
        //applicationIcon: const FlutterLogo(),
        applicationVersion: '0.0.1',
        applicationLegalese: '@2021 myTrip',
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Developer: .....'))
        ]);
  }
}
