import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/utils/colors.dart';
import 'blog.dart';
import 'breg.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.5,
                image: AssetImage(
                  "assets/image/bg11.jpg",
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100.0, left: 20, top: 250),
              child: RichText(
                  text: TextSpan(
                      style: GoogleFonts.yesevaOne(
                          fontSize: 35,
                          color: ontxt,
                          fontWeight: FontWeight.bold),
                      //TextStyle(
                      //     color: ontxt,
                      //     fontSize: 35,
                      //     fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(text: "GET \n"),
                    TextSpan(text: "STARTED!\n"),
                    TextSpan(text: "Join us now  and \nStart your\n"),
                    TextSpan(text: "Journey"),
                  ])),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 1, top: 100, left: 8, right: 8),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => BLog()));
                },
                height: 50,
                minWidth: 200,
                color: btton,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Sign in to your account",
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20, color: ontxt),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 30.0, top: 30, left: 8, right: 8),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BRegister()));
                },
                height: 50,
                minWidth: 240,
                color: btton,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Create an account",
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20, color: ontxt),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
