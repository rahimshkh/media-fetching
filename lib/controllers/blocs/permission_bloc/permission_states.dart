part of 'permission_bloc.dart';

enum PermissionState { granted, declined, permanentlyDeclined }

class PermissionStates extends Equatable {
  final String alert;
  final PermissionState status;

  const PermissionStates({this.status = PermissionState.declined, this.alert = ''});

  PermissionStates copyWith({PermissionState? status, String? alert}) {
    return PermissionStates(
      status: status ?? this.status,
      alert: alert ?? this.alert,
    );
  }

  @override
  List<Object> get props => [status];
}
