import 'dart:io';

import 'package:flutter/cupertino.dart';

class ImageViewer extends StatelessWidget {
  final File file;

  const ImageViewer({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Image.file(file,);
  }
}
