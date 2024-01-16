import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class invite_screen extends StatelessWidget {
  const invite_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("See friends invitaions", style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          Padding(padding: EdgeInsets.all(20),
              child: Icon(Icons.person,color: Colors.white,))
        ],
      ),
      body:Column(
        children: [
          SizedBox(height: 30,),

          SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(150)),

            child: Image(
              image: AssetImage("assets/splash_pic.jpg",),height: 230,),),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your recieved invitations are currently",style: GoogleFonts.poppins(fontSize: 15),
                textAlign: TextAlign.center,),
              Text(" Empty",style: GoogleFonts.poppins(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: (){}, child: Text("invite a friend",style: TextStyle(color: Colors.white),))
        ],
      ) ,
    );;
  }
}
