import '../../../data/utils/export.dart';
import '../screens/view screens/details screen/components/color_circle.dart';
import '../screens/view screens/details screen/components/product_details_title_card.dart';
import '../screens/view screens/details screen/components/size_circle.dart';

class ProductsDetailsShimmer extends GetView<ProductDetailsScreenController> {
  const ProductsDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighLightColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: Get.width,
            height: Get.height / 3,
            decoration: BoxDecoration(
              color: AppColor.kPrimaryColor.shade50,
            ),
          ),
          const SizedBox(height: 10),
          ProductDetailsTitleCard(
              count: '01',
              title: '',
              ratings: '',
              save: '',
              addOnTap: () {},
              isFavPress: () {},
              removeOnTap: () {}),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('===='),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSmallSize),
                child: Row(
                  children: List.generate(
                    controller.color.length,
                    (index) => ColorCircle(
                      selectedIndex: 5,
                      index: index,
                      color: controller.color[index]['color'],
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Size'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSmallSize),
                child: Row(
                    children: List.generate(
                  controller.list.length,
                  (index) => SizeCircle(
                    selectedIndex: 4,
                    index: index,
                    text: controller.list[index],
                    onTap: () {},
                  ),
                )),
              ),
            ],
          ),
          const Text('Description'),
          const SizedBox(height: 60),
          const Text('=========='),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: AppColor.kPrimaryColor.shade50,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Price'),
                    Text(
                      '\$=========',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
