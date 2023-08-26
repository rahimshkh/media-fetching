part of 'pick_image_bloc.dart';

enum PickImageStatus { initial, picked, invalid, removed }

class PickImageState extends Equatable {
  final PickImageStatus status;
  final File? file;
  final String alert;

  const PickImageState(
      {this.status = PickImageStatus.initial, this.alert = "", this.file});

  PickImageState copyWith({PickImageStatus? status, File? file, String? alert}) {
    return PickImageState(
        status: status ?? this.status,
        alert: alert ?? this.alert,
        file: file ?? this.file);
  }

  @override
  List<Object?> get props => [status, file, alert];
}
