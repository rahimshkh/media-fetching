import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helpers/utils/media_picker.dart';

part 'pick_audio_events.dart';

part 'pick_audio_states.dart';

class PickAudioBloc extends Bloc<PickAudioEvents, PickAudioState> {
  PickAudioBloc() : super(const PickAudioState()) {
    on<PickAudioFromGallery>(onPickAudioFromGalleryEvent);
    on<RemoveAudio>(onRemoveAudioEvent);
  }

  onPickAudioFromGalleryEvent(
      PickAudioFromGallery event, Emitter<PickAudioState> emit) async {
    final file = await MediaPicker.pickAudioFromGallery();
    emit(state.copyWith(file: file, status: PickAudioStatus.picked));
  }

  onRemoveAudioEvent(RemoveAudio event, Emitter<PickAudioState> emit) {
    File? file;
    emit(state.copyWith(file: file, status: PickAudioStatus.initial));
  }
}
