import 'package:flutter/material.dart';

class Carslide extends StatelessWidget {
  var img = [ "assets/image/science.jpg",
    "assets/image/detective.jpg",
    "assets/image/comic.jpg",
    "assets/image/horror.jpg",
    ""
  ];
  var txt =["Science",
    "Detective",
    "Comic",
    "Horror"
  ];

  Carslide({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10),
            child: Container(
                height: 200, width: 50,
                color: Colors.blue,
                // alignment: Alignment(0,0.5),
                // decoration: BoxDecoration(
                //   color: Colors.blue,
                //     borderRadius: BorderRadius.circular(20),
                  //  image: DecorationImage(image: AssetImage(img[index]),fit: BoxFit.fill),
                //),
                // child:
                //
                // Text(txt[index],style: GoogleFonts.anton(fontSize: 30,color: txtclr),)
            
            ),

          );
        });
  }
}