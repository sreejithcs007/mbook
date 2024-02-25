import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbook/model/bookModel.dart';
import 'package:mbook/view/widget/detailspage.dart';
import 'package:provider/provider.dart';
import '../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  var textcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {

    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Center(
          child: Text(
            "EXPLORE",
            style: GoogleFonts.ebGaramond(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(100, 70),
          child: Container(
            child: InkWell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: "Search for books",
                  suffixIcon: IconButton(
                      onPressed: () {
                        provider.books.clear();
                        provider.searchData(
                            searchtext: textcontroller.text.toLowerCase());
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  hintStyle: GoogleFonts.merriweather(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            )),
          ),
        ),
      ),
      body: Consumer<SearchScreenController>(
        builder: (context, booksProvider, child) {
          final books = booksProvider.books;
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return InkWell(
                onTap: () => Navigator.push(
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
                        averageRating: book.averageRating,
                      ),
                    )),
                child: ListTile(
                  leading: Image.network(book.thumbnailUrl),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
