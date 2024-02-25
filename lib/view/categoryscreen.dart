import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/controller/category_controller.dart';
import 'package:mbook/view/widget/listofbooks.dart';
import 'package:provider/provider.dart';





class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoryController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
          elevation: 1,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "CATEGORIES",
              style: GoogleFonts.ebGaramond(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoriesName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 15,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            //final book = books[index];
            return GestureDetector(
              onTap: () async {
                print(categoriesName[index]);
                await provider.fetchData(categoriesName[index]);


                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LBooks(
                              categoryname: categoriesName[index],
                            )));
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(categoriesImage[index]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3)
                          ],
                          stops: const [0.6, 0.9],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      categoriesName[index],
                      style: GoogleFonts.ebGaramond(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

List categoriesName = [
  "Fiction",
  "Classic",
  "Romance",
  "Mystery",
  "Fantasy",
  "History",
  "Comic",
  "Crime",
];

List categoriesImage = [
  "https://images.unsplash.com/photo-1474932430478-367dbb6832c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmljdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1455885661740-29cbf08a42fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2xhc3NpYyUyMGJvb2tzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cm9tYW5jZSUyMGJvb2tzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1587876931567-564ce588bfbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG15c3RlcnklMjBib29rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1439902315629-cd882022cea0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFudGFzeSUyMGJvb2tzfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1562673005-7693bd6d6e54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGlzdG9yeXxlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1608889476561-6242cfdbf622?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29taWN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1625449281218-cbb6183f0aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y3JpbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
];
