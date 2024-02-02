import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/view/widget/library.dart';
import 'package:mbook/view/widget/search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';
import '../Bhome.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isButtonTapped = false;
  bool isButtonTapped1 = false;
  bool isButtonTapped2 = false;
  bool isButtonTapped3 = false;
  String? name;
  String? pswd;

  @override
  void initState() {
    getvalue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var img = [
      "assets/image/science.jpg",
      "assets/image/detective.jpg",
    ];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [ln3, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 10,
              right: 300,
              bottom: 700,
              child: CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage("assets/image/Book.jpg"),
              ),
            ),
            Positioned(
                top: 100,
                left: 160,
                right: 90,
                bottom: 600,
                child: Container(
                  child: Text("$name",
                      style: GoogleFonts.lora(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                )),
            Positioned(
                top: 50,
                left: 370,
                right: 1,
                bottom: 800,
                child: IconButton(
                    onPressed: () {
                      bottsheet();
                    },
                    icon: Icon(Icons.settings))),
            Positioned(
                top: 200,
                bottom: 500,
                left: 10,
                right: 10,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Text("BOOKS READ",
                            style: GoogleFonts.lora(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        VerticalDivider(
                          indent: 80,
                          endIndent: 80,
                          color: Colors.grey,
                        ),
                        Text("\tTime Spent\t\t\t",
                            style: GoogleFonts.lora(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        VerticalDivider(
                          indent: 80,
                          endIndent: 80,
                          color: Colors.grey,
                        ),
                        Text("\tCompleted",
                            style: GoogleFonts.lora(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        VerticalDivider(
                          indent: 80,
                          endIndent: 80,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: 250,
                bottom: 400,
                left: 40,
                right: 10,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Text("\t\t\t0\t\t\t\t\t\t\t\t\t\t\t\t\t",
                            style: GoogleFonts.lora(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        VerticalDivider(
                          indent: 90,
                          endIndent: 100,
                          color: Colors.grey,
                        ),
                        Text("\t\t\t0 Hr 0 Min\t\t",
                            style: GoogleFonts.lora(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        VerticalDivider(
                          indent: 90,
                          endIndent: 100,
                          color: Colors.grey,
                        ),
                        Text("\t\t\t\t\t\t\t0\t\t\t\t\t\t\t\t\t\t",
                            style: GoogleFonts.lora(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        VerticalDivider(
                          indent: 90,
                          endIndent: 100,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: 450,
                bottom: 100,
                left: 10,
                right: 10,
                child: Container(
                  height: 800,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Continue reading...",
                          style: GoogleFonts.lora(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 20.0, right: 10),
                                child: Container(
                                  height: 200,
                                  width: 100,
                                  child: Image(
                                    image: AssetImage(img[index]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )),
            Positioned(
              top: 770,
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                height: 100,
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
                          color: isButtonTapped2 ? ontxt : sk,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                          setState(() {
                            isButtonTapped2 = false;
                            isButtonTapped1 = false;
                            isButtonTapped = false;
                          });
                        },
                        icon: Icon(
                          Icons.person,
                          size: 30,
                          color: ontxt,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getvalue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance()!;

    setState(() {
      name = prefs.getString("username")!;
      pswd = prefs.getString("pass");
    });
  }

  void bottsheet() {
    showModalBottomSheet(
        context: (context),
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text("Privacy"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help and support"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.chat),
                  title: Text("About"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Logout"),
                ),
              ),
            ],
          );
        });
  }
}
