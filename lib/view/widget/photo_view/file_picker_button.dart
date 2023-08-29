import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../view_model/image_handling_view_model.dart';

class FilePickerButton extends StatefulWidget {
  const FilePickerButton({Key? key}) : super(key: key);

  @override
  _FilePickerButtonState createState() => _FilePickerButtonState();
}

class _FilePickerButtonState extends State<FilePickerButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ElevatedButton(                                
          onPressed: () async {
            //File Picker
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result == null || result.files.isEmpty) return;
            PlatformFile? image = result.files.first;
            ref.read(imageProvider.notifier).state = image;
          },
          child: const Text(
            'Select An Image',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
