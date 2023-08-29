import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/theme/theme.dart';
import 'package:flutter_video/utils/routes.dart';

import 'package:flutter_video/view/video_page.dart';

void main() {
  runApp(const ProviderScope(
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: routes,
      home: const VideoPlayerView(),
    );
  }
}


