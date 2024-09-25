import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LastDate extends StatelessWidget {
  const LastDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Last Sign in: ',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              fontFamily: GoogleFonts.padauk().fontFamily,
              fontWeight: FontWeight.w500,
              color: Colors.amber),
        ),
        Text(
          '___________',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              fontFamily: GoogleFonts.palanquinDark().fontFamily,
              fontWeight: FontWeight.w400,
              color: Colors.amber),
        ),
      ],
    );
  }
}
