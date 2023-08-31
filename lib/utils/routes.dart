import 'package:flutter/material.dart';


import '../view/photo_picker_view.dart';
import '../view/video_picker_view.dart';
import '../view/video_player_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/video': (BuildContext context) => const VideoPlayerView(),
  '/image': (BuildContext context) => const PhotoPickerView(),
  '/video_picker': (BuildContext context) => const VideoPickerPlayerView(),
};