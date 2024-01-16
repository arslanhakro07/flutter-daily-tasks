import 'dart:async';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Views/find_friends/find_friendscreen.dart';

import '../../widgets/textfield.dart';
class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
 final RoundedLoadingButtonController _profilebuttonController=RoundedLoadingButtonController();
 bool isMale=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
      //  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/bg.jpg"))),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 40),
              Container(child: CircularProfileAvatar("assets/tiimmo.jpg",),),
              SizedBox(height: 40),
              textField(labelText: "Email", icon: Icons.alternate_email_rounded, iconSize: 15, keyboardtype: TextInputType.emailAddress, labelSize: 15, obscureText: false),
              SizedBox(height: 20),
              textField(labelText: "Username", icon: Icons.supervised_user_circle, iconSize: 15, keyboardtype: TextInputType.emailAddress, labelSize: 15, obscureText: false),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale=true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,color: isMale ? Colors.deepOrangeAccent:Colors.grey),
                      child:Icon(Icons.male,size: 50,) ,
                    ),
                  ),
                  SizedBox(width: 100,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale=false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,color:!isMale ? Colors.pink:Colors.grey),
                      child:Icon(Icons.female,size: 50,) ,
                    ),
                  )

              ],),
              SizedBox(height: 50),
              Container(
                constraints: BoxConstraints(minHeight: 40,),
                child: Hero(tag:"auth",
                  child: RoundedLoadingButton(
                      borderRadius: 10,
                      width: 2000,
                      height: 40,

                      color: Colors.green[600],
                      controller: _profilebuttonController,
                      onPressed: () {

                        Timer(Duration(seconds: 3), () async{
                        _profilebuttonController.success();
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: find_friend(),
                            ),
                          );
                        });

                      },
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(color: Colors.white),
                      )),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
