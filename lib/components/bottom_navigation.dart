import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  int index = 0;
  BottomNavigation(this.index, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _bottomNavigation createState() => _bottomNavigation();
}

// ignore: camel_case_types
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
