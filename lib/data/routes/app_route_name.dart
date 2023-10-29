class RouteName {
  static const splashScreen = '/SplashScreen';
  static const loginScreen = '/LoginScreen';
  static const emailVerifyScreen = '/EmailVerifyScreen';
  static const otpVerifyScreen = '/OtpVerifyScreen';
  static const setPasswordScreen = '/SetPasswordScreen';
  static const createUserAccountScreen = '/CreateUserAccountScreen';
  static const addNewTaskScreen = '/AddNewTaskScreen';
  static const updateProfileScreen = '/UpdateProfileScreen';
  static const homeScreen = '/HomeScreen';
  static const newTaskList = '/NewTaskList';
  static const noInternetScreen = '/NoInternetScreen';
  static const onboardingScreen = '/OnBoardingScreen';
  static const completeProfileScreen = '/CompleteProfileScreen';
  static const loginSuccessScreen = '/LoginSuccessScreen';
  static const matchScreen = '/MatchScreen';
  static const userAccountList = '/UserAccountList';
  static const helpCenterScreen = '/HelpCenterScreen';
  static const favoritesScreen = '/FavoritesScreen';
  static const historyScreen = '/HistoryScreen';
  static const settingsScreen = '/SettingsScreen';
  static const aboutScreen = '/AboutScreen';
  static const logOutScreen = '/LogOutScreen';
  static const reviewScreen = '/ReviewScreen';

  static const mapScreen = '/MapScreen';
  static const remarkProductDetails = '/RemarkProductDetails';
  static const sliderViewDetails = '/SliderViewDetails';
  static const listProductByCategoryDetails = '/ListProductByCategoryDetails';
  static const bottomNavigationBar = '/BottomNavigationBar';
  static const listProductByCategoryScreen = '/ListProductByCategoryScreen';
  // Helper function to generate unique route names
  static String generateUniqueRouteName() {
    return '/${DateTime.now().millisecondsSinceEpoch}';
  }

  // Don't create a constructor
  RouteName._();
}
