import 'export.dart';

class SnackToast {
  static requestFailed() {
    Get.snackbar(
      'Ohh.Noo!',
       'Unable to complete the request ',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  }

  static cartOperationSuccessful() {
    Get.snackbar(
      'Great!',
      'Your cart items added successfully',
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green,
    );
  }
  static cartItemDelete() {
    Get.snackbar(
      'Great!',
      'Your cart items delete successfully',
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green,
    );
  }
  static cartOperationFailed() {
    Get.snackbar(
       'Ohh..Noo!',
       'Unable to complete the cart operation',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  }

  static requestSuccess() {
    Get.snackbar(
      'Great!',
        'The request was completed successfully.',
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green,
    );
  }
  static wishListSuccess() {
    Get.snackbar(
      'Great!',
      'The wish list item added successfully.',

    );
  }static wishListFailed() {
    Get.snackbar(
      'Ohh..Noo!',
      'Unable to add wish list items. Please check your credentials.',
       backgroundColor: Colors.red,
    );
  }
  static loginFailed() {
    Get.snackbar(
       'Ohh..Noo!',
       'Unable to log in. Please check your credentials.',

      backgroundColor: Colors.red,
    );
  }

  static loginSuccess() {
    Get.snackbar(
   'Great!',
        'You have successfully logged in.',

    );
  }

  static otpVerifyFailed() {
    Get.snackbar(
      'Oh..Noo!',
     'Unable to verify OTP. Please check the code and try again.',

      backgroundColor: Colors.red,

    );
  }


}
