import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/read%20profile%20screen/controller/read_profile_controller.dart';

import '../../../../../../data/utils/export.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../remark product screen/view/remark_product_screen.dart';
import '../../slider view/controller/slider_controller.dart';
import '../../categories screen/component/all_categories_list_builder.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: RefreshIndicator(
        onRefresh: () async {
          homeScreenController.initializeMethod();
          remarkProductScreenController.initializeMethod();
          categoryController.initializeMethod();
          sliderImageController.initializeMethod();
          cartScreenController.initializeMethod();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: kTextSize),
            CustomTextField(
                controller: homeScreenController.searchController,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Products',
                onChanged: (query) {},
                label: 'Search'),
            CarouselSliderBuilder(sliderImageController.listProductSlider),
            DotsIndicatorWidget(sliderImageController.listProductSlider),
            CategoriesButton(
                onTap: bottomNavController.goToCategoryScreen,
                categoryName: 'All Categories'),
            AllCategoriesListBuilder(categoryController.categoryList),
            CategoriesButton(
                onTap: () {
                  Get.to(() => RemarkProductScreen(
                        products: remarkProductScreenController
                            .listProductByRemarkPopular,
                        productName: 'Popular',
                      ));
                },
                categoryName: 'Popular'),
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkPopular),
            CategoriesButton(
                onTap: () {
                  Get.to(() => RemarkProductScreen(
                        products: remarkProductScreenController
                            .listProductByRemarkSpecial,
                        productName: 'Special',
                      ));
                },
                categoryName: 'Special'),
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkSpecial),
            CategoriesButton(
                onTap: () {
                  Get.to(() => RemarkProductScreen(
                      products:
                          remarkProductScreenController.listProductByRemarkNew,
                      productName: 'New'));
                },
                categoryName: 'New'),
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkNew),
          ],
        ),
      ),
    );
  }
}
