part of 'pick_audio_bloc.dart';

enum PickAudioStatus { initial, picked, invalid, removed }

class PickAudioState extends Equatable {
  final PickAudioStatus status;
  final File? file;
  final String alert;

  const PickAudioState(
      {this.status = PickAudioStatus.initial, this.alert = "", this.file});

  PickAudioState copyWith({PickAudioStatus? status, File? file, String? alert}) {
    return PickAudioState(
        status: status ?? this.status,
        alert: alert ?? this.alert,
        file: file ?? this.file);
  }

  @override
  List<Object?> get props => [status, file, alert];
}
