import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/utils/colors.dart';
import 'package:mbook/view/widget/carousel.dart';
import 'package:mbook/view/widget/library.dart';
import 'package:mbook/view/profile.dart';
import 'package:mbook/view/widget/search.dart';
void main(){
  runApp(const MaterialApp(home: BHome(),));
}

class BHome extends StatefulWidget {
  const BHome({super.key});

  @override
  State<StatefulWidget> createState() => _BHomeState();
}

class _BHomeState extends State<BHome> {
  bool isButtonTapped = false;
  bool isButtonTapped1 = false;
  bool isButtonTapped2 = false;
  bool isButtonTapped3 = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [ln3, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const Text(""),
                  backgroundColor: ln3,
                  elevation: 0,
                  forceElevated: true,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Text(
                      "MBOOK",
                      style: GoogleFonts.lora(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Text(
                      "POPULAR BOOKS",
                      style: GoogleFonts.lora(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: SizedBox(height: 200, width: 100, child: Carslide()),
                )),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("View More",
                          style: GoogleFonts.lora(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.white,
                    thickness: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Text(
                      "TRENDING BOOKS",
                      style: GoogleFonts.lora(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: SizedBox(height: 200, width: 300, child: Carslide()),
                )),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("View More",
                          style: GoogleFonts.lora(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.white,
                    thickness: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Text("BOOKS FOR YOU",
                        style: GoogleFonts.lora(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: SizedBox(height: 200, width: 300, child: Carslide()),
                )),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("View More",
                          style: GoogleFonts.lora(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.white,
                    thickness: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Text("EDITORS CHOICE",
                        style: GoogleFonts.lora(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: SizedBox(height: 200, width: 300, child: Carslide()),
                )),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("View More",
                          style: GoogleFonts.lora(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.white,
                    thickness: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Text(
                      "NEW RELEASE",
                      style: GoogleFonts.lora(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: SizedBox(height: 200, width: 300, child: Carslide()),
                )),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("View More",
                          style: GoogleFonts.lora(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.white,
                    thickness: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Text("Explore More Books",
                        style: GoogleFonts.lora(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 150),
                  child: SizedBox(height: 200, width: 300, child: Carslide()),
                )),
              ],
            ),
            Positioned(
              top: 770,
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                height: 200,
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
                          color: ontxt,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BSearch()));
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
                              MaterialPageRoute(builder: (context) => const BLib()));
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
                                  builder: (context) => const ProfileScreen()));
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
            )
          ])),
    );
  }
}
