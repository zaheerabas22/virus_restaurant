// ignore_for_file: prefer_final_fields

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  var imageOne = Rxn<File>();
  var imageTwo = Rxn<File>();
  var imageThree = Rxn<File>();
  var imageFour = Rxn<File>();
  var logo = Rxn<File>();
  var cover = Rxn<File>();

  RxList<String> _images = <String>[].obs;
  List<String> get images => _images;
  set setImages(String newValue) {
    _images.add(newValue);
  }

  RxString _imageOneUrl = ''.obs;
  RxString _imageTwoUrl = ''.obs;
  RxString _imageThreeUrl = ''.obs;
  RxString _imageFourUrl = ''.obs;
  RxString _logoUrl = ''.obs;
  RxString _coverUrl = ''.obs;

  String get imageOneUrl => _imageOneUrl.value;
  String get imageTwoUrl => _imageTwoUrl.value;
  String get imageThreeUrl => _imageThreeUrl.value;
  String get imageFourUrl => _imageFourUrl.value;
  String get logoUrl => _logoUrl.value;
  String get coverUrl => _coverUrl.value;

  set setLogoUrl(String newValue) {
    _logoUrl.value = newValue;
  }

  set setCoverUrl(String newValue) {
    _coverUrl.value = newValue;
  }

  set setImageOneUrl(String newValue) {
    _imageOneUrl.value = newValue;
    images.add(newValue);
  }

  set setImageTwoUrl(String newValue) {
    _imageTwoUrl.value = newValue;
    images.add(newValue);
  }

  set setImageThreeUrl(String newValue) {
    _imageThreeUrl.value = newValue;
    images.add(newValue);
  }

  set setImageFourUrl(String newValue) {
    _imageFourUrl.value = newValue;
    images.add(newValue);
  }

  Future<void> pickImage(String type) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      if (type == 'one') {
        imageOne.value = File(pickedImage.path);
        await uploadImageToFirebase('one');
        return;
      } else if (type == 'two') {
        imageTwo.value = File(pickedImage.path);
        await uploadImageToFirebase('two');
        return;
      } else if (type == 'three') {
        imageThree.value = File(pickedImage.path);
        await uploadImageToFirebase('three');
        return;
      } else if (type == 'four') {
        imageFour.value = File(pickedImage.path);
        await uploadImageToFirebase('four');
        return;
      } else if (type == 'logo') {
        logo.value = File(pickedImage.path);
        await uploadImageToFirebase('logo');
        return;
      } else if (type == 'cover') {
        cover.value = File(pickedImage.path);
        await uploadImageToFirebase('cover');
        return;
      }
    }
  }

  Future<void> uploadImageToFirebase(String type) async {
    if (type == 'one') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${imageOne.value!.path.split('/').last}';
        TaskSnapshot snapchot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(imageOne.value!);

        String downloadUrl = await snapchot.ref.getDownloadURL();
        setImageOneUrl = downloadUrl;
        print('Image One Url is: $downloadUrl');
      } catch (e) {
        debugPrint('Error uploading image: $e');
      }
    } else if (type == 'two') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${imageTwo.value!.path.split('/').last}';
        TaskSnapshot snapchot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(imageTwo.value!);

        setImageTwoUrl = await snapchot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'three') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${imageThree.value!.path.split('/').last}';
        TaskSnapshot snapchot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(imageThree.value!);

        setImageThreeUrl = await snapchot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'four') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${imageFour.value!.path.split('/').last}';
        TaskSnapshot snapchot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(imageFour.value!);

        setImageFourUrl = await snapchot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'logo') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${logo.value!.path.split('/').last}';
        TaskSnapshot snapchot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(logo.value!);

        setLogoUrl = await snapchot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (type == 'cover') {
      try {
        String filename =
            'images/${DateTime.now().millisecondsSinceEpoch}_${cover.value!.path.split('/').last}';
        TaskSnapshot snapchot = await FirebaseStorage.instance
            .ref()
            .child(filename)
            .putFile(cover.value!);

        setCoverUrl = await snapchot.ref.getDownloadURL();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
