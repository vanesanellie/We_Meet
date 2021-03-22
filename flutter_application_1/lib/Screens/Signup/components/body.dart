import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login/login_screen.dart';
import 'package:flutter_application_1/Screens/Signup/components/background.dart';
import 'package:flutter_application_1/Screens/Signup/components/or_divider.dart';
import 'package:flutter_application_1/Screens/Signup/components/social_icon.dart';
import 'package:flutter_application_1/Screens/Signup/signup_screen.dart';
import 'package:flutter_application_1/components/already_have_an_account_acheck.dart';
import 'package:flutter_application_1/components/rounded_button.dart';
import 'package:flutter_application_1/components/rounded_input_field.dart';
import 'package:flutter_application_1/components/rounded_password_field.dart';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  Future<void> _showMyDialog(BuildContext context, String title, String title1,
      String title2, bool issuccess) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(title1),
                Text(title2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                if (issuccess == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();

  Future<String> senddata(BuildContext context) async {
    String url = 'https://wemeetuntar.000webhostapp.com/Register.php';
    final response = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
      "email": email.text,
    });
    if (response.statusCode == 200) {
      print(response.body);
      if (response.body == "200") {
        _showMyDialog(context, "Registrasi berhasil",
            "Akun anda berhasil di buat", "Silahkan klik OK", true);
      } else {
        _showMyDialog(context, "Registrasi gagal", "Username telah terdaftar",
            "Silahkan klik OK", false);
      }
    } else {
      throw Exception('Failed to create album.');
    }
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
              'Register',
              style: TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            TextFormField(
              controller: username,
              decoration: new InputDecoration(
                labelText: "Enter Username",
                fillColor: Colors.white,
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
              controller: password,
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
              height: 25,
            ),
            new TextFormField(
              controller: email,
              decoration: new InputDecoration(
                labelText: "Enter Email",
                fillColor: Colors.white,
                filled: true,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  size: 20,
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Email cannot be empty";
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
              text: "REGISTER",
              press: () {
                senddata(context);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
