import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../data/utils/export.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighLightColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kTextSize, horizontal: kTooSmallSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor.shade50,
                  borderRadius: BorderRadius.circular(kSmallSize)),
            ),
            const SizedBox(height: kTooSmallSize),
            const Text('=============\nDiscount: ======',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.kTextColor,
                    fontSize: kSmallSize)),
            const SizedBox(height: kTooSmallSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(' \$===',
                    style: TextStyle(
                        fontSize: kSmallSize,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kPrimaryColor)),
                const SizedBox(width: 5),
                const Icon(
                  Icons.star,
                  color: AppColor.kOrangeColor,
                  size: kTextSize,
                ),
                const Text('======',
                    style: TextStyle(
                        fontSize: kSmallSize, fontWeight: FontWeight.bold)),
                const SizedBox(width: 5),
                Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColor.kPrimaryColor.shade200),
                    child: const Icon(EvaIcons.alertCircle,
                        color: AppColor.kWhiteColor, size: kTextSize)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
