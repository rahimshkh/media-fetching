import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helpers/utils/media_picker.dart';

part 'pick_video_events.dart';

part 'pick_video_state.dart';

class PickVideoBloc extends Bloc<PickVideoEvents, PickVideoState> {
  PickVideoBloc() : super(const PickVideoState()) {
    on<PickVideoFromGallery>(onPickVideoFromGalleryEvent);
    on<PickVideoFromCamera>(onPickVideoFromCameraEvent);
    on<RemoveVideo>(onRemoveVideoEvent);
  }

  onPickVideoFromGalleryEvent(
      PickVideoFromGallery event, Emitter<PickVideoState> emit) async {
    File file = await MediaPicker.pickVideoFromGallery();
    emit(state.copyWith(file: file, status: PickVideoStatus.picked));
  }

  onPickVideoFromCameraEvent(
      PickVideoFromCamera event, Emitter<PickVideoState> emit) async {
    File file = await MediaPicker.pickVideoFromCamera();
    emit(state.copyWith(file: file, status: PickVideoStatus.picked));
  }

  onRemoveVideoEvent(RemoveVideo event, Emitter<PickVideoState> emit) {
    File? file;
    emit(state.copyWith(file: file, status: PickVideoStatus.initial));
  }
}
