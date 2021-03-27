import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Explore1 extends StatefulWidget {
  @override
  _Explore1State createState() => _Explore1State();
}

class _Explore1State extends State<Explore1> {
  List listSearch = new List();
  TextEditingController searchpeople = new TextEditingController();
  String name;
  String url = 'https://wemeetuntar.000webhostapp.com/Search.php';

  Future<List> search() async {
    String url = 'https://wemeetuntar.000webhostapp.com/Search.php';
    var data = {"searchpeople": searchpeople.text};
    var response = await http.post(Uri.parse(url), body: (data));
    var message = json.decode(response.body);
    return message;
  }

  void fetchData() {
    search().then((res) {
      setState(() {
        listSearch.addAll(res);
      });
    });
  }

  void reset(){
   searchpeople.clear();
   setState(() {
      listSearch.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {fetchData();},
          ),
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {reset();},
          ),
        ],
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: listSearch.length,
          itemBuilder: ((BuildContext _context, int position) {
            return new ListTile(
              leading: Icon(Icons.people),
              title: new Text( listSearch[position]['Username'])
            );   
          }),
        ),
      ),
    );
  }
}
