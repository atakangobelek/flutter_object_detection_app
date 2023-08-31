import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/object_detectio_model.dart';
import '../../../view_model/object_detection_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/object_detectio_model.dart';
import '../../../view_model/object_detection_view_model.dart';

 


class MobilVideoContainer extends StatelessWidget {
  //VideoButtonContainer yap
  double? height;
  MobilVideoContainer({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final videoSecond = ref.watch(objectProvider);
        return videoSecond.when(
            data: (data) {
              return Container(
          height: 250,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).colorScheme.surface,
                ),
                height: 5,
                width: 5,
                margin: const EdgeInsets.only(bottom: 4),
                child:
                    Center(child: Text('Second: ${data[index].second}')),
              );
            },
          ),
        );
            },
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'));
      },
    );
  }
}





