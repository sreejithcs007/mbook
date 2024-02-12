import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mbook/model/bookModel.dart';

class CategoryController with ChangeNotifier{

  List<String> categoryList = ['Fiction','Action','Adventure','Novel','Horror','romantic','Anime','classic','Fantasy','History','Crime','comic'];

  String category = '';


  onTap({required int index}){
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }



  late BookModel bookModel;
  bool isLoading = false;

  void fetchData() async {
    isLoading = true;
    final url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=$category&maxResults=39");
    print(category);

    final response = await http.get(url);
    print(response.statusCode);
    Map<String,dynamic> decodedData ={};

    if(response.statusCode == 200){
      decodedData = jsonDecode(response.body);
    }
    else{
      print("Api failed");
    }
    bookModel = BookModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}