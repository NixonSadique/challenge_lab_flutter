import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  final isAdmin = true;
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: "Feed",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.groups_outlined),
          label: "Groups",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: "Profile",
        ),
      ],
    );
  }
}
