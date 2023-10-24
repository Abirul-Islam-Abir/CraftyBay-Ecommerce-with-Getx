import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/read%20profile%20screen/controller/read_profile_controller.dart';

import '../../../../../../data/utils/export.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../remark product screen/view/new_product_screen.dart';
import '../../remark product screen/view/popular_product_screen.dart';
import '../../remark product screen/view/special_product_screen.dart';
import '../../slider view/controller/slider_controller.dart';
import '../component/all_categories_list_builder.dart';
import '../component/build_appbar.dart';
import '../../slider view/view/carousel_slider_builder.dart';
import '../component/categories_button.dart';
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
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: kTextSize),
            // CustomTextField widget for searching products.
            CustomTextField(
              controller: homeScreenController.searchController,
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search Products',
              onChanged: (query) {},
              label: 'Search',
            ),
            // CarouselSliderBuilder widget for displaying product sliders.
            CarouselSliderBuilder(sliderImageController.listProductSlider),
            // DotsIndicatorWidget for indicating the position in the slider.
            DotsIndicatorWidget(sliderImageController.listProductSlider),
            // CategoriesButton widget for displaying a category button (e.g., 'All Categories').
            CategoriesButton(
                onTap: bottomNavController.goToCategoryScreen,
                categoryName: 'All Categories'),
            // AllCategoriesListBuilder for displaying a list of categories.
            AllCategoriesListBuilder(categoryController.categoryList),
            // CategoriesButton for 'Popular' category.
            CategoriesButton(
                onTap: () {
                  Get.to(() => PopularProductScreen());
                },
                categoryName: 'Popular'),
            // ListProductByRemarkBuilder for displaying products in the 'Popular' category.
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkPopular),
            // CategoriesButton for 'Special' category.
            CategoriesButton(
                onTap: () {
                  Get.to(() => SpecialProductScreen());
                },
                categoryName: 'Special'),
            // ListProductByRemarkBuilder for displaying products in the 'Special' category.
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkSpecial),
            // CategoriesButton for 'New' category.
            CategoriesButton(
                onTap: () {
                  Get.to(() => NewProductScreen());
                },
                categoryName: 'New'),
            // ListProductByRemarkBuilder for displaying products in the 'New' category.
            ListProductByRemarkBuilder(
                remarkProductScreenController.listProductByRemarkNew),
          ],
        ),
      ),
    );
  }
}
