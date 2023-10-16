import 'export.dart';

class SnackToast {
  static requestFailed() {
    Get.snackbar(
      'Request Failed!',
      'Unable to complete the request ',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static cartOperationSuccessful() {
    Get.snackbar(
      'Cart Operation Successful',
      'Your cart operation was completed successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static cartOperationFailed() {
    Get.snackbar(
      'Cart Operation Failed',
      'Unable to complete the cart operation',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static requestSuccess() {
    Get.snackbar(
      'Request Successful',
      'The request was completed successfully.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static loginFailed() {
    Get.snackbar(
      'Login Failed',
      'Unable to log in. Please check your credentials.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static loginSuccess() {
    Get.snackbar(
      'Login Successful',
      'You have successfully logged in.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static otpVerifyFailed() {
    Get.snackbar(
      'OTP Verification Failed',
      'Unable to verify OTP. Please check the code and try again.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static showDeleteDialog(id) {
    Get.defaultDialog(
      title: "Confirm Delete",
      middleText: "Are you sure you want to delete this product?",
      textConfirm: "Delete",
      textCancel: "Cancel",
      buttonColor: AppColor.kRedColor,
      confirmTextColor: Colors.white,
      // Change the color for the "Delete" button
      cancelTextColor: Colors.blue,
      // Change the color for the "Cancel" button
      onConfirm: () async {
        Get.find<CartScreenController>().deleteItems(id);
        Get.back();
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
