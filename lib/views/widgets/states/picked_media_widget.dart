import 'package:flutter/material.dart';
import '../../../helpers/constants/app_dimensions.dart';
import '../../../helpers/constants/app_sizes.dart';
import '../../../helpers/constants/app_strings.dart';
import '../custom_button.dart';

class PickedMediaWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget mediaWidget;
  final Function removeFunction;

  const PickedMediaWidget({
    super.key,
    required this.removeFunction,
    required this.mediaWidget,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: height * AppDimensions.kAppVerticalPadding,
        horizontal: width * AppDimensions.kAppHorizontalPadding,
      ),
      children: [
        Container(
            height: height * AppSizes.kMediaWidgetHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.onError),
              borderRadius: BorderRadius.circular(AppSizes.kMediaWidgetBorderRadius),
              color: Theme.of(context)
                  .colorScheme
                  .surface
                  .withOpacity(AppSizes.kMediaWidgetColorOpacity),
            ),
            child: mediaWidget),
        CustomButton(
          function: () => removeFunction(),
          width: width,
          height: height,
          label: AppStrings.kRemoveButton,
        )
      ],
    );
  }
}
