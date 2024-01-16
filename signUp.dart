import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Views/auth/login.dart';

import '../../widgets/auth_heading.dart';
import '../../widgets/textfield.dart';
import '../profile/profile_screen.dart';
class signUp_Screen extends StatefulWidget {
  const signUp_Screen({super.key});

  @override
  State<signUp_Screen> createState() => _signUp_ScreenState();
}

class _signUp_ScreenState extends State<signUp_Screen> {
  final RoundedLoadingButtonController _signUpbuttonController=RoundedLoadingButtonController();
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
                  maintext: "Sign up to tyamo",
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
              textField(labelText: "number", icon: Icons.phone, iconSize: 15, keyboardtype: TextInputType.number, labelSize: 15, obscureText: false),
              SizedBox(
                height: 15,
              ),
              textField(labelText: "password", icon: Icons.password, iconSize: 15, keyboardtype: TextInputType.visiblePassword, labelSize: 15, obscureText: true),
              SizedBox(
                height: 15,
              ),
              textField(labelText: "confirm passwod", icon: Icons.lock_reset, iconSize: 15, keyboardtype: TextInputType.visiblePassword, labelSize: 15, obscureText: true),
              SizedBox(
                height: 35,
              ),


              Hero(tag: "auth",
                child: RoundedLoadingButton(

                    borderRadius: 10,
                    width: 2000,
                    height: 40,
                    color: Colors.green[600],
                    controller:_signUpbuttonController,
                    onPressed:  () {

                        Timer(Duration(seconds: 3), () async{
                        _signUpbuttonController.success();
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
                      "SignUp",
                      style: GoogleFonts.poppins(color: Colors.white),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                alignment: Alignment.centerLeft,
                child: Text("By registering you are agreeing with our terms!"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already resgistered?"),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: login_screen(),
                        ),
                      );

                    },
                    child: Text(
                      "Sign In",
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
