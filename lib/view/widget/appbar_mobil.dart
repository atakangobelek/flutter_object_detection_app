import 'package:flutter/material.dart';

class AppbarWeb extends StatelessWidget implements PreferredSizeWidget {
  final String topic;
  const AppbarWeb({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: preferredSize,
      
      child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            topic,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
