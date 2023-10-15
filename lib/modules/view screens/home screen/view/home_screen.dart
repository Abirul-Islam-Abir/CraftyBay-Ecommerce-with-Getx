import 'package:crafty_bay_ecommerce/modules/view%20screens/remark%20product%20screen/view/new_product_screen.dart';import 'package:crafty_bay_ecommerce/modules/view%20screens/remark%20product%20screen/view/popular_product_screen.dart';import 'package:crafty_bay_ecommerce/modules/view%20screens/remark%20product%20screen/view/special_product_screen.dart';import '../../../../utils/export.dart';import '../../bottom nav/controller/bottom_nav_controller.dart';import '../../categories screen/controller/categories_screen_controller.dart';import '../../remark product screen/controller/remark_product_screen_controller.dart';import '../component/all_categories_list_builder.dart';import '../component/categories_button.dart';import '../component/dots_indicator.dart';import '../component/list_product_by_remark_builder.dart';import '../controller/home_screen_controller.dart';class HomeScreen extends StatelessWidget {  HomeScreen({super.key});  final homeScreenController = Get.put(HomeScreenController());  final remarkProductScreenController =      Get.put(RemarkProductScreenController());  final categoryController = Get.put(CategoriesScreenController());  final bottomNavController = Get.put(BottomNavController());  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: buildAppBar(context),      body: RefreshIndicator(        onRefresh: () async {          homeScreenController.initializeMethod();          remarkProductScreenController.initializeMethod();        },        child: ListView(          shrinkWrap: true,          children: [            const SizedBox(height: kTextSize),            // CustomTextField widget for searching products.            CustomTextField(              controller: homeScreenController.searchController,              prefixIcon: const Icon(Icons.search),              hintText: 'Search Products',              onChanged: (query) {},              label: 'Search',            ),            // CarouselSliderBuilder widget for displaying product sliders.            CarouselSliderBuilder(homeScreenController.listProductSlider),            // DotsIndicatorWidget for indicating the position in the slider.            DotsIndicatorWidget(homeScreenController.listProductSlider),            // CategoriesButton widget for displaying a category button (e.g., 'All Categories').            CategoriesButton(                onTap: () {                  bottomNavController.goToCategoryScreen();                },                categoryName: 'All Categories'),            // AllCategoriesListBuilder for displaying a list of categories.            AllCategoriesListBuilder(categoryController.categoryList),            // CategoriesButton for 'Popular' category.            CategoriesButton(                onTap: () {                  Get.to(() => PopularProductScreen());                },                categoryName: 'Popular'),            // ListProductByRemarkBuilder for displaying products in the 'Popular' category.            ListProductByRemarkBuilder(                remarkProductScreenController.listProductByRemarkPopular),            // CategoriesButton for 'Special' category.            CategoriesButton(                onTap: () {                  Get.to(() => SpecialProductScreen());                },                categoryName: 'Special'),            // ListProductByRemarkBuilder for displaying products in the 'Special' category.            ListProductByRemarkBuilder(                remarkProductScreenController.listProductByRemarkSpecial),            // CategoriesButton for 'New' category.            CategoriesButton(                onTap: () {                  Get.to(() => NewProductScreen());                },                categoryName: 'New'),            // ListProductByRemarkBuilder for displaying products in the 'New' category.            ListProductByRemarkBuilder(                remarkProductScreenController.listProductByRemarkNew),          ],        ),      ),    );  }}