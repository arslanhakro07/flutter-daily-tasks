import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/find_friends/accept_reject.dart';
import 'package:tyamo/Views/find_friends/invite.dart';
class find_friend extends StatelessWidget {
  const find_friend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Friends", style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          Padding(padding: EdgeInsets.all(20),
              child: GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>invite_screen()));
              },
                  child: Icon(Icons.person,color: Colors.white,)))
        ],
      ),
      body:Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            SizedBox(height: 30,),
           Row(children: [
             Container(
               height: 45,
               width: 300,
               margin: EdgeInsets.only(left: 20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(40),
                 border: Border.all(color: Colors.black26)
               ),
               child: TextField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(borderSide: BorderSide.none),
                   hintText: "Hey Arslan type a username",
                 ),
               ),
             ),
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orangeAccent, ),
                child: const  Icon(Icons.search,size: 30,color: Colors.white,))
           ],),
            SizedBox(
              height: 15,
            ),
           Container(alignment: Alignment.center,
             width: double.infinity,
             child:Card(
               elevation: 10,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
               child: Container(alignment: Alignment.center,

                 child: Column(
                   children: [
                     Padding(padding: EdgeInsets.only(top: 0),
                       child: ListTile(leading: Container(height: 60,width: 60,
                         decoration: BoxDecoration(shape: BoxShape.circle),
                         child: CircularProfileAvatar("",backgroundColor: Colors.blue,),
                       ) ,
                       title:  Text("@arslanhakro07",style: GoogleFonts.poppins(fontSize: 17),
                       ),subtitle:  Text("arslanhakro",style: GoogleFonts.poppins(fontSize: 14,),),
                         trailing: GFButton(
                           onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>accep_reject()));
                           },text: "send request",color: Colors.green,shape: GFButtonShape.pills,),
                       ),
                     ),
                   ] ),
             ) ,
           ),



    ), SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(150)),

              child: Image(
                image: AssetImage("assets/56877.jpg",),height: 230,),),
            SizedBox(
              height: 20,
            ),
            Text("find your friends on tyammo or\ninvite your friends on tyamo",style: GoogleFonts.poppins(fontSize: 20),textAlign: TextAlign.center,),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: (){}, child: Text("invite a friend",style: TextStyle(color: Colors.white),))
          ],
        ),
      ) ,
    );
  }
}
