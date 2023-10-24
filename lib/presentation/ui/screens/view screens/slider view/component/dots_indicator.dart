import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/slider%20view/controller/slider_controller.dart';

import '../../../../../../data/utils/export.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget(
    this.products, {
    super.key,
  });

  final List<ListProductSliderModel> products;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderImageController>(builder: (controller) {
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
