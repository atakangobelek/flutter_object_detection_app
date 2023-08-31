import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageProvider = StateProvider.autoDispose<PlatformFile?>((ref) {                   
  return null;
}); 