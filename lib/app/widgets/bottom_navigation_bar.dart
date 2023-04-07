import 'package:flutter/material.dart';

//ignore: must_be_immutable
class BottomNavigationBarWidget extends StatelessWidget {
  void Function(int)? function;
  int pageIndex;
  final List<BottomNavigationBarItem> tabs;

  BottomNavigationBarWidget({
    Key? key,
    required this.function,
    required this.pageIndex,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[100],
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.teal,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: false,
      elevation: 0,
      onTap: function,
      currentIndex: pageIndex,
      items: tabs,
    );
  }
}
