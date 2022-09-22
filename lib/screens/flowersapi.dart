import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Flowers{
  String url = 'http://127.0.0.1:8000/api/flowers';
  Uri _url = Uri.parse('http://127.0.0.1:8000/api/flowers');
  var _data;
   FirebaseAuth auth= FirebaseAuth.instance;
   Future getData()async{
     String token = await auth.currentUser!.getIdToken();
     print(token);
     var response =  await http.get(Uri.parse('http://127.0.0.1:8000/api/flowers'),
         headers: {HttpHeaders.contentTypeHeader: "application/json",
           HttpHeaders.authorizationHeader: "Bearer $token"});
     print(response.body);
   }

}