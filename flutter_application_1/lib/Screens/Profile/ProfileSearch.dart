import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/edit_profile.dart';
import 'package:flutter_application_1/pages/root_app.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'dart:typed_data';

class ProfileSearch extends StatefulWidget {
  @override
  _ProfileSearchState createState() => _ProfileSearchState();
}

class _ProfileSearchState extends State<ProfileSearch> {
  String base64Default =
      "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";
  String username;
  Uint8List bytes;
  String desc;
  String friends;
  String posts;
  var feeds;
  List<Uint8List> feedsBytesTemp;
  List<List<int>> feedsBytes;
  List<String> newProfileData = [];
  List<dynamic> newFeedData;
  bool isFetch;

  Future<void> fetchData() async {
    var user = await FlutterSession().get("usernamesearch");
    setState(() {
      username = user;
    });
    getData().then((res) {
      setState(() {
        newProfileData = res;
        desc = newProfileData[0];
        friends = newProfileData[1];
        posts = newProfileData[2];
      });
    });
    getProfilePic().then((res) {
      setState(() {
        bytes = res;
      });
    });
    getFeeds().then((res) {
      setState(() {
        newFeedData = res;
        isFetch = true;
      });
    });
  }

  Future<List> getData() async {
    String url = 'https://wemeetuntar.000webhostapp.com/GetProfile.php';
    var data = {"username": username};
    var response = await http.post(Uri.parse(url), body: (data));
    var profile = json.decode(response.body);
    List<String> newProfileDataTemp = [];
    newProfileDataTemp.add(profile[0]["DescBox"]);
    newProfileDataTemp.add(profile[1]["Friends"]);
    newProfileDataTemp.add(profile[2]["Post"]);
    return newProfileDataTemp;
  }

  Future<Uint8List> getProfilePic() async {
    String url = 'https://wemeetuntar.000webhostapp.com/GetProfile.php';
    var data = {"username": username};
    var response = await http.post(Uri.parse(url), body: (data));
    var profile = json.decode(response.body);
    if (profile[0]['ProfilePic'] == null || profile[0]['ProfilePic'] == "") {
      print(base64.decode(base64Default));
      return base64.decode(base64Default);
    } else {
      print(base64.decode(profile[0]['ProfilePic']));
      return base64.decode(profile[0]['ProfilePic']);
    }
  }

  Future<List> getFeeds() async {
    String url = 'https://wemeetuntar.000webhostapp.com/GetProfile_Feed.php';
    var data = {"username": username};
    var response = await http.post(Uri.parse(url), body: (data));
    var feedResponse;
    if (response.body != "No Post") {
      feedResponse = json.decode(response.body);
    }
    return feedResponse;
  }

  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Uint8List tempFoto;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: desc != null &&
              bytes != null &&
              friends != null &&
              posts != null &&
              isFetch == true
          ? SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: size.height * 0.45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/WeMeet.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 36,
                            ),
                            // CircleAvatar(
                            //   radius: 48,
                            //   backgroundImage:
                            //       AssetImage("assets/images/Post_11.jpg"),
                            // ),
                            bytes != null
                                ? Container(
                                    height: 80,
                                    width: 80,
                                    child: CircleAvatar(
                                        radius: 48,
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child: Image.memory(
                                            bytes,
                                            width: 80,
                                            height: 80,
                                          ),
                                        )),
                                  )
                                : new Container(),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              '$username',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '$desc',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 30,
                                width: 50,
                                color: Colors.blue,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SettingsUI()),
                                          );
                                        },
                                        
                                      ),
                                    ])),
                            Expanded(
                              child: Container(),
                            ),
                            Container(
                              height: 64,
                              color: Colors.black.withOpacity(0.4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Container(
                                    width: 110,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "FRIENDS",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '$friends',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "POSTS",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '$posts',
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
                      newFeedData != null
                          ? Container(
                              height: size.height * 0.60 - 56,
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 0,
                                bottom: 24,
                              ),
                              child: GridView.count(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                physics: BouncingScrollPhysics(),
                                children:
                                    List.generate(newFeedData.length, (index) {
                                  tempFoto = base64.decode(
                                      newFeedData[index]['Image_Base64']);
                                  return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: Colors.black38,
                                          width: 1,
                                        ),
                                      ),
                                      height: 80,
                                      width: 80,
                                      child: Image.memory(
                                        tempFoto,
                                        width: 80,
                                        height: 80,
                                      ));
                                  // return Container(
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.all(
                                  //       Radius.circular(10),
                                  //     ),
                                  //     image: DecorationImage(
                                  //       image: AssetImage("assets/images/Post_" +
                                  //           index.toString() +
                                  //           ".jpg"),
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  // ),
                                  // );
                                }),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Center(
                                  child: Column(
                                children: <Widget>[
                                  Text(
                                    "No Post",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 30,)),
                                  Icon(Icons.no_photography, size: 100,)
                                ],
                              )),
                            )
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
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
