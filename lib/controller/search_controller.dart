

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/bookModel.dart';

class SearchScreenController with ChangeNotifier {
  BookModel? bookModel;
  bool isLoading = false;

  Future<void> searchData({required String searchtext})async {
    isLoading = true;
    //https://www.googleapis.com/books/v1/volumes?q=$searchBook&maxResults=39
    final url =Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$searchtext&maxResults=39");

    notifyListeners();
    try{
      final response = await http.get(url,headers: {'Content-Type' : 'application/json'});

      if(response.statusCode == 200){
        final Map<String,dynamic> decodeddata = jsonDecode(response.body);
        bookModel = BookModel.fromJson(decodeddata);
      }else{
        print("Api failed");
      }

    }catch(e){
      print(e);
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }
}
