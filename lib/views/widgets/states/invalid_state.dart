import 'package:flutter/material.dart';
import '../../../helpers/constants/app_sizes.dart';
import '../../../helpers/constants/app_strings.dart';

class InvalidState extends StatelessWidget {
  const InvalidState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.kInvalidState,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: AppSizes.kAlertFontSize,
        ),
      ),
    );
  }
}
