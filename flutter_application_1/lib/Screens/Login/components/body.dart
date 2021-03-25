
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login/components/background.dart';
import 'package:flutter_application_1/Screens/Profile/_Profil1.dart';
import 'package:flutter_application_1/Screens/getProfile.dart';
import 'package:flutter_application_1/components/text_field_container.dart';
import 'package:flutter_application_1/pages/root_app.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/components/already_have_an_account_acheck.dart';
import 'package:flutter_application_1/Screens/Signup/signup_screen.dart';
import 'package:flutter_application_1/components/rounded_button.dart';
import 'package:flutter_session/flutter_session.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool visible = false;
  final login_username = TextEditingController();
  final login_password = TextEditingController();

  Future userLogin() async {
    setState(() {
      visible = true;
      
    });
  

    String email = login_username.text;
    String password = login_password.text;

    String url = 'https://wemeetuntar.000webhostapp.com/Login.php';

    var data = {"login_username": email, "login_password": password};
    var response = await http.post(Uri.parse(url), body: (data));
    var message = (response.body);
    print(response.body);

    if (message == "Login Matched") {
      setState(() {
        visible = false;
      });

      await FlutterSession().set('username', email);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RootApp();
          },
        ),
      );

    } else {

      setState(() {
        visible = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }


  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {    
    
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        
        padding: new EdgeInsets.only(
            top: 20.0, right: 50.0, left: 50.0, bottom: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              'Sign in',
              style: TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            TextFormField(
              controller: login_username,
              decoration: new InputDecoration(
                labelText: "Enter Username",
                fillColor: Colors.white,
                filled: true,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  size: 20,
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Username cannot be empty";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              height: 25,
            ),
            new TextFormField(
              controller: login_password,
              autocorrect: true,
              obscureText: true,
              decoration: new InputDecoration(
                labelText: "Enter Password",
                fillColor: Colors.white,
                filled: true,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 20,
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Password cannot be empty";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RoundedButton(
              text: "Sign in",
              press: () {
                userLogin();
              },
            ),
            Visibility(
                visible: visible,
                child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: CircularProgressIndicator())),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}