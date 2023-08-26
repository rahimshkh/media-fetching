part of 'pick_video_bloc.dart';

abstract class PickVideoEvents {}

class PickVideoFromGallery extends PickVideoEvents {}

class PickVideoFromCamera extends PickVideoEvents {}

class RemoveVideo extends PickVideoEvents {}
