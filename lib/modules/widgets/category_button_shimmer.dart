import 'package:shimmer/shimmer.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import '../../utils/export.dart';

class CategoryButtonShimmer extends StatelessWidget {
  const CategoryButtonShimmer({
    super.key,
    required this.categoryName,
  });
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: Get.width,
      child: Shimmer.fromColors(
        baseColor: AppColor.shimmerBaseColor,
        highlightColor: AppColor.shimmerHighLightColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kTextSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: titleMedium(fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: titleTooSmall(color: AppColor.kPrimaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
