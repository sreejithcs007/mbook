import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bottom_nav_controller.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<BottomNavController>(context).selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
        ],
        onTap:
            Provider.of<BottomNavController>(context, listen: false).onItemTap,
      ),
    );
  }
}
