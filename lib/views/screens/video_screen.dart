import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/constants/app_strings.dart';
import '../../helpers/extensions/show_snack_bar.dart';

import '../../controllers/blocs/media_blocs/pick_video_bloc/pick_video_bloc.dart';
import '../../controllers/blocs/permission_bloc/permission_bloc.dart';
import '../../helpers/utils/alert_utils.dart';
import '../../helpers/utils/screen_dimensions.dart';
import '../widgets/custom_video_player.dart';
import '../widgets/drawer/drawer.dart';
import '../widgets/states/invalid_state.dart';
import '../widgets/states/pick_file_widget.dart';
import '../widgets/states/picked_media_widget.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = ScreenDimension.getWidth(context);
    final double height = ScreenDimension.getHeight(context);
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.kVideoScreenLabel),),
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
        child: BlocBuilder<PickVideoBloc, PickVideoState>(
          builder: (context, state) {
            if (state.status == PickVideoStatus.initial) {
              return PickFileWidget(
                  height: height,
                  width: width,
                  pickFromCameraFunc: () {
                    context
                        .read<PermissionBloc>()
                        .add(CheckCameraPermissionEvent(function: () {
                      context.read<PickVideoBloc>().add(PickVideoFromCamera());
                    }));
                  },
                  pickFromGalleryFunc: () {
                    context
                        .read<PermissionBloc>()
                        .add(CheckGalleryPermissionEvent(function: () {
                      context.read<PickVideoBloc>().add(PickVideoFromGallery());
                    }));
                  });
            } else if (state.status == PickVideoStatus.picked) {
              return PickedMediaWidget(
                  removeFunction: () => context.read<PickVideoBloc>().add(RemoveVideo()),
                  mediaWidget: CustomVideoPlayer(file: state.file!),
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
