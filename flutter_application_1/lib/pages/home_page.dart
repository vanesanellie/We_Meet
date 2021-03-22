import 'package:flutter/material.dart';

import 'package:flutter_application_1/theme/colors.dart';
import 'package:flutter_application_1/constant/post_json.dart';
import 'package:flutter_application_1/Screens/Comment/Comments.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            children: List.generate(posts.length, (index) {
              return PostItem(
                postImg: posts[index]['postImg'],
                profileImg: posts[index]['profileImg'],
                name: posts[index]['name'],
                caption: posts[index]['caption'],
                isLoved: posts[index]['isLoved'],
                likedBy: posts[index]['likedBy'],
                timeAgo: posts[index]['timeAgo'],
              );
            }),
          )
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  String profileImg;
  String name;
  String postImg;
  String caption;
  final isLoved;

  String timeAgo;
  String likedBy;

  PostItem({
    Key key,
    this.profileImg,
    this.name,
    this.postImg,
    this.isLoved,
    this.timeAgo,
    this.caption,
    this.likedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(profileImg),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "$name",
                            style: TextStyle(
                                color: black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 152, right: 0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "$timeAgo ago ",
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //Icon(LineIcons.horizontalEllipsis, color: black),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "$caption",
                  style: TextStyle(
                      color: black,
                      fontSize: 15,
                      height: 2,
                      fontWeight: FontWeight.w500)),
            ]),
          ),
        ),
        //28.25========================
        Container(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(0.0),
            height: 250.0,
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: white,
              image: DecorationImage(
                  image: NetworkImage(postImg), fit: BoxFit.cover),
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 15,
            top: 1,
            bottom: 10,
          ),
          child: Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite, size: 30, color: Colors.red),
              onPressed: () {},
            ),
            SizedBox(width: 1.0),
            IconButton(
              icon: Icon(Icons.mode_comment_outlined,
                  size: 30, color: Colors.black),
              onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CommentsPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(width: .0),
            IconButton(
              icon: Icon(Icons.share_outlined, size: 30, color: Colors.black),
              onPressed: () {},
            ),
            SizedBox(width: 1.0),
          ]),
        ),
        SizedBox(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Liked by ",
                style: TextStyle(
                    color: black, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                  text: "$likedBy",
                  style: TextStyle(
                      color: black, fontSize: 15, fontWeight: FontWeight.w500)),
              TextSpan(
                text: " and others ",
                style: TextStyle(
                    color: black, fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ]),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Divider(
          color: Colors.black26,
          height: 20,
          thickness: 2,
        ),
      ],
    );
  }
}
