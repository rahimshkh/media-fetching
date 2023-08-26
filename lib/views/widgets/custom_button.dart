import 'package:flutter/material.dart';
import '../../helpers/constants/app_sizes.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final double width;
  final double height;
  final String label;

  const CustomButton({
    super.key,
    required this.function,
    required this.width,
    required this.height,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(AppSizes.kButtonRadius),
            border: Border.all(
              color: Theme.of(context).colorScheme.onError,
              width: AppSizes.kButtonBorderWidth,
            )),
        height: height * AppSizes.kButtonHeight,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          vertical: height * AppSizes.kButtonVerticalPadding,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: AppSizes.kButtonFontSize,
          ),
        ),
      ),
    );
  }
}
