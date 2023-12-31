import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/wish_list_controller.dart';

import '../../../../../../data/utils/animation_effect.dart';
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/bottom_details_card.dart';
import '../../../../widgets/common_text.dart';
import '../../../../widgets/normal_text.dart';
import '../../../../widgets/product_details_screen_shimmer.dart';
import '../components/color_circle_builder.dart';
import '../components/image_card.dart';
import '../components/product_details_title_card.dart';
import '../components/size_circle_builder.dart';

class RemarkProductsDetailsScreen extends StatelessWidget {
  RemarkProductsDetailsScreen({Key? key}) : super(key: key);
  final detailsController = Get.put(RemarkProductDetailsScreenController());
  final cartController = Get.put(CartScreenController());
  final wishListController = Get.put(WishListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title:   Text(AppString.productDetails)),
      body: GetBuilder<RemarkProductDetailsScreenController>(
        builder: (detailsController) {
          final data = detailsController.productDetailsById;
          return detailsController.isLoading
              ? const ProductsDetailsShimmer()
              :data.isEmpty ? const ProductsDetailsShimmer(): Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: AnimateList(
                          delay: const Duration(seconds: 1),
                          effects: EffectFactory.upToDownAnimate,
                          children: [
                            ImageCard(productDetails: data),
                            const SizedBox(height: 10),
                            ProductDetailsTitleCard(
                              reviewTap: (){Get.toNamed(RouteName.reviewScreen,arguments:{
                                'id':data[0].id,
                                'product_id':data[0].productId,
                              });},
                              count: '${detailsController.countProduct}',
                              title: '${data[0].product?.title ?? " "} ${data[0].product?.brandId ?? ""}',
                              ratings:  '${int.parse('${data[0].product?.star ?? ""}')/100*5}',
                              save: '${data[0].product?.discount ?? " "}',
                              addOnTap: detailsController.increment,
                              isFavPress: () {wishListController.fetchAndParseCreateWishList(data[0].product?.id);},
                              removeOnTap: detailsController.decrement,
                            ),
                            const SizedBox(height: 10),
                            ColorCircleBuilder(detailsController.color),
                            SizeCircleBuilder(detailsController.size),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kTooSmallSize),
                              child: NormalText(AppString.description),
                            ),
                            CommonText(data[0].des ?? " "),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    GetBuilder<CartScreenController>(builder: (cartController) {
                      final colorIndex = detailsController.colorIndex;
                      final colorName = detailsController.color[colorIndex]['name'];
                      final sizeIndex = detailsController.sizeIndex;
                      final sizeName = detailsController.size[sizeIndex];
                      return BottomDetailsCard(
                        isProgress: cartController.isCartAdd,
                        name: AppString.addToCart,
                        onPressed: () {
                          cartController.fetchAndParseCreateCartList(
                              productDetailsById: data,
                              color: colorName,
                              size: sizeName,
                              countProduct: detailsController.countProduct);
                        },
                        price: data[0].product?.price ?? " ",
                      );
                    }),
                  ],
                );
        },
      ),
    );
  }
}
