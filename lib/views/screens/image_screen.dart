import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/blocs/media_blocs/pick_image_bloc/pick_image_bloc.dart';
import '../../controllers/blocs/permission_bloc/permission_bloc.dart';
import '../../helpers/constants/app_strings.dart';
import '../../helpers/extensions/show_snack_bar.dart';
import '../../helpers/utils/alert_utils.dart';
import '../../helpers/utils/screen_dimensions.dart';
import '../widgets/image_viewer.dart';
import '../widgets/states/invalid_state.dart';
import '../widgets/states/pick_file_widget.dart';
import '../widgets/states/picked_media_widget.dart';

import '../widgets/drawer/drawer.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = ScreenDimension.getWidth(context);
    final double height = ScreenDimension.getHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.kImageScreenLabel),
      ),
      drawer: const CustomDrawer(),
      body: BlocListener<PermissionBloc, PermissionStates>(
        listener: (context, state) {
          if (state.status == PermissionState.granted) {
          } else if (state.status == PermissionState.declined) {
            state.alert.showSnackBar(context);
          } else if (state.status == PermissionState.permanentlyDeclined) {
            AlertUtils.dialogNotify(context: context, onTapYes: () {});
          }
        },
        child: BlocBuilder<PickImageBloc, PickImageState>(
          builder: (context, state) {
            if (state.status == PickImageStatus.initial) {
              return PickFileWidget(
                  height: height,
                  width: width,
                  pickFromCameraFunc: () {
                    context
                        .read<PermissionBloc>()
                        .add(CheckCameraPermissionEvent(function: () {
                      context.read<PickImageBloc>().add(PickImageFromCamera());
                    }));
                  },
                  pickFromGalleryFunc: () {
                    context
                        .read<PermissionBloc>()
                        .add(CheckGalleryPermissionEvent(function: () {
                      context.read<PickImageBloc>().add(PickImageFromGallery());
                    }));
                  });
            } else if (state.status == PickImageStatus.picked) {
              return PickedMediaWidget(
                  removeFunction: () => context.read<PickImageBloc>().add(RemoveImage()),
                  mediaWidget: ImageViewer(file: state.file!),
                  height: height,
                  width: width);
            } else {
              return const InvalidState();
            }
          },
        ),
      ),
    );
  }
}
