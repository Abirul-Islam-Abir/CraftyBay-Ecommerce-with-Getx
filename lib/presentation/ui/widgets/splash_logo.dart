import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/utils/image_assets.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(ImageAsset.primaryLogoSvg, fit: BoxFit.cover),
    );
  }
}
