import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTiles extends StatelessWidget {
  final String title;
  final IconData icon;
  const SettingsTiles({
    super.key, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      leading:  CircleAvatar(
          backgroundColor: Colors.amber, child: Icon(icon, color: Colors.black)),
      title: Text(
        title,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      tileColor: Colors.grey[800],
      onTap: () {
        // Add functionality for Help & Support
      },
    );
  }
}
