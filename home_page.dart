import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class home_page extends StatefulWidget {
  home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final GlobalKey<ScaffoldState> _homepagekey = GlobalKey();

  List<IconData> iconsList = [
    FontAwesomeIcons.circleUser,
    FontAwesomeIcons.home,
    FontAwesomeIcons.bell
  ];
  PageController _pageController = PageController(initialPage: 1);
  Widget pageviewsection() {
    return PageView(
      controller: _pageController,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      children: [
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        )
      ],
    );
  }

  int page = 1;
  int pageview = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tyamo", style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,

        // leading: GestureDetector(onTap: (){
        //   _homepagekey.currentState!.openDrawer();
        // },
        //     child: Icon(Icons.menu,color: Colors.white,)),

        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              child: Image(
                image: AssetImage("assets/profile_3135715.png"),
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/profile_3135715.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Column(
                        children: [
                          Text("Arslanhakro",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.white)),
                          Text(
                            "@arslanhakro07",
                            style: GoogleFonts.poppins(
                                fontSize: 10, color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50, top: 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple),
                                onPressed: () {},
                                child: Text("Premium",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.black))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          Column(
            children: [
              ListTile(
                  leading: Icon(FontAwesomeIcons.creditCard),
                  title: Text("Subscription",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.black))),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.black))),
              ListTile(
                  leading: Icon(FontAwesomeIcons.clipboardQuestion),
                  title: Text("Help",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.black))),
              ListTile(
                  leading: Icon(FontAwesomeIcons.message),
                  title: Text("Feedback",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.black))),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("logout",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.black))),
            ],
          )
        ],
      )
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconsList,
        activeIndex: page,
        onTap: (p0) {
          setState(() {
            pageview = p0;
            _pageController.animateToPage(p0,
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          });
        },
        activeColor: Colors.deepPurple,
        inactiveColor: Colors.grey,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.none,
      ),
      body: pageviewsection(),
    );
  }
}
