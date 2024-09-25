import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_manager/features/settings/widgets/base_settings.dart';
import 'package:gym_manager/features/settings/widgets/last_date.dart';
import 'package:gym_manager/features/settings/widgets/users_settings.dart';
import 'package:velocity_x/velocity_x.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [LastDate()],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const UsersSettings(),
          10.heightBox,
          const Divider(
            color: Colors.amber,
          ),
          10.heightBox,
          const BaseSettings(),
        ],
      ).p12(),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadowColor: Colors.amber,
            elevation: 10),
        child: Text(
          'Sign out',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ).h(50).w(350),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
