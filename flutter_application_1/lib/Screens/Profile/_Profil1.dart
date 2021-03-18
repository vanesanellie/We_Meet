import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/root_app.dart';

class Profil1 extends StatefulWidget {
  @override
  _Profil1State createState() => _Profil1State();
}

class _Profil1State extends State<Profil1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  height: size.height * 0.40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Post_11.jpg"), 
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[

                      SizedBox(
                        height: 36,
                      ),

                      CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage("assets/images/Post_11.jpg"),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      Text(
                        "Angellina",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),

                      SizedBox(
                        height: 4,
                      ),

                      Text(
                        "Untar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      Expanded(
                        child: Container(),
                      ),

                      Container(
                        height: 64,
                        color: Colors.black.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            Expanded(
                              child: Container(),
                            ),

                            Container(
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    "VISIT", 
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  
                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    "13564", 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            Container(
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    "FOLLOWING", 
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  
                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    "364", 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            Container(
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    "FOLLOWER", 
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  
                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    "3753", 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            Expanded(
                              child: Container(),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Material(
                  elevation: 1,
                  child: Container(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Icon(
                          Icons.web,
                          color: Colors.black,
                          size: 28,
                        ),

                        Icon(
                          Icons.image,
                          color: Colors.black,
                          size: 28,
                        ),

                        Icon(
                          Icons.play_circle_outline,
                          color: Colors.black,
                          size: 28,
                        ),

                      ],
                    ),
                  ),
                ),

                Container(
                  height: size.height * 0.60 - 56,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 24,),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(19, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Post_" + index.toString() + ".jpg"), 
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                  ),
                ),

              ],
            ),
          
            Positioned(
              top: 72,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RootApp()),
                  );
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}