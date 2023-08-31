class PhotoObjectModel {
  int previewHeight;
  int previewWidth;
  String detectedClass;
  double x;
  double y;
  double w;
  double h;

  PhotoObjectModel()
      : previewHeight = 150,
        previewWidth = 250,
        detectedClass = "Person",
        x = 0.1,
        y = 0.3,
        w = 0.3,
        h = 0.2;
}