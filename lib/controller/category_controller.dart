import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mbook/model/bookModel.dart';

class CategoryController with ChangeNotifier{

  List<String> categoryList = ['Fiction','Action','Adventure','Novel','Horror','romantic','Anime','classic','Fantasy','History','Crime','comic'];

  String category = '';

  List<BookModel> _books = [];
  List<BookModel> get books => _books;

  int _startIndex = 0;



  onTap({required int index}){
    category = categoryList[index].toLowerCase();
    fetchData(category);
    print(category);
    notifyListeners();
  }



  late BookModel bookModel;
  bool isLoading = false;

   fetchData(category) async {
    isLoading = true;
    final url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=$category");
    print(category);

    final response = await http.get(url);
    print(response.statusCode);


    if(response.statusCode == 200) {
      final Map<String, dynamic> decodeddata = jsonDecode(response.body);
      if (decodeddata['items'] != null) {
        final List<BookModel> newBooks = decodeddata['items']
            .map<BookModel>((bookData) => BookModel.fromJson(bookData))
            .toList();
        _books.addAll(newBooks);
        print(_books);
        //_startIndex += newBooks.length;
        notifyListeners();
      }
    }
    else{
      print("Api failed");
    }
    isLoading = false;
    notifyListeners();
  }
}