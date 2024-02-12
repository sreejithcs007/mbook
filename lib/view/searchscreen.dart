import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main(){
//   runApp(MaterialApp(home: SearchScreen(),));
// }

class SearchScreen extends StatelessWidget{
  var textcontroller = TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("EXPLORE",style: GoogleFonts.ebGaramond(fontWeight: FontWeight.bold,fontSize: 25),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: InkWell(
                    child: TextFormField(
                      controller: textcontroller,
                      decoration: InputDecoration(
                        hintText: "Search for books",
                        prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                        hintStyle: GoogleFonts.merriweather(),
                        border: const OutlineInputBorder(),

        
                      ),
        
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }


}