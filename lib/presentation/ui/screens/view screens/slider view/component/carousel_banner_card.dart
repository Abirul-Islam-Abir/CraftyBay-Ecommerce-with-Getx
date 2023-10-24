import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/theme/app_colors.dart';
import '../../../../../../data/theme/app_text_style.dart';
import '../../../../../../data/utils/app_size.dart';
import '../../../../../../data/utils/image_assets.dart';

class CarouselBannerCard extends StatelessWidget {
  const CarouselBannerCard({
    super.key,
    required this.img,
    required this.title,
    required this.onPressed,
  });

  final String img, title;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.kPrimaryColor,
            borderRadius: BorderRadius.circular(kDefaultSize)),
        width: Get.width,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: img,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.fitHeight),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.network(ImageAsset.noImageNet),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              top: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: titleSmall(
                          color: AppColor.kBlackColor,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.kWhiteColor,
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: AppColor.kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
