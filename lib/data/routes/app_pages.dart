import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/categories%20screen/view/list_product_by_categories_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/review%20screen/view/review_screen.dart';

import '../../presentation/ui/screens/view screens/create product review screen/view/create_product_review_screen.dart';
import '../utils/export.dart';

List<GetPage<dynamic>>? appPages() => [
      GetPage(
          name: RouteName.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.emailVerifyScreen,
          page: () => EmailVerifyScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.otpVerifyScreen,
          page: () => OtpVerifyScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.completeProfileScreen,
          page: () => CompleteProfileScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.remarkProductDetails,
          page: () => RemarkProductsDetailsScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.bottomNavigationBar,
          page: () => BottomNavBar(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.otpVerifyScreen,
          page: () => OtpVerifyScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.listProductByCategoryScreen,
          page: () => ListProductByCategoriesScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.reviewScreen,
          page: () =>   ReviewScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
      GetPage(
          name: RouteName.createReviewScreen,
          page: () =>   CreateReviewScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(microseconds: 500)),
    ];
