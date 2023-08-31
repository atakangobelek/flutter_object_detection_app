import 'package:flutter/material.dart';



class NavigationRailDrawer extends StatefulWidget {
  const NavigationRailDrawer({Key? key}) : super(key: key);

  @override
  _NavigationRailDrawerState createState() => _NavigationRailDrawerState();
}

class _NavigationRailDrawerState extends State<NavigationRailDrawer> {
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Home'),
              selected: currentIndex == 0,
              onTap: () {
                setState(() {
                  
                });
                Navigator.pushNamed(context, '/video');
              },
            ),
            ListTile(
              title: const Text('PhotoPicker'),
              selected: currentIndex == 1,
              onTap: () {
                setState(() {
                  
                });
                Navigator.pushNamed(context, '/image');
              },
            ),
          ],
        ),
      );
  }


}
