import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controllers/cubits/drawer_cubit.dart';
import '../../../helpers/constants/app_dimensions.dart';
import '../../../helpers/constants/app_icons.dart';
import '../../../helpers/constants/app_keys.dart';
import '../../../helpers/constants/app_sizes.dart';
import '../../../helpers/constants/app_strings.dart';
import '../../../helpers/utils/screen_dimensions.dart';
import 'drawer_tile.dart';

import '../../screens/audio_screen.dart';
import '../../screens/image_screen.dart';
import '../../screens/video_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = ScreenDimension.getWidth(context);
    double height = ScreenDimension.getHeight(context);
    return SafeArea(
      child: Drawer(
        width: width * AppSizes.kDrawerWidth,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: BlocBuilder<DrawerCubit, int>(builder: (context, state){
          return ListView(
            padding: EdgeInsets.symmetric(
                vertical: height * AppDimensions.kDrawerVerticalPadding,
                horizontal: width * AppDimensions.kDrawerHorizontalPadding),
            children: [
              Text(
                AppStrings.kDrawerHeading,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: AppSizes.kDrawerHeadingFontSize,
                ),
              ),
              SizedBox(
                height: height * AppDimensions.kDrawerWidgetsSpace,
              ),
              Divider(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              SizedBox(
                height: height * AppDimensions.kDrawerWidgetsSpace,
              ),
              SizedBox(
                height: height * AppDimensions.kDrawerWidgetsSpace,
              ),
              DrawerTile(
                label: AppStrings.kImageScreenLabel,
                icon: AppIcons.kImageIcon,
                function: () {
                  context.read<DrawerCubit>().navigateTo(0);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const ImageScreen()),
                      ModalRoute.withName(AppKeys.kImageScreenRoute));
                },
                isActive: state == 0,
              ),
              SizedBox(
                height: height * AppDimensions.kDrawerWidgetsSpace,
              ),
              DrawerTile(
                  label: AppStrings.kVideoScreenLabel,
                  icon: AppIcons.kVideoIcon,
                  isActive: state == 1,
                  function: () {
                    context.read<DrawerCubit>().navigateTo(1);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const VideoScreen()),
                        ModalRoute.withName(AppKeys.kVideoScreenRoute));
                  }),
              SizedBox(
                height: height * AppDimensions.kDrawerWidgetsSpace,
              ),
              DrawerTile(
                  label: AppStrings.kAudioScreenLabel,
                  icon: AppIcons.kAudioIcon,
                  isActive: state == 2,
                  function: () {
                    context.read<DrawerCubit>().navigateTo(2);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const AudioScreen()),
                        ModalRoute.withName(AppKeys.kAudioScreenRoute));
                  }),
            ],
          );
        },),
      ),
    );
  }
}
