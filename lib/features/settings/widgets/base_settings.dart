import 'package:flutter/material.dart';
import 'package:gym_manager/features/settings/widgets/settings_tiles.dart';
import 'package:velocity_x/velocity_x.dart';

class BaseSettings extends StatelessWidget {
  const BaseSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingsTiles(
          title: 'Help & Support',
          icon: Icons.help_outline,
        ),
        10.heightBox,
        const SettingsTiles(title: "Terms & Conditions", icon: Icons.description_outlined)
      ],
    );
  }
}
