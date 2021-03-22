import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/comment_json.dart';

class CommentsPage extends StatefulWidget {
  @override
  createState() => new CommentsPageState();
}

class CommentsPageState extends State<CommentsPage> {
  List<String> _comments = [
    "kelompok",
    "yongky",
    "angellina",
    "jimmy",
    "vanesa",
    "jastien"
  ];

  void _addComment(String val) {
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < comments.length) {
        return _buildCommentItem(comments[index]['image'], comments[index]['name'], comments[index]['description'], comments[index]['dateTime']);
      }
    });
  }

  Widget _buildCommentItem(String image, String name, String desc, String dateTime) {
    return _notifList(image, name, desc, dateTime);
  }

  @override
  Widget build(BuildContext context0) {
    return Scaffold(
        appBar: new AppBar(backgroundColor: Colors.white, title: Text("Comments")),
        body: Column(children: <Widget>[
          Expanded(child: _buildCommentList()),
          TextField(
            onSubmitted: (String submittedStr) {
              _addComment(submittedStr);
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20.0),
                hintText: "Masukkan Komentar Anda"),
          )
        ]));
  }

  Widget _notifList(String image, String name, String desc, String dateTime) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListTile(
        leading:
            CircleAvatar(backgroundImage: NetworkImage(image), radius: 35.0),
        title: Text(name + " / " + dateTime),
        subtitle: Text(desc),
      ),
    );
  }


}

