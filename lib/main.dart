import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/theme/theme.dart';
import 'package:flutter_video/utils/routes.dart';

import 'package:flutter_video/view/video_player_view.dart';

void main() {
  runApp(const ProviderScope(
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Object Detection',
      theme: theme,
      routes: routes,
      home: const VideoPlayerView(),
    );
  }
}


