import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/utils/colors.dart';
import 'package:mbook/view/Bonboard.dart';



class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<StatefulWidget> createState() =>
      _Splash2tate(); // create a mutable state for this widget
}

class _Splash2tate extends State<Splash2> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BBoard()));
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
              child: const Image(image: AssetImage("assets/image/sp3.jpg")),
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
