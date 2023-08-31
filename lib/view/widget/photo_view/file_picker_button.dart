
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilePickerButton extends StatefulWidget {
  Future<Null> Function() onPressed;
  FilePickerButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _FilePickerButtonState createState() => _FilePickerButtonState();
}

class _FilePickerButtonState extends State<FilePickerButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ElevatedButton(                                
          onPressed: widget.onPressed,
          child: const Text(
            'Select An Image',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}


