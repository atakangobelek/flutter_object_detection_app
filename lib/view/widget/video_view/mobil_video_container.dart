import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/object_detectio_model.dart';
import '../../../view_model/object_detection_view_model.dart';

/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/object_detectio_model.dart';
import '../../../view_model/object_detection_view_model.dart';

class MobilVideoContainer extends StatelessWidget {
  double? height;

  MobilVideoContainer({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        List<VideoModel> videoSecond = ref.watch(videoProvider.notifier).state;

        return Container(
          height: 250,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: videoSecond.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber,
                ),
                height: 5,
                width: 5,
                margin: const EdgeInsets.only(bottom: 4),
                child:
                    Center(child: Text('Second: ${videoSecond[index].second}')),
              );
            },
          ),
        );
      },
    );
  }
}
 */