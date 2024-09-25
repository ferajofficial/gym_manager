import 'package:flutter/material.dart';
import 'package:gym_manager/features/settings/widgets/settings_tiles.dart';
import 'package:velocity_x/velocity_x.dart';

class UsersSettings extends StatelessWidget {
  const UsersSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingsTiles(title: "Your Plans", icon: Icons.receipt_rounded),
        10.heightBox,
        const SettingsTiles(title: "Subscription Plans", icon: Icons.receipt_long_rounded),
      ],
    );
  }
}
