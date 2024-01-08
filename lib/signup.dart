import 'package:cardgame/firebase_auth_services.dart';
import 'package:cardgame/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() async{
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if(user != null){
      print("User is created");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));

    }
  }


    // // Implement your sign-in logic here
    // FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
    // }).onError((error, stackTrace) {
    //   print("error is ${error}");
    // });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141E1D),
      body: Column(
        children: <Widget>[
          // Top bar with the time and signal icons
          // Signup text
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign Up With Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Form fields
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        // border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff141E1D)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff141E1D)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        // border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff141E1D)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff141E1D)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        // border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff141E1D)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff141E1D)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff141E1D), // Button color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text('Sign Up'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign-in screen
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignInScreen()));
                      },
                      child: const Text('Already have an account? Sign In',
                        style: TextStyle(color: Color(0xff141E1D)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTextField({required String hint, bool isPassword = false}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff141E1D)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff141E1D)),
        ),
      ),
      obscureText: isPassword,
    );
  }
}
