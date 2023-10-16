import '../../../data/utils/export.dart';

class CategoriesCardShimmer extends StatelessWidget {
  const CategoriesCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighLightColor,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: Get.width / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kTooSmallSize),
                color: AppColor.kPrimaryColor.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kSmallSize),
                child: Image.asset(
                  ImageAsset.shoes,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            const Text(
              '',
              style: TextStyle(
                  color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
