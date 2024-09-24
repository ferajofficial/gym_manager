import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitleText({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Text(subTitle,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500,
                color: Colors.grey)),
      ],
    );
  }
}
