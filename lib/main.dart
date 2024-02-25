import 'package:flutter/material.dart';
import 'package:mbook/controller/listcon.dart';
import 'package:mbook/view/splash.dart';

import 'package:provider/provider.dart';
import 'controller/bottom_nav_controller.dart';
import 'controller/category_controller.dart';
import 'controller/home_screen_controller.dart';
import 'controller/search_controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create : (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create : (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create : (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create : (context) => CategoryController(),
        ),
        ChangeNotifierProvider(create: (context)=>List1())

      ],
      child:  MaterialApp(
        home: Splash2(),
        debugShowCheckedModeBanner: false,

      ),

    );
  }
}
