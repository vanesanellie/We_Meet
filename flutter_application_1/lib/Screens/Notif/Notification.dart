import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/root_app.dart';

class Notif1 extends StatefulWidget {
  @override
  Notif1State createState() => Notif1State();
}

class Notif1State extends State<Notif1> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          leading: new IconButton(
              color: Colors.black,
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RootApp();
                    },
                  ),
                );
              }),
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView(children: <Widget>[
              _notifList(
                  "https://6.viki.io/image/2ce3da973a92445f9e3bd9008e3f0045.jpeg?s=900x600&e=t",
                  "5 minutes ago",
                  "angellina liked your post"),
              Divider(height: 10.0),
              _notifList(
                  "https://tse1.mm.bing.net/th?id=OIP.omK6UyjD-ZscbPCN6A29NwHaKX&pid=Api&P=0&w=300&h=300",
                  "8 minutes ago",
                  "yongkysaputra comment on your post"),
              Divider(height: 10.0),
              _notifList(
                  "https://tse3.mm.bing.net/th?id=OIP.KHTMuz1gHYjbIvZIQsLFggHaNK&pid=Api&P=0&w=300&h=300",
                  "10 minutes ago",
                  "jimmy liked your post"),
              Divider(height: 10.0),
              _notifList(
                  "https://lh3.googleusercontent.com/vFNYTzcQ4nuZxMW1V6fr0VfT2x2jY0QMb_YseZHr4FMlq1mDO2N-rsvfmm1ehMqXNU_UXxzuIKrWSRvoLvs_QQYM0VNfhUJY=w1600-rj",
                  "23 minutes ago",
                  "vanesanellie liked your post"),
              Divider(height: 10.0),
              _notifList(
                  "https://tse2.mm.bing.net/th?id=OIP.BqFEq6DVLS8eIrYJMmdMLwHaJQ&pid=Api&P=0&w=300&h=300",
                  "32 minutes ago",
                  "jastienphang mention you in their story")
            ])));
  }

  Widget _notifList(String image, String time, String desc) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListTile(
        leading:
            CircleAvatar(backgroundImage: NetworkImage(image), radius: 35.0),
        title: Text(desc),
        subtitle: Text(time),
      ),
    );
  }
}
