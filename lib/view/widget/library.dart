import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/view/widget/carousel.dart';
import 'package:mbook/view/widget/profile.dart';
import 'package:mbook/view/widget/search.dart';
import '../../utils/colors.dart';
import '../Bhome.dart';

class BLib extends StatefulWidget {
  @override
  State<BLib> createState() => _BLibState();
}

class _BLibState extends State<BLib> {
  bool isButtonTapped = false;

  bool isButtonTapped1 = false;

  bool isButtonTapped2 = false;

  bool isButtonTapped3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [ln3, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text("MY COLLECTIONS",
                    style: GoogleFonts.lora(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 10),
              child: Text("CONTINUE READING...",
                  style: GoogleFonts.lora(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.red,
                  child: Carslide()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 10),
              child: Text("SAVED TO READ",
                  style: GoogleFonts.lora(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.red,
                  child: Carslide()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 10, right: 10),
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ln.withOpacity(1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => BHome()));
                          setState(() {
                            isButtonTapped = !isButtonTapped;
                            isButtonTapped1 = false;
                            isButtonTapped2 = false;
                            isButtonTapped3 = false;
                          });
                        },
                        icon: Icon(
                          Icons.home,
                          size: 30,
                          color: isButtonTapped ? ontxt : sk,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BSearch()));
                          setState(() {
                            isButtonTapped1 = !isButtonTapped1;
                            isButtonTapped2 = false;
                            isButtonTapped3 = false;
                            isButtonTapped = false;
                          });
                        },
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: isButtonTapped1 ? ontxt : sk,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => BLib()));

                          setState(() {
                            isButtonTapped2 = !isButtonTapped2;
                            isButtonTapped1 = false;
                            isButtonTapped3 = false;
                            isButtonTapped = false;
                          });
                        },
                        icon: Icon(
                          Icons.book_outlined,
                          size: 30,
                          color: ontxt,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                          setState(() {
                            isButtonTapped3 = !isButtonTapped3;
                            isButtonTapped2 = false;
                            isButtonTapped1 = false;
                            isButtonTapped = false;
                          });
                        },
                        icon: Icon(
                          Icons.person,
                          size: 30,
                          color: isButtonTapped3 ? ontxt : sk,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
