// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/utils/map.dart';
import 'package:flutter_video/view_model/object_detection_view_model.dart';

import '../../../model/object_detectio_model.dart';

class VideoContainer extends StatelessWidget {               //VideoButtonContainer yap
  double? height; 
VideoContainer({ Key? key,this.height }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Consumer(
      builder: (context, ref, child) {
        List<VideoModel> videoSecond = ref.watch(videoProvider.notifier).state;
        return Container(
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
      );
      },
    );
  }
}