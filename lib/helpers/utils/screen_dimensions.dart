import 'package:flutter/cupertino.dart';

class ScreenDimension {
  static double getWidth(BuildContext context) {
    return (MediaQuery.sizeOf(context).width);
  }

  static double getHeight(BuildContext context) {
    return (MediaQuery.sizeOf(context).height);
  }
}
