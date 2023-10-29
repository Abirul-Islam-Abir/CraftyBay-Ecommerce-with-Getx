import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/theme/app_colors.dart';
import '../../../data/utils/app_size.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText( this.text,{
    super.key,

    this.fontWeight = FontWeight.normal,
    this.color = AppColor.kTextColor,
    this.alignment = Alignment.topLeft,
  });

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: GoogleFonts.cormorant(
            fontSize: kTextSize,
            color: color,
            fontWeight: fontWeight,
            fontStyle: FontStyle.italic),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
