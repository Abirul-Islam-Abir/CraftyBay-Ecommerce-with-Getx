import '../utils/box_data_store.dart';

//const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

Map<String, String> headerWithTokens = {
  'token': BoxDataStore.userToken.toString(),
};

class APIServices {
static  const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';
static  const String brandListUrl = '$_baseUrl/BrandList';
 static const String categoryListUrl = '$_baseUrl/CategoryList';
 static const String listProductSliderUrl = '$_baseUrl/ListProductSlider';
 static const String listProductByBrandUrl = '$_baseUrl/ListProductByBrand/1';
static  const String listProductByCategoryUrl = '$_baseUrl/ListProductByCategory';
 static const String userLoginUrl = '$_baseUrl/UserLogin';
 static const String cartListUrl = '$_baseUrl/CartList';
static  const String createProductReviewUrl = '$_baseUrl/CreateProductReview';
 static const String verifyLoginUrl = '$_baseUrl/VerifyLogin';
static  const String createProfileUrl = '$_baseUrl/CreateProfile';
static  const String readProfileUrl = '$_baseUrl/ReadProfile';
static  const String createCartListUrl = '$_baseUrl/CreateCartList';
static  const String deleteCartListUrl = '$_baseUrl/DeleteCartList';
static  const String productWishListUrl = '$_baseUrl/ProductWishList';
static  const String listProductByReviewUrl = '$_baseUrl/ListReviewByProduct';
 static const String listProductByRemarkPopularUrl =
      '$_baseUrl/ListProductByRemark/popular';
 static const String listProductByRemarkSpecialUrl =
      '$_baseUrl/ListProductByRemark/special';
 static const String listProductByRemarkNewUrl = '$_baseUrl/ListProductByRemark/new';
 static const String productDetailsByIdUrl = '$_baseUrl/ProductDetailsById';
 static const String createInvoiceUrl = '$_baseUrl/InvoiceCreate';

  APIServices._();}
