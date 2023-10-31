import 'package:flutter/material.dart';

import '../../texts/strings.dart';

// ignore: must_be_immutable
class CustomBottomNavigation extends StatefulWidget {
  final Color bgColor;
  final Color unselectedItemColor;
  final Color selectedItemColor;

  Function(int index)? onChange;
  CustomBottomNavigation({
    super.key,
    this.bgColor = Colors.black,
    this.unselectedItemColor = Colors.grey,
    this.selectedItemColor = Colors.white,
    this.onChange,
  });

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: widget.bgColor,
      unselectedItemColor: widget.unselectedItemColor,
      selectedItemColor: widget.selectedItemColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(Icons.home), label: BottomNavigation.home),
        BottomNavigationBarItem(
            icon: const Icon(Icons.circle_notifications_rounded),
            label: BottomNavigation.aTour),
        BottomNavigationBarItem(
            icon: const Icon(Icons.account_box),
            label: BottomNavigation.storageBox),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    if (widget.onChange != null) {
      widget.onChange!(index);
    }

    setState(() {
      _selectedIndex = index;
    });
  }
}
