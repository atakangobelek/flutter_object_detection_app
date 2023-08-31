import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/photo_object_model.dart';



final offerModelProvider = Provider.autoDispose<PhotoObjectModel>((ref) => PhotoObjectModel());

class TextFormWidget extends StatefulWidget {
  final String name;
  final Function(String) onChanged;
  const TextFormWidget({Key? key, required this.name, required this.onChanged})
      : super(key: key);

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Theme.of(context).colorScheme.onBackground,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          labelText: widget.name,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          focusColor: Theme.of(context).colorScheme.onSecondaryContainer,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          floatingLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Lütfen konu giriniz.';
          }
          return null;
        },
        onChanged: widget.onChanged);
  }
}

