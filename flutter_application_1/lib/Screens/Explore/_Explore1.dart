import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Explore1 extends StatefulWidget {
  @override
  _Explore1State createState() => _Explore1State();
}

class _Explore1State extends State<Explore1> {

  TextEditingController searchpeople = new TextEditingController();
  String name;
  String url = 'https://wemeetuntar.000webhostapp.com/Search.php';
  var resultSearch;

  Future search() async {
    String url = 'https://wemeetuntar.000webhostapp.com/Search.php';
    var data = {"searchpeople": searchpeople.text};
    var response = await http.post(Uri.parse(url), body: (data));
    var message = json.decode(response.body);
    setState(() {
      resultSearch = message;
    });
    print(resultSearch);
    print(resultSearch.length);
  }

  void reset(){
   searchpeople.clear();
  }

  Widget _searchList(String name) {
    print(name);
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListTile(
        leading:
            Icon(Icons.person),
        title: Text(name)
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: TextField(
          controller: searchpeople,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              //icon: Icon(Icons.search, color: Colors.black),
              hintText: "Search ",
              hintStyle: TextStyle(color: Colors.black),
              ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {search();},
          ),
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {reset();},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListTile(
              leading:
                  Icon(Icons.person),
              title: Text(resultSearch[index]['Username'])
            ),
          );
        }
        
      )
      
      
      
      
      // Padding(
      //       padding: const EdgeInsets.all(5.0),
      //       child: ListView(children: <Widget>[
      //         _searchList("angel"),
      //         Divider(height: 10.0),
      //         _searchList("angel")
      // ]))
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
