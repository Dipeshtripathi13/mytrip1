import 'package:flutter/material.dart';
import 'package:project_1/auth/google_sign_in.dart';
import 'package:project_1/screens/home_screen1.dart';
import 'package:project_1/screens/signup_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _email, _password;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: const Color(0xFF1D1E33),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Let's Sign in",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 300,
            child: Image(
              image: AssetImage("images/clip-1655.png"),
              fit: BoxFit.contain,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    // if (input.isEmpty) return 'Enter Email';
                  },
                  decoration: const InputDecoration(
                      labelText: 'Email', prefixIcon: Icon(Icons.email)),
                  //onSaved: (input) => _email = input,
                ),
                TextFormField(
                  /*validator: (input) {
                         if (input.length < 6)
                           return 'Provide minimam 6 character';
                       },*/
                  decoration: const InputDecoration(
                      labelText: 'Password', prefixIcon: Icon(Icons.lock)),
                  //obscureText: true,
                  //onSaved: (input) => _password = input,
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
                          //implement login here
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[800])),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              child: const Text(
                'Don\'t have an account? Register Here',
                style: TextStyle(fontSize: 16),
              ),
              onTap: navigateToSignUp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                height: 37,
                width: MediaQuery.of(context).size.width / 1.15,
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign In with Google",
                  onPressed: () async{

                    final provider = 
                    Provider.of<GoogleSignInProvider>(context,listen: false);
                    provider.googleLogin(
                      
                    );
                    Navigator.pop(context, 'Sign In with Google');
                    //todo sign in with google
                  },
                  
                )),
          ),
        ])));
  }

  navigateToSignUp() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignupScreen()));
  }
  
}
