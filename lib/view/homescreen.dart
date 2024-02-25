import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/controller/home_screen_controller.dart';
import 'package:mbook/controller/listcon.dart';
import 'package:mbook/main.dart';
import 'package:mbook/view/widget/listofbooks.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(create: (context) => HomeScreenController()),
//     ChangeNotifierProvider(create: (context) => List1()),
//   ], child: MyApp3()));
// }

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(children: [
            UserAccountsDrawerHeader(
              accountName: Text("hi"),
              accountEmail: Text("hello"),
            ),


            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text("Privacy"),
            ),
          ]),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
               title: Text("MBOOK",style: GoogleFonts.fasterOne(color: Colors.black,fontSize: 55,),
                 ),
                
              ),
          
          
              SliverToBoxAdapter(
                  child: Container(
          
                      height: 300,
                      width: 200,
                      child: Consumer<HomeScreenController>(builder:
                          (BuildContext context, HomeScreenController provid,
                          Widget? child) {
                        return FutureBuilder(
                          future: provid.fetchData3(s: "newrelease"),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return CircularProgressIndicator();}
                            else {
                              final books3 = provid.bookss3;
                              print("o");
                              print(books3);
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("\t\tNEW RELEASE",style: GoogleFonts.ebGaramond(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LBooks(
                                                        categoryname: "Newrelease"),
                                              ),
                                            );
                                          },
                                          child: Text("ViewMore"),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemExtent: 200,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          final book3 = books3[index];
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 20.0,left: 8,right: 8,bottom: 8),
                                            child: Container(
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: NetworkImage(book3.thumbnailUrl,),
                                          fit: BoxFit.fill
                                          ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.4),
                                                spreadRadius: 3,
                                                blurRadius: 1
                                              )
                                            ]
                                          )
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        );
                      }))),

          
              SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(


                        height: 300,
                        width: 200,
                        child: Consumer<HomeScreenController>(builder:
                            (BuildContext context, HomeScreenController provid,
                            Widget? child) {
                          return FutureBuilder(
                            future: provid.fetchData4(s: "Bestseller"),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                return CircularProgressIndicator();}
                              else {
                                final books4 = provid.bookss4;
                                print("o");
                                print(books4);
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("\t\tBEST SELLER",
                                            style: GoogleFonts.ebGaramond(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LBooks(
                                                        categoryname: "BestSeller"),
                                              ),
                                            );
                                          },
                                          child: Text("ViewMore"),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemExtent: 200,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          final book4 = books4[index];
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 8.0,top: 20,right: 8,left: 8),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(image: NetworkImage(book4.thumbnailUrl,),
                                                fit: BoxFit.fill
                                                ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black.withOpacity(0.4),
                                                        spreadRadius: 3,
                                                        blurRadius: 1
                                                    )
                                                  ]

                                              ),



                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                );
                              }
                            },
                          );
                        })),
                  )),
          
          
          
              SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(

                        height: 300,
                        width: 200,
                        child: Consumer<HomeScreenController>(builder:
                            (BuildContext context, HomeScreenController provid,
                                Widget? child) {
                              return FutureBuilder(
                                future: provid.fetchData(s: "Popular"),
                                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                  return CircularProgressIndicator();}
                                  else {
                                    final books = provid.bookss;
                                    print("o");
                                    print(books);
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text("POPULAR BOOKS",
                                                style: GoogleFonts.ebGaramond(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LBooks(
                                                            categoryname: "Popular"),
                                                  ),
                                                );
                                              },
                                              child: Text("ViewMore"),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            itemExtent: 200,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 4,
                                            itemBuilder: (context, index) {
                                              final book = books[index];
                                              return Padding(
                                                padding: const EdgeInsets.only(bottom: 8.0,top: 20,left: 8,right: 8),
                                                child: Container(
                                              decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(image: NetworkImage(book.thumbnailUrl,),
                                              fit: BoxFit.fill
                                              ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black.withOpacity(0.4),
                                                        spreadRadius: 3,
                                                        blurRadius: 1
                                                    )
                                                  ]
                                              ),
                                                )
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    );
                                  }
                                },
                              );
                        })),
                  )),
          
          
          
          
          
              SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(

                        height: 300,
                        width: 200,
                        child: Consumer<HomeScreenController>(builder:
                            (BuildContext context, HomeScreenController provid,
                            Widget? child) {
                          return FutureBuilder(
                            future: provid.fetchData1(s: "Trending"),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                return CircularProgressIndicator();}
                              else {
                                final books1 = provid.bookss1;
                                print("o");
                                print(books1);
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("\t\tTRENDING BOOKS",
                                            style: GoogleFonts.ebGaramond(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LBooks(
                                                        categoryname: "Trending"),
                                              ),
                                            );
                                          },
                                          child: Text("ViewMore"),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemExtent: 200,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          final book1 = books1[index];
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 20.0,bottom: 8,left: 8,right: 8),
                                            child: Container(
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: NetworkImage(book1.thumbnailUrl,),
                                          fit: BoxFit.fill
                                          ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black.withOpacity(0.4),
                                                    spreadRadius: 3,
                                                    blurRadius: 1
                                                )
                                              ]
                                          )

                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                );
                              }
                            },
                          );
                        })),
                  )),

          
          
          
              SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(

                        height: 300,
                        width: 200,
                        child: Consumer<HomeScreenController>(builder:
                            (BuildContext context, HomeScreenController provid,
                            Widget? child) {
                          return FutureBuilder(
                            future: provid.fetchData2(s: "Editorschoice"),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                return CircularProgressIndicator();}
                              else {
                                final books2 = provid.bookss2;
                                print("o");
                                print(books2);
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("\t\tEDITOR'S CHOICE",
                                            style: GoogleFonts.ebGaramond(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LBooks(
                                                        categoryname: "Editor's Choice"),
                                              ),
                                            );
                                          },
                                          child: Text("ViewMore"),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemExtent: 200,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          final book2 = books2[index];
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 20.0,left: 8,right: 8,bottom: 8),
                                            child: Container(
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: NetworkImage(book2.thumbnailUrl,),
                                          fit: BoxFit.fill
                                          ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black.withOpacity(0.4),
                                                    spreadRadius: 3,
                                                    blurRadius: 1
                                                )
                                              ]
                                          ),
                                            )
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                );
                              }
                            },
                          );
                        })),
                  )),
          
          
          
          
          
            ],
          ),
        ));
  }
}
