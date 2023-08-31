
import 'dart:convert';

List<VideoModel> videoModelFromMap(String str) => List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromMap(x)));

String videoModelToMap(List<VideoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class VideoModel {
    final int second;
    final List<Object> object;

    VideoModel({
        required this.second,
        required this.object,
    });

    factory VideoModel.fromMap(Map<String, dynamic> json) => VideoModel(
        second: json["second"],
        object: List<Object>.from(json["object"].map((x) => Object.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "second": second,
        "object": List<dynamic>.from(object.map((x) => x.toMap())),
    };
}

class Object {
    final int previewHeight;
    final int previewWidth;
    final String detectedClass;
    final Rect rect;

    Object({
        required this.previewHeight,
        required this.previewWidth,
        required this.detectedClass,
        required this.rect,
    });

    factory Object.fromMap(Map<String, dynamic> json) => Object(
        previewHeight: json["preview_height"],
        previewWidth: json["preview_width"],
        detectedClass: json["detectedClass"],
        rect: Rect.fromMap(json["rect"]),
    );

    Map<String, dynamic> toMap() => {
        "preview_height": previewHeight,
        "preview_width": previewWidth,
        "detectedClass": detectedClass,
        "rect": rect.toMap(),
    };
}

class Rect {
    final double x;
    final double y;
    final double w;
    final double h;

    Rect({
        required this.x,
        required this.y,
        required this.w,
        required this.h,
    });

    factory Rect.fromMap(Map<String, dynamic> json) => Rect(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
        w: json["w"].toDouble(),
        h: json["h"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "x": x,
        "y": y,
        "w": w,
        "h": h,
    };
}
