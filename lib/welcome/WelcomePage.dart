import 'dart:convert';

import 'package:bda/controllers/firebase/auth/FirebaseAuthService.dart';
import 'package:bda/models/album.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  List<Album> globalAlbums = [];
  Future<http.Response> fetchAlbums() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var result = response.body.toString();
    Iterable json = jsonDecode(result);
    List<Album> albums =
        List<Album>.from(json.map((model) => Album.fromJson(model)));

    setState(() {
      globalAlbums = albums;
    });
    print(result);
    var statusCode = response.statusCode;
    return response;
  }

  @override
  void initState() {
    fetchAlbums();
    _signIn();
    _createNewUser();
    super.initState();
  }

  void _signUp() async {
    String email = "abc@g.com";
    String password = "123456";
    User? _user = await _auth.signUpWithEmailAndPassword(email, password);
    if (_user != null) {
      print("User created");
    }
  }

  void _createNewUser() async {
    var user = <String, dynamic>{
      "first": "Alan",
      "middle": "Mathison",
      "last": "Turing",
      "email": "asdf@g.com",
      "password": "123456",
      "born": 1912
    };
    var id = await _auth.createNewUserProfile(user);
    print(id);
  }

  void _signIn() async {
    String email = "abc@g.com";
    String password = "123456";
    User? _user = await _auth.signInWithEmailAndPassword(email, password);
    if (_user != null) {
      print("User logged in");
      print("User logged in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SafeArea(
            child: Container(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Blood Champ",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(height: 500.0),
                      items: globalAlbums.map((album) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.amber),
                              child: Container(
                                height: 400,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      height: 200,
                                      child:
                                          Image.asset("assets/images/bda1.png"),
                                    ),
                                    Expanded(
                                        child: Text(
                                      album.title,
                                      style: TextStyle(color: Colors.red),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Text(
                    "Welcome to Bload donation champ application",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        backgroundColor: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Let's Start")),
                  )
                ]),
          ),
        )),
      ),
    );
  }
}
