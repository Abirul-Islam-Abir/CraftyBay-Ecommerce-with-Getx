import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../../utils/app_size.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key,
    required this.text,
    this.alignment = Alignment.topLeft,
  });

  final String text;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: GoogleFonts.lilitaOne(
          fontSize: kBigSize,
          fontStyle: FontStyle.italic,
          color: AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}
