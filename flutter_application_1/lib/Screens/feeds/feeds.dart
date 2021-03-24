import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/Screens/Profile/_Profil1.dart'; 
import 'package:flutter_application_1/components/rounded_button.dart';
import 'package:flutter_session/flutter_session.dart';

class UploadPage extends StatefulWidget {
  UploadPage() : super();
 
  final String title = "Upload Image ";
 
  @override
  UploadPageState createState() => UploadPageState();
}
 
class UploadPageState extends State<UploadPage> {
  //
  final String uploadEndPoint = "https://wemeetuntar.000webhostapp.com/Feed.php";
  final caption = TextEditingController();
  Future<File> file;
  String status = '';
  String image_base64;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }
 
  setStatus(String message) {
    setState(() {
      status = message;
    });
  }
 
  startUpload() {
    setStatus('Uploading Image...');
    if (tmpFile == null) {
      setStatus(errMessage);
      return;
    }
    //String caption = tmpFile.path.split('/').last;
    upload();
  }

  String username;
  Future<void> getUsername() async {
    username = await FlutterSession().get("username");
    print(username);
  }
 
  Future upload() async {
    // http.post(Uri.parse (uploadEndPoint), body: {
    //   "username": "angel",
    //   "image_base64": image_base64,
    //   "caption": "",
    //   "datetime": DateTime.now()
    // }).then((result) {
    //   setStatus(result.statusCode == 200 ? result.body : errMessage);
    // }).catchError((error) {
    //   setStatus(error);
    // });
    String isi = caption.text;
    var data = {"username": '$username', "image_base64": image_base64, "caption": isi};
    var response = await http.post(Uri.parse(uploadEndPoint), body: (data));
    var message = (response.body);
    if (message == "Upload Success") {
      setStatus('Upload Success...');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Profil1();
          },
        ),
      );
    }
    else {
      setStatus('Upload Failed...');
    }
  }
 
  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          image_base64 = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            style: TextStyle(fontSize: 17.0),
            
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    getUsername();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RoundedButton(
              text: "Chose Image",
              press: () {
                chooseImage();
              },
            ),
            SizedBox(
              height: 10.0,
            ),

            showImage(),
          
            Container
            ( 
              alignment: Alignment.center,
              child: Column(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 30.0)),
                TextFormField(
                controller: caption,
                decoration: new InputDecoration(
                labelText: "Caption",
                fillColor: Colors.white,
                filled: true,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                prefixIcon: Icon(
                  Icons.mode_outlined,
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
              ],),
            ),
            SizedBox(
              height: 10.0,
            ),
           RoundedButton(
              text: "Upload Choosed Image",
              press: () {
                startUpload();
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
