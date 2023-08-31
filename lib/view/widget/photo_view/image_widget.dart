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
    double width = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 490,
              color: Colors.grey[300],
              child: ref.watch(imageProvider) != null
                  ? Stack(
                      children: [
                        Expanded(
                          child: Image.memory(
                            Uint8List.fromList(
                                ref.watch(imageProvider.notifier).state!.bytes!),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        BoundingBox([
                          Object(
                              rect: Rect(
                                x: ref.watch(offerModelProvider).x,
                                y: ref.watch(offerModelProvider).y,
                                w: ref.watch(offerModelProvider).w,
                                h: ref.watch(offerModelProvider).h,
                              ),
                              detectedClass:
                                  ref.watch(offerModelProvider).detectedClass,
                              previewHeight:
                                  ref.watch(offerModelProvider).previewHeight,
                              previewWidth:
                                  ref.watch(offerModelProvider).previewWidth)
                        ], 490, width)
                      ],
                    )
                  : Text('Please select an image', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.shadow,)),
            ),
          ),
        );
      },
    );
  }
}
