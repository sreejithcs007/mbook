import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Details extends StatelessWidget {
  final String title;
  final String author;
  final String thumbnailUrl;
  final String description;
  final String publishedDate;
  final String publisher;
  final int pageCount;
  final double averageRating;

  Details({
    required this.title,
    required this.author,
    required this.thumbnailUrl,
    required this.description,
    required this.publishedDate,
    required this.publisher,
    required this.pageCount,
    required this.averageRating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios)),
            floating: true,
            pinned: true,
           // backgroundColor: Colors.white.withOpacity(0.1),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50, top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(thumbnailUrl),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 0.3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.ebGaramond(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\t\t- \t$author",
                    style: GoogleFonts.lora(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "DETAILS",
                    style: GoogleFonts.ebGaramond(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  buildTableRow("Author", author),
                  buildTableRow("Publisher", publisher),
                  buildTableRow("Published Date", publishedDate),
                  buildTableRow("Page Count", pageCount.toString()),
                  Text(
                    "DESCRIPTION",
                    style: GoogleFonts.ebGaramond(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,

                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                    
                        text: TextSpan(
                          style: GoogleFonts.lora(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: description,style: TextStyle(height: 1.8)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTableRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Table(
        columnWidths: {0: FlexColumnWidth(0.5)},
        children: [
          TableRow(
            children: [
              TableCell(
                child: Text(
                  label,
                  style: GoogleFonts.ebGaramond(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              TableCell(
                child: Text(
                  value,
                  style: GoogleFonts.lora(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
