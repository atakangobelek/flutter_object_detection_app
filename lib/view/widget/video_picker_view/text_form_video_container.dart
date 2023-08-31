import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../text_form.dart';

final videoModelProvider = Provider<List<PhotoObjectModel>>((ref) => [PhotoObjectModel()]);

class TextFormVideoContainer extends StatefulWidget {
  int index;
   TextFormVideoContainer({
    Key? key, 
    required this.index
  }) : super(key: key);

  @override
  _TextFormVideoContainerState createState() => _TextFormVideoContainerState();
}

class _TextFormVideoContainerState extends State<TextFormVideoContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Container(
          height: 510,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 16, top: 16),
                child: Text(
                  'Obje',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormWidget(
                        name: 'x',
                        onChanged: (value) {
                          ref.watch(videoModelProvider)[widget.index].x = double.parse(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: TextFormWidget(
                        name: 'y',
                        onChanged: (value) {
                          ref.watch(videoModelProvider)[widget.index].y = double.parse(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextFormWidget(
                      name: 'w',
                      onChanged: (value) {
                        ref.watch(videoModelProvider)[widget.index].w = double.parse(value);
                      },
                    )),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        child: TextFormWidget(
                      name: 'h',
                      onChanged: (value) {
                        ref.watch(videoModelProvider)[widget.index].h = double.parse(value);
                      },
                    )),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextFormWidget(
                      name: 'previewHeight',
                      onChanged: (value) {
                        ref.watch(videoModelProvider)[widget.index].previewHeight =
                            int.parse(value);
                      },
                    )),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        child: TextFormWidget(
                      name: 'previewWidth',
                      onChanged: (value) {
                        ref.watch(videoModelProvider)[widget.index].previewWidth =
                            int.parse(value);
                      },
                    )),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextFormWidget(
                      name: 'detectedClass',
                      onChanged: (value) {
                        ref.watch(videoModelProvider)[widget.index].detectedClass = value;
                      },
                    )),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        child: TextFormWidget(
                      name: 'confidenceInClass',
                      onChanged: (value) {
                        ref.watch(videoModelProvider)[widget.index].confidenceInClass =
                            double.parse(value);
                      },
                    )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
