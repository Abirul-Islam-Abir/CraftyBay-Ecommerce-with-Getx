import 'package:crafty_bay_ecommerce/utils/app_size.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CommonText extends StatelessWidget {
  const CommonText(
    this.text, {
    super.key,
    this.fontWeight,
    this.color = AppColor.kTextColor,
    this.onTap,
  });

  final String? text;
  final FontWeight? fontWeight;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kTextSize, vertical: 5),
        child: Text(
          text!,
          style: titleTooSmall(color: color, fontWeight: fontWeight),
          overflow: TextOverflow.fade,
          maxLines: 4,
        ),
      ),
    );
  }
}
