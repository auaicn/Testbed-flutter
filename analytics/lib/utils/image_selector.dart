import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future<File> selectImage() async {
    XFile xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(xfile.path);
  }
}
