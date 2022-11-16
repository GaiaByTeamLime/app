import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  int index = 0;
  BottomNavigation(int index) {
    this.index = index;
  }

  @override
  _bottomNavigation createState() => _bottomNavigation();
}

class _bottomNavigation extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        var routes = ['/', '/settings'];
        Navigator.popUntil(context, ModalRoute.withName('/'));
        Navigator.pushNamed(context, routes[index]);
      },
      currentIndex: widget.index,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.house),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
