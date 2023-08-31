// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/view_model/object_detection_view_model.dart';


class VideoContainer extends StatelessWidget {

  double? height;
  VideoContainer({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final videoSecond = ref.watch(objectProvider);
        return videoSecond.when(
            data: (data) {
              return Container(
                padding: const EdgeInsets.only(right: 16, left: 16),
                height:
                    height == null ? 750 : height, 
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        height: 75,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Second: ${data[index].second}'),
                          ],
                        ),
                      );
                    }),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'));
      },
    );
  }
}





















/* Container(
          padding: const EdgeInsets.only(right: 16, left: 16),
        height: height == null ? 750 : height,                 //duzenle height null olamaz
        child: ListView.builder(
        itemCount: videoSecond.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.amber,
            ),
            height: 75,
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Second: ${videoSecond[index].second}'),
                /* Text('detectedClass ${DummyData.dummyData[index][0]['detectedClass']}') */
              ],
            ),
          );
        }
        ),
      ); */