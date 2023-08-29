import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String topic;
  const Appbar({Key? key, required this.topic}) : super(key: key);
  

  @override
  Widget build(BuildContext context,) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,

        title:  Text(topic)
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
