import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helpers/constants/app_strings.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_events.dart';

part 'permission_states.dart';

class PermissionBloc extends Bloc<PermissionEvents, PermissionStates> {
  PermissionBloc() : super(const PermissionStates()) {
    on<CheckCameraPermissionEvent>(onCheckCameraPermission);
    on<CheckGalleryPermissionEvent>(onCheckGalleryPermission);
  }

  onCheckCameraPermission(
      CheckCameraPermissionEvent event, Emitter<PermissionStates> emit) async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      emit(state.copyWith(status: PermissionState.granted));
      event.function();
    } else if (status.isDenied) {
      emit(state.copyWith(
          status: PermissionState.declined,
          alert: AppStrings.kCameraPermissionRecommended));
    } else if (status.isPermanentlyDenied) {
      emit(state.copyWith(status: PermissionState.permanentlyDeclined));
    }
  }

  onCheckGalleryPermission(
      CheckGalleryPermissionEvent event, Emitter<PermissionStates> emit) async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      emit(state.copyWith(status: PermissionState.granted));
      event.function();
    } else if (status.isDenied) {
      emit(state.copyWith(
          status: PermissionState.declined,
          alert: AppStrings.kStoragePermissionRecommended));
    } else if (status.isPermanentlyDenied) {
      emit(state.copyWith(status: PermissionState.permanentlyDeclined));
    }
  }
}
