import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Blood Donation Champ",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                "Welcome to Blood Donation Application ",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Let's Start"))
          ]),
        )),
      ),
    );
  }
}
