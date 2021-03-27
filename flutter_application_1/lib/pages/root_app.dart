import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Explore/_Explore1.dart';
import 'package:flutter_application_1/Screens/Notif/Notification.dart';
import 'package:flutter_application_1/Screens/Profile/_Profil1.dart';
import 'package:flutter_application_1/pages/chat_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/theme/colors.dart';
import 'package:flutter_application_1/Screens/feeds/feeds.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: Colors.white,
      body:getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody(){
    List<Widget> pages = [
     HomePage(),
      Center(
          child: Text("Upload Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white
          ),),
      ),
      Center(
          child: Text("Activity Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white
          ),),
      ),
      Center(
          child: Text("Account Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white
          ),),
      )
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }




  Widget getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top:20),
                child: Container(
                  
                  height: 120,
                  width: 120,
                  
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/logowm1.jpg"),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
            ),

             SizedBox(width: 50.0),
            IconButton(
              icon: Icon(Icons.favorite, size: 40, color: Colors.black),
              
              onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Notif1();
                    },
                  ),
                );},
            ),
            SizedBox(width: 5.0),
            IconButton(
              icon: Icon(Icons.group, size: 40, color: Colors.black),
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChatPage();
                    },
                  ),
                );},
            ),
            SizedBox(width: 3.0),
          ],
        ),
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Upload"),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Activity"),
      );
    } else {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Account"),
      );
    }
  }

  Widget getFooter() {
    return Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined, size: 40),
              onPressed: () {},
            ),
            SizedBox(width: 40.0),
            IconButton(
              icon: Icon(Icons.search_outlined, size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Explore1();
                    },
                  ),
                );
              },
            ),
            SizedBox(width: 40.0),
            IconButton(
              icon: Icon(Icons.file_upload, size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UploadPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(width: 40.0),
            IconButton(
              icon: Icon(Icons.account_circle_outlined, size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Profil1();
                    },
                  ),
                );
              },
            ),
            SizedBox(width: 40.0),
          ],
          
        ));
  }
}