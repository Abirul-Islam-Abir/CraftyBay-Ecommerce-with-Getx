import '../../../../../../data/utils/animation_effect.dart';
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/carousel_slider_shimmer.dart';
import '../../home screen/component/build_carousel_option.dart';
import '../component/carousel_banner_card.dart';
import '../controller/slider_controller.dart';

class CarouselSliderBuilder extends GetView<HomeScreenController> {
  const CarouselSliderBuilder(this.products, {super.key});

  final List<ListProductSliderModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kTextSize),
      child: GetBuilder<SliderImageController>(
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
                      onPressed: () {
                        Get.toNamed(RouteName.detailsScreen,
                            arguments: data.id);
                      }),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
