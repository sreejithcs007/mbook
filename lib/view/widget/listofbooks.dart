import 'package:flutter/material.dart';

import 'package:mbook/view/widget/detailspage.dart';
import 'package:provider/provider.dart';

import '../../controller/listcon.dart';

class LBooks extends StatelessWidget {
  final String categoryname;

//BookModel books;
  LBooks(
      { //required this.title, required this.thumbnailUrl,
      required this.categoryname});

  @override
  Widget build(BuildContext context) {
    List1 provider = Provider.of<List1>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(categoryname),
        leading: IconButton(
            onPressed: () {
              provider.books.clear();
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
        child: Consumer<List1>(
          builder: (BuildContext context, bookprovider, Widget? child) {
            print("w");
            print(categoryname);
            print('q');

            //  print(books);
            return FutureBuilder(
              future: bookprovider.fetchdata(categoryname),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                final books = bookprovider.books;
                print(books);
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .7,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details(
                                        title: book.title,
                                        author: book.author,
                                        thumbnailUrl: book.thumbnailUrl,
                                        description: book.description,
                                        publishedDate: book.publishedDate,
                                        publisher: book.publisher,
                                        pageCount: book.pageCount,
                                        averageRating: book.averageRating)));
                          },
                          child: Container(

                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(  book.thumbnailUrl),fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 3,
                                      blurRadius: 1
                                  )
                                ]
                            ),

                          ));
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
