import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/model/products%20model/list_product_slider_model.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/controller/home_screen_controller.dart';
import 'package:crafty_bay_ecommerce/modules/widgets/carousel_slider_shimmer.dart';
import 'package:crafty_bay_ecommerce/utils/export.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../utils/animation_effect.dart';
import 'build_carousel_option.dart';

class CarouselSliderBuilder extends GetView<HomeScreenController> {
  const CarouselSliderBuilder(this.products, {super.key});

  final List<ListProductSliderModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kTextSize),
      child: GetBuilder<HomeScreenController>(
        builder: (controller) {
          final length = products.length;
          return CarouselSlider(
            options: buildCarouselOptions(
              initialPage:
                  controller.carouselCurrentIndex, // Adjusted initialPage
              onPageChanged: (index, page) {
                controller.carouselSelectedIndex(index);
              },
            ),
            items: List.generate(
              length == 0 ? 1 : products.length,
              (index) {
                if (index >= products.length || controller.isLoading) {
                  return const CarouselSliderShimmer();
                }
                final data = products[index];
                return Animate(
                  effects: EffectFactory.upToDownAnimate,
                  child: CarouselBannerCard(
                      img: '${data.image}',
                      title: '${data.title}',
                      onPressed: controller.isCheckLoggedIn),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
