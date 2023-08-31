import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videoProvider = StateProvider<PlatformFile?>((ref) {                          //read video on video_picker_view
  return null;
});