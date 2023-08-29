import 'package:flutter/material.dart';
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
        List<VideoModel> videoSecond =
            ref.watch(videoProvider.notifier).state;

        return Container(
          height: height == null ? 750 : height,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: videoSecond.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber,
                ),
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Second: ${videoSecond[index].second}'),
                    /* Text('detectedClass ${DummyData.dummyData[index][0]['detectedClass']}') */
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
