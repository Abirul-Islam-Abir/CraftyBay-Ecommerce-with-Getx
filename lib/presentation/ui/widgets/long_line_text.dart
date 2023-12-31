import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/theme/app_colors.dart';
import '../../../data/utils/app_size.dart';

class LongLineText extends StatelessWidget {
  const LongLineText({
    super.key,
    required this.onTap,
    required this.text,
    required this.btnTxt,
  });

  final Function() onTap;
  final String text;
  final String btnTxt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: GoogleFonts.fjallaOne(
                  color: AppColor.kTextColor, fontSize: kTextSize),
            ),
            TextSpan(
              text: btnTxt,
              style: GoogleFonts.fjallaOne(
                  color: AppColor.kPrimaryColor,
                  fontSize: kDefaultSize,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}
