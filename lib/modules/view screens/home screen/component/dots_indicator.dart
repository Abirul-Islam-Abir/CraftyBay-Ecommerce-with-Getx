import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/controller/home_screen_controller.dart';
import 'package:crafty_bay_ecommerce/utils/export.dart';

import '../../../../model/products model/list_product_slider_model.dart';
import '../../../../theme/app_colors.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget(
    this.products, {
    super.key,
  });

  final List<ListProductSliderModel> products;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          products.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
                onTap: () {
                  controller.carouselSelectedIndex(index);
                },
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: index == controller.carouselCurrentIndex
                          ? AppColor.kRedColor
                          : AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.circular(15)),
                )),
          ),
        ),
      );
    });
  }
}
