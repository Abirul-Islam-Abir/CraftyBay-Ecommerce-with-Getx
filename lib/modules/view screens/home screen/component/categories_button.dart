import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/controller/home_screen_controller.dart';
import 'package:crafty_bay_ecommerce/modules/widgets/category_button_shimmer.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../utils/export.dart';

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
