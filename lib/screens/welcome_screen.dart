import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1/screens/login_screen.dart';
import 'package:project_1/screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1E33),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(child: Image.asset('images/clip-1655.png'), height: 200),
                const Text("MyTrip",
                    style: TextStyle(
                      fontFamily: 'PacificoRegular',
                      color: Colors.white,
                      fontSize: 25,
                    )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Make Your Travel Easier',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 21,
                  width: 250,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: (Radius.circular(15)),
                topRight: (Radius.circular(15)),
              ),
              color: Color.fromRGBO(88, 24, 69, 1.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 37,
                    width: MediaQuery.of(context).size.width / 1.15,
                    child: ElevatedButton(
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[800])),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: ElevatedButton(
                      child: const Text(
                        'RESITER',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()),
                          );
                        },
                      
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple[800])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
