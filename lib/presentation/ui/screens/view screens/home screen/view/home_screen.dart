import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/read_profile_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/wish_list_controller.dart';

import '../../../../../../data/utils/export.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../remark product screen/view/remark_product_screen.dart';
import '../../../../../state holder controller/slider_controller.dart';
import '../../categories screen/component/all_categories_list_builder.dart';
import '../../search screen/view/search_screen.dart';
import '../component/build_appbar.dart';
import '../../slider view/view/carousel_slider_builder.dart';
import '../../categories screen/component/categories_button.dart';
import '../../slider view/component/dots_indicator.dart';
import '../component/list_product_by_remark_builder.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeScreenController = Get.put(HomeScreenController());
  final remarkProductScreenController =
      Get.put(RemarkProductScreenController());
  final categoryController = Get.put(CategoriesScreenController());
  final bottomNavController = Get.put(BottomNavController());
  final sliderImageController = Get.put(SliderImageController());
  final cartScreenController = Get.put(CartScreenController());
  final readProfileScreenController = Get.put(ReadProfileScreenController());
  final wishListController = Get.put(WishListScreenController());
void refreshAll(){
  homeScreenController.initializeMethod();
  remarkProductScreenController.initializeMethod();
  categoryController.initializeMethod();
  sliderImageController.initializeMethod();
  cartScreenController.initializeMethod();
  wishListController.initializeMethod();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: RefreshIndicator(
        onRefresh: () async {
          refreshAll();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: kTextSize),
            CustomTextField(
              onTap: (){
                Get.to(()=>SearchScreen());
              },
                controller: homeScreenController.searchController,
                prefixIcon: const Icon(Icons.search),
                hintText: AppString.searchProduct,
                onChanged: (query) {},
                label: AppString.search),
            CarouselSliderBuilder(sliderImageController.listProductSlider),
            DotsIndicatorWidget(sliderImageController.listProductSlider),
            CategoriesButton(
                onTap: bottomNavController.goToCategoryScreen,
                categoryName: AppString.allCategory),
            AllCategoriesListBuilder(categoryController.categoryList),
            CategoriesButton(
                onTap: () {
                  Get.to(() => RemarkProductScreen(
                        products: remarkProductScreenController
                            .listProductByRemarkPopular,
                        productName: AppString.popular,
                      ));
                },
                categoryName:  AppString.popular),
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkPopular),
            CategoriesButton(
                onTap: () {
                  Get.to(() => RemarkProductScreen(
                        products: remarkProductScreenController
                            .listProductByRemarkSpecial,
                        productName:  AppString.special,
                      ));
                },
                categoryName: AppString.special),
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkSpecial),
            CategoriesButton(
                onTap: () {
                  Get.to(() => RemarkProductScreen(
                      products:
                          remarkProductScreenController.listProductByRemarkNew,
                      productName: AppString.newT));
                },
                categoryName: AppString.newT),
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkNew),
          ],
        ),
      ),
    );
  }
}
