import '../utils/store_data_value.dart';

//const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';
const String brandListUrl = '$_baseUrl/BrandList';
const String categoryListUrl = '$_baseUrl/CategoryList';
const String listProductSliderUrl = '$_baseUrl/ListProductSlider';
const String listProductByBrandUrl = '$_baseUrl/ListProductByBrand/3';
const String listProductByCategoryUrl = '$_baseUrl/ListProductByCategory';
const String userLoginUrl = '$_baseUrl/UserLogin';
const String cartListUrl = '$_baseUrl/CartList';
const String verifyLoginUrl = '$_baseUrl/VerifyLogin';
const String createProfileUrl = '$_baseUrl/CreateProfile';
const String readProfileUrl = '$_baseUrl/ReadProfile';
const String createCartListUrl = '$_baseUrl/CreateCartList';
const String deleteCartListUrl = '$_baseUrl/DeleteCartList';
const String productWishListUrl = '$_baseUrl/ProductWishList';
const String listProductByReviewUrl = '$_baseUrl/ListReviewByProduct';
const String listProductByRemarkPopularUrl =
    '$_baseUrl/ListProductByRemark/popular';
const String listProductByRemarkSpecialUrl =
    '$_baseUrl/ListProductByRemark/special';
const String listProductByRemarkNewUrl = '$_baseUrl/ListProductByRemark/new';
const String productDetailsByIdUrl = '$_baseUrl/ProductDetailsById';
Map<String, String> headerWithTokens = {
  'token': UserData.userToken,
};

class BaseUrl {}
