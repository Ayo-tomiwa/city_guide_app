// import 'dart:convert';
// import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePwd(String? pwd) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{8,}$');
    final isPwdValid = passwordRegex.hasMatch(pwd ?? '');
    if (!isPwdValid) {
      return 'Password must be at least 8 characters including digits and alphabets';
    }
    return null;
  }

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pwd = TextEditingController();

  void successMessage(String successMsg) {
    final snackBar = SnackBar(
      content: Text(successMsg),
      backgroundColor: Colors.orange,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signUp(String email, String pwd, String username) async {
    // Your sign up logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'myfonts',
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'myfonts',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.grey,
                controller: username,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  // Adjust styling as needed
                  hintText: 'Enter your username',
                ),
              ),
              // Email TextField
              // Password TextField
              // Terms and conditions checkbox
              // Sign Up button
              // Already have an account? Login link
            ],
          ),
        ),
      ),
    );
  }
}
