import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Views/auth/forgot_pass.dart';
import 'package:tyamo/Views/auth/signUp.dart';
import 'package:tyamo/Views/profile/profile_screen.dart';
import 'package:tyamo/widgets/auth_heading.dart';
import 'package:tyamo/widgets/textfield.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final RoundedLoadingButtonController _buttonController =
  RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tyamo", style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              auth_heading(
                  maintext: "Sign in to tyamo",
                  subtext: "to connect with\nyour partner",
                  fontsize: 16,
                  logo: "assets/logo.jpg",
                  logosize: 60),

              SizedBox(
                height: 30,
              ),
              textField(labelText: "Email", icon: Icons.email_outlined, iconSize: 15, keyboardtype: TextInputType.emailAddress, labelSize: 15, obscureText: false),


              SizedBox(
                height: 15,
              ),
              textField(labelText: "password", icon: Icons.password, iconSize: 15, keyboardtype: TextInputType.visiblePassword, labelSize: 15, obscureText: true),
              SizedBox(
                height: 30,
              ),
              Container(

                child: Hero(tag: "auth",
                  child: RoundedLoadingButton(
                      borderRadius: 10,
                      width: 2000,
                      height: 40,
                      color: Colors.green[600],
                      controller: _buttonController,
                      onPressed: () {

                          Timer(Duration(seconds: 3), () async{
                            _buttonController.success();
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: profile_screen(),
                              ),
                            );
                          });

                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(color: Colors.white),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                alignment: Alignment.centerLeft,
                child: GestureDetector
                  (onTap: (){
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: forgot_screent(),
                    ),
                  );

                },
                    child: Text("forgot password?")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("didn't have a account?"),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: signUp_Screen(),
                        ),
                      );

                    },
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
