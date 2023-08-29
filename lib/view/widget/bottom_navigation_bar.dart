import 'package:flutter/material.dart';
import 'package:flutter_video/view/photo_page.dart';

import '../video_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeName = ModalRoute.of(context)!.settings.name;
    if (routeName == '/video') {
      currentIndex = 0;
    } else if (routeName == '/image') {
      currentIndex = 1;
    }
  }

  void _onNavItemTapped(int index) {
    setState(() {
      currentIndex = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/video');
          break;
        case 1:
          Navigator.pushNamed(context, '/image');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onNavItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo),
          label: 'PhotoPicker',
        ),
      ],
    );
  }
}

