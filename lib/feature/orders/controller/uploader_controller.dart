import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var imageOne = Rxn<File>();
  var imageTwo = Rxn<File>();
  var imageThree = Rxn<File>();
  var imageFour = Rxn<File>();

  RxList<String> _images = <String>[].obs;
  List<String> get images => _images;
  set setImages(String newValue) {
    _images.add(newValue);
  }

  Future<void> pickImage(String type) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      if (type == 'one') {
        imageOne.value = File(pickedImage.path);
        print(imageOne.value);
        return;
      } else if (type == 'two') {
        imageTwo.value = File(pickedImage.path);
        return;
      } else if (type == 'three') {
        imageThree.value = File(pickedImage.path);
        return;
      } else if (type == 'four') {
        imageFour.value = File(pickedImage.path);
        return;
      }
    }
  }
}
