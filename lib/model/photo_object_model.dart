class PhotoObjectModel {
  int previewHeight;
  int previewWidth;
  String detectedClass;
  double confidenceInClass;
  double x;
  double y;
  double w;
  double h;

  PhotoObjectModel()
      : previewHeight = 600,
        previewWidth = 700,
        detectedClass = "Person",
        confidenceInClass = 0.85,
        x = 0.1,
        y = 0.3,
        w = 0.3,
        h = 0.2;
}