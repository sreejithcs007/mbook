import 'package:flutter/material.dart';
import 'package:mbook/view/profile.dart';
import '../../utils/colors.dart';
import '../Bhome.dart';
import 'library.dart';

class BSearch extends StatefulWidget {
  const BSearch({super.key});

  @override
  State<BSearch> createState() => _BSearchState();
}

class _BSearchState extends State<BSearch> {
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
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
                height: 50,
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 665.0, left: 10, right: 10),
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
                            MaterialPageRoute(builder: (context) => const BHome()));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const BSearch()));
                        setState(() {
                          isButtonTapped1 = !isButtonTapped1;
                          isButtonTapped2 = false;
                          isButtonTapped3 = false;
                          isButtonTapped = false;
                        });
                      },
                      icon: Icon(Icons.search, size: 30, color: ontxt)),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ProfileScreen()));
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
    ));
  }
}
