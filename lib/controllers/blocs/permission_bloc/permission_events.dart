part of 'permission_bloc.dart';

abstract class PermissionEvents {}

class CheckGalleryPermissionEvent extends PermissionEvents {
  final Function function;

  CheckGalleryPermissionEvent({required this.function});
}

class CheckCameraPermissionEvent extends PermissionEvents {
  final Function function;

  CheckCameraPermissionEvent({required this.function});
}
