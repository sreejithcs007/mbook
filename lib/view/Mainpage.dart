import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bottom_nav_controller.dart';
import '../utils/colors.dart';

class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Provider.of<BottomNavController>(context).myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),

          color: Colors.yellow
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.yellow,


          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
        ],
        currentIndex:Provider.of<BottomNavController>(context).selectedIndex ,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: ontxt,
          unselectedItemColor: sk,
          elevation: 1,
          onTap:
          Provider.of<BottomNavController>(context,listen: false).onItemTap,



        ),
      ),

    );
  }
  
  
}