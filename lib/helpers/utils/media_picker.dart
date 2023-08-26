import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class MediaPicker {
  static ImagePicker picker = ImagePicker();

  //-------------------------------------Image Functions
  static pickImageFromGallery() async {
    final image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      final File file = File(image.path);
      return file;
    }
  }

  static pickImageFromCamera() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final File file = File(image.path);
      return file;
    }
  }

  //-------------------------------------Video Functions
  static pickVideoFromGallery() async {
    final image = await picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (image != null) {
      final File file = File(image.path);
      return file;
    }
  }

  static pickVideoFromCamera() async {
    final image = await picker.pickVideo(source: ImageSource.camera);
    if (image != null) {
      final File file = File(image.path);
      return file;
    }
  }

  //------------------------------------Audio Functions
  static pickAudioFromGallery() async {
    final filePicker = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    );
    if (filePicker != null) {
      return File(filePicker.files.first.path!);
    }
  }
}
