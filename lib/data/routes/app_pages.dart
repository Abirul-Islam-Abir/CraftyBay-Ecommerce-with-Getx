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
          name: RouteName.detailsScreen,
          page: () => ProductsDetailsScreen(),
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
    ];
