import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);
  static const String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1E33),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Let's Resister",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);

        }, 
        icon: const Icon(Icons.arrow_back_ios)
        ),
       
      ),
      body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
         
              SizedBox(
              child: Image.asset("images/clip-1655.png",),
              height: 250,
            ),
             
              
          
          
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                   /* validator: (input) {
                      if (input.isEmpty) return 'Enter Name';
                    },*/
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                   // onSaved: (input) => _name = input
                    ),
                      TextFormField(
                        /*  validator: (input) {
                            if (input.isEmpty) return 'Enter Email';
                          },*/
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                         // onSaved: (input) => _email = input
                         ),
                TextFormField(
                    /*validator: (input) {
                      if (input.length < 6)
                        return 'Provide Minimum 6 Character';
                    },*/
                    decoration:const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                   // onSaved: (input) => _password = input
                   ),
                 
                // ignore: deprecated_member_use
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
              child: const Text('Don\'t have an account? Register Here',style: TextStyle(fontSize: 16), ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
      ),
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              height: 37,
              width: MediaQuery.of(context).size.width / 1.15,
              child: SignInButton(
                Buttons.Google,
                text: "Sign Up with Google",
                onPressed: () {
                  //todo sign in with google
                },
                
              )),
        ),
      ],
      ),
      
        )
      
    );
  }
}
