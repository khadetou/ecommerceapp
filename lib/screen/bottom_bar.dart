import 'package:flutter/material.dart';
import "../widgets/icons.dart";

import './user.dart';
import "./cart.dart";
import "./feeds.dart";
import "./search.dart";
import "./home.dart";

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  //Variables
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

//Init State
  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': Home(),
      },
      {
        'page': const Feeds(),
      },
      {
        'page': const Search(),
      },
      {
        'page': const Cart(),
      },
      {
        'page': const UserInfo(),
      },
    ];
  }

//Select method
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.purple,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.feeds),
                  label: "Feeds",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(null),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.cart),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.user),
                  label: "User",
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: "Search",
          elevation: 4,
          child: Icon(MyAppIcons.search),
          onPressed: () => setState(
            () {
              _selectedPageIndex = 2;
            },
          ),
        ),
      ),
    );
  }
}
