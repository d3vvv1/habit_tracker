import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class ImagePickerManager {
  static Future<XFile?> pickImageFromGallery() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery); // Выбор изображения из галереи
      if (pickedFile != null) {
        return pickedFile;
      }
    } catch (err) {
      log('Ошибка при загрузке изображения: $err');
    }
    return null;
  }
}
