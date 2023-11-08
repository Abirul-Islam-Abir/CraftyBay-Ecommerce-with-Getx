import 'package:cached_network_image/cached_network_image.dart';
 import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/theme/app_colors.dart';
import '../../../../../../data/utils/app_size.dart';
import '../../../../../../data/utils/image_assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.ratings,
    required this.isFav,
    required this.isFavPress,
    required this.img,
    required this.discount,
    required this.onTap,
  });

  final String name, img;
  final String price;
  final double ratings;
  final bool isFav;
  final GestureTapCallback isFavPress, onTap;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kTextSize, horizontal: kTooSmallSize),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor.shade50,
                  borderRadius: BorderRadius.circular(kSmallSize)),
              child: CachedNetworkImage(
                imageUrl: img,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.fitWidth),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Image.network(ImageAsset.shoes),
              ),
            ),
            const SizedBox(height: kTooSmallSize),
            Text('$name\nDiscount: $discount%'.toUpperCase(),
                style:  Theme.of(context).textTheme.bodySmall?.copyWith(  fontWeight: FontWeight.bold,

                    fontSize: kSmallSize)),
            const SizedBox(height: kTooSmallSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(' \$$price',
                    style: const TextStyle(
                        fontSize: kSmallSize,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kPrimaryColor)),
                const SizedBox(width: 5),
                const Icon(
                  Icons.star,
                  color: AppColor.kOrangeColor,
                  size: kTextSize,
                ),
                Text('$ratings',
                    style: const TextStyle(
                        fontSize: kSmallSize, fontWeight: FontWeight.bold)),
                const SizedBox(width: 5),
                InkWell(
                    onTap: isFavPress,
                    child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColor.kPrimaryColor.shade200),
                        child: Icon(EvaIcons.heart,
                            color: isFav
                                ? AppColor.kGreyColor
                                : AppColor.kGreyColor,
                            size: kTextSize))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
