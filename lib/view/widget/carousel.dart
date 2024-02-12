import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/utils/colors.dart';

class Carslide extends StatelessWidget {
  var img = [
    "assets/image/science.jpg",
    "assets/image/detective.jpg",
    "assets/image/comic.jpg",
    "assets/image/horror.jpg"
  ];
  var txt = ["Science", "Detective", "Comic", "Horror"];

  Carslide({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Container(
                // color: Colors.blue,
                alignment: const Alignment(0, 0.5),
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(img[index]), fit: BoxFit.fill)),
                child: Text(
                  txt[index],
                  style: GoogleFonts.anton(fontSize: 20, color: txtclr),
                )),
          );
        });
  }
}
