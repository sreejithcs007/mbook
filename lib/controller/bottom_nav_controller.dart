import 'package:flutter/material.dart';

import '../view/categoryscreen.dart';
import '../view/homescreen.dart';
import '../view/searchscreen.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    const HomeScreen(),
    SearchScreen(),
    const CategoryScreen(),

  ];
}
