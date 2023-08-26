part of 'pick_image_bloc.dart';

abstract class PickImageEvents {}

class PickImageFromGallery extends PickImageEvents {}

class PickImageFromCamera extends PickImageEvents {}

class RemoveImage extends PickImageEvents {}
