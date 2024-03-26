import 'package:city_guide_app/forgotPassword/forgotPwd.dart';
import 'package:city_guide_app/pages/navpages/main_page.dart';
import 'package:city_guide_app/pages/signup/sign_up1.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Validation
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  bool _isLoading = false;

  // Email validation
  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Password validation
  String? validatePwd(String? pwd) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{8,}$');
    final isPwdValid = passwordRegex.hasMatch(pwd ?? '');
    if (!isPwdValid) {
      return 'Password must be of 8 characters including digits and alphabets';
    }
    return null;
  }

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 100),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'myfonts',
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Email address",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'myfonts',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Email TextField
                TextFormField(
                  cursorColor: Colors.grey,
                  validator: validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: '   Your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                  ),
                ),
                // Password TextField
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Password",
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
                  keyboardType: TextInputType.text,
                  validator: validatePwd,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                  ),
                  obscureText: _isObscured,
                ),
                // Forgot password link
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'myfonts',
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPwdScreen()));
                          // Handle forgot password
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Login button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      // simulate loading for 2 sec
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));

                      // Handle login button tap
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'myfonts',
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Social login options
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
                // Sign up link
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          " Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
