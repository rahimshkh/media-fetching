import 'package:flutter_bloc/flutter_bloc.dart';

class AudioPlayerCubit extends Cubit<bool> {
  AudioPlayerCubit() : super(true);

  playPausePlayer() {
    emit(!state);
  }
}
