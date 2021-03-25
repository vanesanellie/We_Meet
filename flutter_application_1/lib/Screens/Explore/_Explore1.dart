import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/story_json.dart';
import 'package:http/http.dart' as http;

class Explore1 extends StatefulWidget {
  @override
  _Explore1State createState() => _Explore1State();
}

class _Explore1State extends State<Explore1> {

  TextEditingController username = new TextEditingController();
  String name;
  String url = 'https://wemeetuntar.000webhostapp.com/Search.php';
  Future<String> senddata(BuildContext context) async {
    final response =
        await http.post(Uri.parse(url), body: {
          "searchpeople": username.text,
          name : "result",
        });

  }
  

  @override
  Widget build(BuildContext context) {

    print(name);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: TextField(
          controller: username,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              icon: Icon(Icons.search, color: Colors.black),
              hintText: "Search ",
              hintStyle: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {},
          ),
        ],
      ),
      // body: Container(
      //   padding: EdgeInsets.only(top: 30),
      //   child: Container(
      //     height: size.height * 1,
      //     padding: EdgeInsets.only(
      //       left: 16,
      //       right: 16,
      //       top: 0,
      //       bottom: 24,
      //     ),
      //     child: GridView.count(
      //       crossAxisCount: 3,
      //       crossAxisSpacing: 8,
      //       mainAxisSpacing: 8,
      //       physics: BouncingScrollPhysics(),
      //       children: List.generate(19, (index) {
      //         return Container(
      //           child: GestureDetector(
      //             onTap: (){
      //             },
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(10),
      //                   ),
      //                   image: DecorationImage(
      //                       image: AssetImage("assets/images/Post_" +
      //                           index.toString() +
      //                           ".jpg"),
      //                       fit: BoxFit.cover)),
      //             ),
      //           ),

      //         );
      //       }),
      //     ),
      //   ),
      // ),
    );
  }
}
