import 'package:cardgame/Functions/form_container_widget.dart';
import 'package:cardgame/screens/startingSccreen.dart';
import 'package:cardgame/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_auth_services.dart';
import 'global/common/toast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isSigning = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                'Sign In With Email',
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
                    FormContainerWidget(
                      controller: _emailController,
                      hintText: "Username",
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 16.0),
                    FormContainerWidget(
                      controller: _passwordController,
                      hintText: "Password",
                      isPasswordField: true,
                    ),
                    const SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff141E1D), // Button color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: const Text('Sign In'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign-up screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        'Don\'t have an account? Sign up',
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

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushNamed(context, "/");
    } else {
      // showToast(message: "some error occured");
    }
  }
}

// void _signIn() {
//   // Implement your sign-in logic here
//   FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: _emailController.text, password: _passwordController.text).then((
//       value) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const startScreen()));
//   }).onError((error, stackTrace) {
//     print("error is ${error}");
//   });
// }
