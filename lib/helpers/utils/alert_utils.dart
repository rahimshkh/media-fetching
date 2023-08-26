import 'package:flutter/material.dart';
import 'package:mediafetching/helpers/constants/app_strings.dart';
import 'package:permission_handler/permission_handler.dart';

class AlertUtils {
  static dialogNotify({
    required BuildContext context,
    required onTapYes,
  }) {
    return showDialog(
        context: context,
        builder: (
            context,
            ) {
          return AlertDialog(
            title: const Text(
              AppStrings.kPermissionPermanentlyDenied
            ),
            content: const Text(
              AppStrings.kPermissionAllowMessage,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  openAppSettings();
                  Navigator.pop(context);
                },
                child: const Text(
                  AppStrings.kOpenSettingButton,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  AppStrings.kOkButton,
                ),
              ),
            ],
          );
        });
  }
}
