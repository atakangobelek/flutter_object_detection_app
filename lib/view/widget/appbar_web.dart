import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String topic;
  const AppbarWidget({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          automaticallyImplyLeading: MediaQuery.of(context).size.width > 500,
          title: Text(
            topic,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
