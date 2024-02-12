import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/bookModel.dart';


class  HomeScreenController with ChangeNotifier{

  late BookModel bookModel;
  bool isLoading = false;

  fetchData() async{
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String,dynamic> decodedData = {};
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