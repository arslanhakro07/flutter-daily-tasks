import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/widgets/textfield.dart';

import '../../widgets/auth_heading.dart';

class forgot_screent extends StatefulWidget {
  const forgot_screent({super.key});

  @override
  State<forgot_screent> createState() => _forgot_screentState();
}

class _forgot_screentState extends State<forgot_screent> {
  final RoundedLoadingButtonController _forgotbuttonController=RoundedLoadingButtonController();
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
                  maintext: "Forgot your password?",
                  subtext: "",
                  fontsize: 16,
                  logo: "assets/logo.jpg",
                  logosize: 60),
              Container(
                height: 150,
                width: 150,
                child: Image.asset("assets/forgot.jpg"),
              ),
              SizedBox(height: 40),
              Text(
                  "To request for a new one,Type your email address below:a link to reset password will be sent to your email",textAlign: TextAlign.center
                ,),
              SizedBox(height: 15,),
              textField(labelText: "Email", icon: Icons.alternate_email_rounded, iconSize: 15, keyboardtype: TextInputType.emailAddress, labelSize: 15, obscureText: false),
              SizedBox(height: 15,),
              Container(
                constraints: BoxConstraints(minHeight: 40,),
                child: RoundedLoadingButton(
                    borderRadius: 10,
                    width: double.infinity,
                    height: 40,

                    color: Colors.green[600],
                    controller: _forgotbuttonController,
                    onPressed: () {
                      setState(() {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>signUp_Screen()));
                      });
                    },
                    child: Text(
                      "Send",
                      style: GoogleFonts.poppins(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
