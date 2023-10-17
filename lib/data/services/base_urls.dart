import '../utils/store_data_value.dart';

const String baseUrl = 'https://craftybay.teamrabbil.com/api';
const String brandListUrl = '$baseUrl/BrandList';
const String categoryListUrl = '$baseUrl/CategoryList';
const String listProductSliderUrl = '$baseUrl/ListProductSlider';
const String listProductByBrandUrl = '$baseUrl/ListProductByBrand/3';
const String listProductByCategoryUrl = '$baseUrl/ListProductByCategory/3';
const String userLoginUrl = '$baseUrl/UserLogin';
const String cartListUrl = '$baseUrl/CartList';
const String verifyLoginUrl = '$baseUrl/VerifyLogin';
const String createProfileUrl = '$baseUrl/CreateProfile';
const String readProfileUrl = '$baseUrl/ReadProfile';
const String createCartListUrl = '$baseUrl/CreateCartList';
const String deleteCartListUrl = '$baseUrl/DeleteCartList';
const String productWishListUrl = '$baseUrl/ProductWishList';
const String listProductByReviewUrl = '$baseUrl/ListReviewByProduct';
const String listProductByRemarkPopularUrl =
    '$baseUrl/ListProductByRemark/popular';
const String listProductByRemarkSpecialUrl =
    '$baseUrl/ListProductByRemark/special';
const String listProductByRemarkNewUrl = '$baseUrl/ListProductByRemark/new';
const String productDetailsByIdUrl = '$baseUrl/ProductDetailsById';
Map<String, String> headerWithTokens = {
  'token': UserData.userToken,
};
