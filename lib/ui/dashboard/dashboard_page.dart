import 'package:ecomm_class/ui/dashboard/pages/cart_page.dart';
import 'package:ecomm_class/ui/dashboard/pages/favorit_page.dart';
import 'package:ecomm_class/ui/dashboard/pages/home/home_page.dart';
import 'package:ecomm_class/ui/dashboard/pages/menu_page.dart';
import 'package:ecomm_class/ui/dashboard/pages/profile_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 2;

  List<Widget> myNav_page = [
    MenuPage(),
    FavoritPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myNav_page[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              isSelected: selectedIndex == 0,
              onPressed: () {
                selectedIndex = 0;
                setState(() {});
              },
              icon: Icon(Icons.dashboard_outlined, color: Colors.grey),
              selectedIcon: Icon(
                Icons.dashboard_outlined,
                color: Colors.deepOrange,
              ),
            ),
            IconButton(
              isSelected: selectedIndex == 1,
              onPressed: () {
                selectedIndex = 1;
                setState(() {});
              },
              icon: Icon(Icons.favorite_outline, color: Colors.grey),
              selectedIcon: Icon(
                Icons.favorite_outline,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(width: 28,),
            IconButton(
              isSelected: selectedIndex == 3,
              onPressed: () {
                selectedIndex = 3;
                setState(() {});
              },
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
              selectedIcon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.deepOrange,
              ),
            ),
            IconButton(
              isSelected: selectedIndex == 4,
              onPressed: () {
                selectedIndex = 4;
                setState(() {});
              },
              icon: Icon(Icons.person_outline_rounded, color: Colors.grey),
              selectedIcon: Icon(
                Icons.person_outline_rounded,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        onPressed: () {
          selectedIndex = 2;
          setState(() {});
        },
        child: Icon(
            Icons.home_outlined,
            color: Colors.white,
        ),
      ),
    );
  }
}
