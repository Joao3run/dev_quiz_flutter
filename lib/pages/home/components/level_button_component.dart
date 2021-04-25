import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dev_quiz_flutter/core/app_colors.dart';
import 'package:dev_quiz_flutter/core/app_text_styles.dart';

class LevelButtonComponent extends StatelessWidget {
  final String label;
  final Color color;
  final Color borderColor;
  final Color fontColor;

  const LevelButtonComponent({
    Key? key,
    required this.label,
    required this.color,
    required this.borderColor,
    required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
