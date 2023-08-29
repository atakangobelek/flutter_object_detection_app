import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/view/widget/text_form.dart';
import '../../../model/object_detectio_model.dart';
import '../../../view_model/image_handling_view_model.dart';
import '../bounding_box.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: Container(
            alignment: Alignment.center,
            height: 490,
            color: Colors.grey[300],
            child: ref.watch(imageProvider) != null
                ? Stack(
                    children: [
                      Image.memory(
                        Uint8List.fromList(
                            ref.watch(imageProvider.notifier).state!.bytes!),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      BoundingBox([
                        Object(
                            rect: Rect(
                              x: ref.watch(offerModelProvider).x,
                              y: ref.watch(offerModelProvider).y,
                              w: ref.watch(offerModelProvider).w,
                              h: ref.watch(offerModelProvider).h,
                            ),
                            confidenceInClass:
                                ref.watch(offerModelProvider).confidenceInClass,
                            detectedClass:
                                ref.watch(offerModelProvider).detectedClass,
                            previewHeight:
                                ref.watch(offerModelProvider).previewHeight,
                            previewWidth:
                                ref.watch(offerModelProvider).previewWidth)
                      ], 400, 400)
                    ],
                  )
                : const Text('Please select an image'),
          ),
        );
      },
    );
  }
}
