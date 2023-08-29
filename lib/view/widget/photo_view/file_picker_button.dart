import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../photo_page.dart';

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
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result == null || result.files.isEmpty) return;
            PlatformFile? image = result.files.first;
            setState(() {});
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
