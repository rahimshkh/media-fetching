import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helpers/utils/media_picker.dart';

part 'pick_image_events.dart';

part 'pick_image_state.dart';

class PickImageBloc extends Bloc<PickImageEvents, PickImageState> {
  PickImageBloc() : super(const PickImageState()) {
    on<PickImageFromGallery>(onPickImageFromGalleryEvent);
    on<PickImageFromCamera>(onPickImageFromCameraEvent);
    on<RemoveImage>(onRemoveImageEvent);
  }

  onPickImageFromGalleryEvent(
      PickImageFromGallery event, Emitter<PickImageState> emit) async {
    File file = await MediaPicker.pickImageFromGallery();
    emit(state.copyWith(file: file, status: PickImageStatus.picked));
  }

  onPickImageFromCameraEvent(
      PickImageFromCamera event, Emitter<PickImageState> emit) async {
    File file = await MediaPicker.pickImageFromCamera();
    emit(state.copyWith(file: file, status: PickImageStatus.picked));
  }

  onRemoveImageEvent(RemoveImage event, Emitter<PickImageState> emit) {
    File? file;
    emit(state.copyWith(file: file, status: PickImageStatus.initial));
  }
}
