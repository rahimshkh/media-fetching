import 'package:flutter/material.dart';
import 'package:mediafetching/helpers/constants/app_icons.dart';

class DrawerTile extends StatelessWidget {
  final bool isActive;
  final String label;
  final IconData icon;
  final Function function;

  const DrawerTile(
      {super.key,
      required this.label,
      this.isActive = false,
      required this.icon,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        function();
      },
      child: Row(
        children: [
          if (isActive)
            Icon(
              AppIcons.kActiveTileIcon,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 45,
            ),
          Icon(icon,
              color: isActive
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.onPrimary),
          const SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: TextStyle(
                color: isActive
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
