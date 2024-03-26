import 'package:city_guide_app/constants/constants.dart';
import 'package:city_guide_app/misc/colors.dart';
import 'package:city_guide_app/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPwdScreen extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPwdScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPwdScreen> createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  get emailController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20, top: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'myfonts',
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Text(
                "Don't worry! It happens. Please enter the email associated with your account.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'myfonts',
                  fontSize: 13,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Email TextField
              Container(
                margin: const EdgeInsets.only(bottom: 10),
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
              Column(
                children: [
                  TextField(
                    controller: emailController,
                    cursorColor: Constants.greyTextColor,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Constants.greyColor,
                      hintText: '   Enter your email address',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Constants.buttonBorderRadius),
                        borderSide: BorderSide(color: Constants.greyColor),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: Constants.searchBarButtonHeight,
                        horizontal: 15,
                      ),
                    ),
                    style: TextStyle(
                      color: Constants.greyTextColor,
                    ),
                  ),
                  SizedBox(
                      height:
                          10), // Adjust the spacing between the TextField and the button
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text);
                        // Password reset email sent successfully
                      } catch (error) {
                        print('Error sending password reset email: $error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Constants.buttonBorderRadius),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),
              // Send code button
              ElevatedButton(
                onPressed: () {
                  print("tapped");
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Constants.greyColor,
                ),
                child: Text(
                  "Send code",
                  style: TextStyle(
                    color: Constants.greyColor,
                    fontFamily: 'myfonts',
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Bottom div
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Remember password?",
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
                                builder: (context) => const Login()));
                      },
                      child: const Text(
                        " Log in",
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
    );
  }
}
