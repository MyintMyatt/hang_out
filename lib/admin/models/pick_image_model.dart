import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class PickImageModel extends ChangeNotifier {
  XFile? _image;

  XFile? get image => _image;

  void setPickedImage(XFile file) {
    _image = file;
    notifyListeners();
  }
}
