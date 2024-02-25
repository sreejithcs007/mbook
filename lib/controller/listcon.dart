import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/bookModel.dart';

class List1 extends ChangeNotifier {
  List<BookModel> _books = [];

  List<BookModel>get books => _books;


  fetchdata(category1) async {
    final url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=$category1");
    final response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeddata = jsonDecode(response.body);
      if (decodeddata['items'] != null) {
        final List<BookModel> newBooks = decodeddata['items']
            .map<BookModel>((bookData) => BookModel.fromJson(bookData))
            .toList();
        _books.addAll(newBooks);
        print(_books);
        print('i');
        //_startIndex += newBooks.length;

      }
    }
  }
}