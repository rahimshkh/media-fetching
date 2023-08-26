import 'package:flutter/material.dart';
import '../constants/app_keys.dart';
import '../../views/screens/video_screen.dart';
import '../../views/screens/audio_screen.dart';
import '../../views/screens/image_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  AppKeys.kHomeScreenRoute: (context) => ImageScreen(),
  AppKeys.kVideoScreenRoute: (context) => VideoScreen(),
  AppKeys.kAudioScreenRoute: (context) => AudioScreen(),
  AppKeys.kImageScreenRoute: (context) => ImageScreen(),
};
