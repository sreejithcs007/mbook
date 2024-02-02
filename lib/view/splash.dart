import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/utils/colors.dart';
import 'package:mbook/view/Bonboard.dart';

void main() {
  runApp(MaterialApp(
    home: Splash2(),
    debugShowCheckedModeBanner: false,
  ));
}

class Splash2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _Splash2tate(); // create a mutable state for this widget
}

class _Splash2tate extends State<Splash2> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BBoard()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btton,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: Container(
              child: Image(image: AssetImage("assets/image/sp3.jpg")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: Container(
              child: Text(
                "MBOOK",
                style:
                    GoogleFonts.lora(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
