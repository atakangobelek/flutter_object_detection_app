import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../model/object_detectio_model.dart';



class BoundingBox extends StatelessWidget {
  final List<Object> results;
  final double screenH;
  final double screenW;

  const BoundingBox(
      this.results, this.screenH, this.screenW,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _renderBox() {
      return results.map((re) {
        var _x = re.rect.x;
        var _w = re.rect.w;
        var _y = re.rect.y;
        var _h = re.rect.h;
        var previewW = re.previewWidth;
        var previewH = re.previewHeight;
        var scaleW, scaleH, x, y, w, h;
        final String detected = re.detectedClass;

        if (screenH / screenW > previewH / previewW) {
          scaleW = screenH / previewH * previewW;
          scaleH = screenH;
          var difW = (scaleW - screenW) / scaleW;
          x = (_x - difW / 2) * scaleW;
          w = _w * scaleW;
          if (_x < difW / 2) w -= (difW / 2 - _x) * scaleW;
          y = _y * scaleH;
          h = _h * scaleH;
        } else {
          scaleH = screenW / previewW * previewH;
          scaleW = screenW;
          var difH = (scaleH - screenH) / scaleH;
          x = _x * scaleW;
          w = _w * scaleW;
          y = (_y - difH / 2) * scaleH;
          h = _h * scaleH;
          if (_y < difH / 2) h -= (difH / 2 - _y) * scaleH;
        }

        return Positioned(
          left: math.max(0, x),
          top: math.max(0, y),
          width: w,
          height: h,
          child: Container(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 77, 255, 0),
                width: 3.0,
              ),
            ),
            child: Text(
              "$detected",
              style: const TextStyle(
                color: Color.fromARGB(255, 77, 255, 0),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList();
    }

    return Stack(
      children: _renderBox(),
    );
  }
}
