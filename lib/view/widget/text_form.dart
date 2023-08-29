import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/object_detectio_model.dart';

class OfferModel {
  int previewHeight;
  int previewWidth;
  String detectedClass;
  double confidenceInClass;
  double x;
  double y;
  double w;
  double h;

  OfferModel()
      : previewHeight = 600,
        previewWidth = 700,
        detectedClass = "Person",
        confidenceInClass = 0.85,
        x = 0.1,
        y = 0.3,
        w = 0.3,
        h = 0.2;
}

final offerModelProvider = Provider<OfferModel>((ref) => OfferModel());


class TextFormWidget extends StatefulWidget {
  final String name;
  final Function(String) onChanged;
  const TextFormWidget({ Key? key, required this.name, required this.onChanged }) : super(key: key);

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
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: widget.onChanged
                    );
  }
}

/* class TextForm extends StatefulWidget {
  const TextForm({
    Key? key,
  }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        labelText: 'X',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          ref.read(offerModelProvider).x = double.parse(value);
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        labelText: 'Y',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        ref.read(offerModelProvider).y = double.parse(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        labelText: 'W',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        ref.read(offerModelProvider).w = double.parse(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        labelText: 'H',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        ref.read(offerModelProvider).h = double.parse(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        labelText: ' previewHeight',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        ref.read(offerModelProvider).previewHeight = int.parse(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        labelText: 'previewWidth',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        ref.read(offerModelProvider).previewWidth = int.parse(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        labelText: 'detectedClass',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        ref.read(offerModelProvider).detectedClass = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        labelText: 'confidenceInClass',
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        focusColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // constraints: const BoxConstraints(maxHeight: 40),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                        floatingLabelStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen konu giriniz.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        ref.read(offerModelProvider).confidenceInClass = double.parse(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
 */

