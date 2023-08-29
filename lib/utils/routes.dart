import 'package:flutter/material.dart';


import '../view/photo_page.dart';
import '../view/video_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/video': (BuildContext context) => const VideoPlayerView(),
  '/image': (BuildContext context) => const PhotoPicker(),

};