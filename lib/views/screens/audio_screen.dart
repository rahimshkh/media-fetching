import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/constants/app_dimensions.dart';
import '../widgets/custom_button.dart';
import '../../helpers/constants/app_strings.dart';
import '../../helpers/extensions/show_snack_bar.dart';
import '../widgets/drawer/drawer.dart';

import '../../controllers/blocs/media_blocs/pick_audio_bloc/pick_audio_bloc.dart';
import '../../controllers/blocs/permission_bloc/permission_bloc.dart';
import '../../helpers/utils/alert_utils.dart';
import '../../helpers/utils/screen_dimensions.dart';
import '../widgets/custom_audio_player.dart';
import '../widgets/states/invalid_state.dart';
import '../widgets/states/picked_media_widget.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = ScreenDimension.getWidth(context);
    final double height = ScreenDimension.getHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.kAudioScreenLabel),
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
        child: BlocBuilder<PickAudioBloc, PickAudioState>(
          builder: (context, state) {
            if (state.status == PickAudioStatus.initial) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * AppDimensions.kAppHorizontalPadding),
                  child: CustomButton(
                    width: width,
                    height: height,
                    label: AppStrings.kGalleryButton,
                    function: () {
                      context
                          .read<PermissionBloc>()
                          .add(CheckGalleryPermissionEvent(function: () {
                        context.read<PickAudioBloc>().add(PickAudioFromGallery());
                      }));
                    },
                  ),
                ),
              );
            } else if (state.status == PickAudioStatus.picked) {
              return PickedMediaWidget(
                  removeFunction: () => context.read<PickAudioBloc>().add(RemoveAudio()),
                  mediaWidget: CustomAudioPlayer(
                    file: state.file!,
                    height: height,
                    width: width,
                  ),
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
