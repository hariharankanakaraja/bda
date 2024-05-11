import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          top: false,
          bottom: true,
          child: Container(
            color: Colors.red,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Color(0xff76608A),
                ),
                Expanded(
                    child: Container(
                  height: double.infinity,
                  color: Color(0xffBAC8D3),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        height: 200,
                        color: Color(0xffA0522D),
                      ),
                      Container(
                        height: 800,
                        color: Color(0xffE3C800),
                      ),
                      Container(
                        height: 300,
                        color: Color(0xffFA6800),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
