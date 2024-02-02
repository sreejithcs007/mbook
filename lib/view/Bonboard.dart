import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mbook/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firstPage.dart';
class BBoard extends StatefulWidget {
  @override
  State<BBoard> createState() => _BBoardState();
}

class _BBoardState extends State<BBoard> {
  late SharedPreferences prefs;
  @override
  void initState() {

    checking();

    super.initState();
  }

  Future<void> checking() async {
    prefs = await SharedPreferences.getInstance();
    bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
    // seenOnboarding ? FirstPage() : BBoard();
    if (seenOnboarding) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FirstPage()),
      );
  }
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            image: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(

                  image: AssetImage("assets/image/000.jpg"),
                  fit: BoxFit.cover,
                ))),
            titleWidget: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ONE WORLD,",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    "WITH MANY ",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    "STORIES",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  )
                ],
              ),
            ),
            body: "",
            decoration: PageDecoration(fullScreen: true,titlePadding: EdgeInsets.only(top: 10,bottom: 30))),
        PageViewModel(
            image: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(

                        image: AssetImage("assets/image/inimreadurfav.png"),
                        fit: BoxFit.cover))),
            titleWidget: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "READ YOUR \nFAVOURITE ",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    "BOOK",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  )
                ],
              ),
            ),
            body: "",
            decoration: PageDecoration(fullScreen: true)),
        PageViewModel(
            image: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(

                        image: AssetImage("assets/image/01.jpg"),
                        fit: BoxFit.cover))),
            // child: Image(image: AssetImage("assets/image/33.jpg"),fit: BoxFit.fill)),
            titleWidget: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "KEEP READING ",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    "YOU WILL ",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    "FALL IN ",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    "LOVE",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  )
                ],
              ),
            ),
            body: "",
            decoration: PageDecoration(fullScreen: true)),
        PageViewModel(
            image: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(

                        image: AssetImage("assets/image/kpp.jpg"),
                        fit: BoxFit.cover))),
            titleWidget: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "STORIES ALL OVER THE",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    " WORLD , ",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    "INSIDE YOUR ",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  ),
                  Text(
                    "POCKET",
                    style: GoogleFonts.goblinOne(color: ontxt, fontSize: 30),
                  )
                ],
              ),
            ),
            body: "",
            decoration: PageDecoration(fullScreen: true)),
      ],
      dotsDecorator: DotsDecorator(
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        activeSize: Size(15, 15),
        color: btton,
        activeColor: ontxt,
      ),
      onDone: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('seenOnboarding', true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FirstPage()));
      },
      onSkip: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('seenOnboarding', true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FirstPage()));
      },
      done: Text(
        "GET STARTED",
        style: GoogleFonts.lemon(fontSize: 15,
          color: sk,
        ),
      ),
      back: Icon(Icons.arrow_back_outlined),
      next:Text("NEXT",style: GoogleFonts.lemon(fontSize: 15,color: sk)),
      skip: Text("SKIP",style: GoogleFonts.lemon(fontSize: 15,color: sk),),
      showSkipButton: true,
      //showBackButton: true
    );
  }

}
