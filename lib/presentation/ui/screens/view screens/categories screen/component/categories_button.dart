import '../../../../../../data/utils/export.dart';
import '../../../../widgets/category_button_shimmer.dart';

class CategoriesButton extends StatelessWidget {
  const CategoriesButton({
    super.key,
    required this.categoryName,
    required this.onTap,
  });

  final String categoryName;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        builder: (controller) => controller.isLoading
            ? CategoryButtonShimmer(categoryName: categoryName)
            : Container(
                width: Get.width,
                height: 50,
                padding: const EdgeInsets.symmetric(
                    vertical: kTooSmallSize, horizontal: kTextSize),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      categoryName,
                      style: titleMedium(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Text(
                        'See All',
                        style: titleTooSmall(color: AppColor.kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
