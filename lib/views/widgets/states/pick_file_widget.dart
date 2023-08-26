import 'package:flutter/cupertino.dart';
import '../../../helpers/constants/app_dimensions.dart';
import '../../../helpers/constants/app_strings.dart';
import '../custom_button.dart';

import '../../../helpers/utils/screen_dimensions.dart';

class PickFileWidget extends StatelessWidget {
  final double width;
  final double height;
  final Function pickFromGalleryFunc;
  final Function pickFromCameraFunc;

  const PickFileWidget({
    super.key,
    required this.height,
    required this.width,
    required this.pickFromCameraFunc,
    required this.pickFromGalleryFunc,
  });

  @override
  Widget build(BuildContext context) {
    final double heightCurrent = ScreenDimension.getHeight(context);
    return ListView(
      padding: EdgeInsets.symmetric(
          vertical: height * AppDimensions.kAppVerticalPadding,
          horizontal: width * AppDimensions.kAppHorizontalPadding),
      children: [
        CustomButton(
          function: () => pickFromGalleryFunc(),
          width:heightCurrent,
          height: heightCurrent,
          label: AppStrings.kGalleryButton,
        ),
        CustomButton(
          function: () => pickFromCameraFunc(),
          width:heightCurrent,
          height: heightCurrent,
          label: AppStrings.kCameraButton,
        ),
      ],
    );
  }
}
