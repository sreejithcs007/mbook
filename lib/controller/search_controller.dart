import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/bookModel.dart';

class SearchScreenController with ChangeNotifier {
  BookModel? bookModel;
  List<BookModel> _books = [];
  List<BookModel> get books => _books;
  int _startIndex = 0;
  bool isLoading = false;

  Future<void> searchData({required String searchtext}) async {
    isLoading = true;
    //https://www.googleapis.com/books/v1/volumes?q=$searchBook&maxResults=39
    final url = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$searchtext&startIndex=$_startIndex");

    notifyListeners();

      final response = await http.get(url,);
     // print(response.body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodeddata = jsonDecode(response.body);
        if (decodeddata['items'] != null) {
          final List<BookModel> newBooks = decodeddata['items'].map<BookModel>((bookData) => BookModel.fromJson(bookData)).toList();
          _books.addAll(newBooks);
          print(_books);
          _startIndex += newBooks.length;
          notifyListeners();

        } else {
          print("Api failed");
        }
        isLoading = false;
        notifyListeners();
      }

  }
}
