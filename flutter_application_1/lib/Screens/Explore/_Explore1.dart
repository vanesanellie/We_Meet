import 'package:flutter/material.dart';

class Explore1 extends StatefulWidget {
  @override
  _Explore1State createState() => _Explore1State();
}

class _Explore1State extends State<Explore1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold (
      appBar: new AppBar(
            title : TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black
                    ),
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
      
      body: Container(
        padding: EdgeInsets.only(top: 30),
          child : Container(
                  height: size.height * 1,
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
      ),
    );
  }
}