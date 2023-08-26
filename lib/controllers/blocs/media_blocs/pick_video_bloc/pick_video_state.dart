part of 'pick_video_bloc.dart';

enum PickVideoStatus { initial, picked, invalid, removed }

class PickVideoState extends Equatable {
  final PickVideoStatus status;
  final File? file;
  final String alert;

  const PickVideoState(
      {this.status = PickVideoStatus.initial, this.alert = "", this.file});

  PickVideoState copyWith({PickVideoStatus? status, File? file, String? alert}) {
    return PickVideoState(
        status: status ?? this.status,
        alert: alert ?? this.alert,
        file: file ?? this.file);
  }

  @override
  List<Object?> get props => [status, file, alert];
}
