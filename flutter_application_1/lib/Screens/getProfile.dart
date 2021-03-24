import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class user {
  String username;
  getData() async {
    var url = 'https://wemeetuntar.000webhostapp.com/GetProfile.php';
    var data = {"result":username};
    var response = await http.post(Uri.parse(url), body: (data));
    data = json.decode(response.body);
    print (username);
  }
  
}