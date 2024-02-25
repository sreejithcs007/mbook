import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/bookModel.dart';
class HomeScreenController with ChangeNotifier {
  List<BookModel> _books = [];
  List<BookModel> _books1 = [];
  List<BookModel> _books2 = [];
  List<BookModel> _books3 = [];
  List<BookModel> _books4 = [];

  List<BookModel> get bookss => _books;
  List<BookModel> get bookss1 => _books1;
  List<BookModel> get bookss2 => _books2;
  List<BookModel> get bookss3 => _books3;
  List<BookModel> get bookss4 => _books4;

  bool isLoading = false;

 fetchData({required String s}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$s&startIndex=0");
    final response = await http.get(url);

    print(response.statusCode);
    print(s);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeddata = jsonDecode(response.body);

      if (decodeddata['items'] != null) {
        final List<BookModel> newBooks = decodeddata['items']
            .map<BookModel>((bookData) => BookModel.fromJson(bookData))
            .toList();
        print(newBooks);

        _books = newBooks; // Set _books to the new list
        notifyListeners();
        print(_books);
      } else {
        print("API response does not contain 'items'");
      }
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }

    isLoading = false;
    notifyListeners();
  }

  fetchData1({required String s}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$s&startIndex=0");
    final response = await http.get(url);

    print(response.statusCode);
    print(s);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeddataa = jsonDecode(response.body);

      if (decodeddataa['items'] != null) {
        final List<BookModel> newBooks1 = decodeddataa['items']
            .map<BookModel>((bookData) => BookModel.fromJson(bookData))
            .toList();
        print(newBooks1);

        _books1 = newBooks1; // Set _books to the new list
        notifyListeners();
        print(_books1);
      } else {
        print("API response does not contain 'items'");
      }
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }

    isLoading = false;
    notifyListeners();
  }


  fetchData2({required String s}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$s&startIndex=0");
    final response = await http.get(url);

    print(response.statusCode);
    print(s);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeddata2 = jsonDecode(response.body);

      if (decodeddata2['items'] != null) {
        final List<BookModel> newBooks2 = decodeddata2['items']
            .map<BookModel>((bookData) => BookModel.fromJson(bookData))
            .toList();
        print(newBooks2);

        _books2 = newBooks2; // Set _books to the new list
        notifyListeners();
        print(_books2);
      } else {
        print("API response does not contain 'items'");
      }
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }

    isLoading = false;
    notifyListeners();
  }



  fetchData3({required String s}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$s&startIndex=0");
    final response = await http.get(url);

    print(response.statusCode);
    print(s);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeddata3 = jsonDecode(response.body);

      if (decodeddata3['items'] != null) {
        final List<BookModel> newBooks3 = decodeddata3['items']
            .map<BookModel>((bookData) => BookModel.fromJson(bookData))
            .toList();
        print(newBooks3);

        _books3 = newBooks3; // Set _books to the new list
        notifyListeners();
        print(_books3);
      } else {
        print("API response does not contain 'items'");
      }
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }

    isLoading = false;
    notifyListeners();
  }


  fetchData4({required String s}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$s&startIndex=0");
    final response = await http.get(url);

    print(response.statusCode);
    print(s);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeddata4 = jsonDecode(response.body);

      if (decodeddata4['items'] != null) {
        final List<BookModel> newBooks4 = decodeddata4['items']
            .map<BookModel>((bookData) => BookModel.fromJson(bookData))
            .toList();
        print(newBooks4);

        _books4 = newBooks4; // Set _books to the new list
        notifyListeners();
        print(_books4);
      } else {
        print("API response does not contain 'items'");
      }
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }

    isLoading = false;
    notifyListeners();
  }

}
