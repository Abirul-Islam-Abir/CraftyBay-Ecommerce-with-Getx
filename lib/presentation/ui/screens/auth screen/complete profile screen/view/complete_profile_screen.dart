import '../../../../../../data/utils/export.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/global_button.dart';
import '../../../../widgets/headline_text.dart';
import '../../../../widgets/splash_logo.dart';
import '../../../../widgets/subtitle_text.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});

  final controller = Get.put(CompleteProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const SizedBox(height: kSmallSize),
            const SplashLogo(),
            const HeadlineText(
                text: AppString.welcomeBack, alignment: Alignment.center),
            const SubtitleText(
               AppString.pleaseEnterYourEmailAddress,
                alignment: Alignment.center),
            const SizedBox(height: kSmallSize),
            CustomTextField(
                focusNode: controller.firstNameFocus,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: controller.firstNameController,
                validator: validate,
                hintText: AppString.enterYourFirstName,
                onFieldSubmitted: (v) {
                  controller.lastNameFocus.requestFocus();
                },
                label: AppString.firstName),
            const SizedBox(height: kSmallSize),
            CustomTextField(
                focusNode: controller.lastNameFocus,
                textInputAction: TextInputAction.next,
                controller: controller.lastNameController,
                keyboardType: TextInputType.name,
                validator: validate,
                onFieldSubmitted: (v) {
                  controller.mobileFocus.requestFocus();
                },
                hintText: AppString.enterYourLastName,
                label: AppString.lastName),
            const SizedBox(height: kSmallSize),
            CustomTextField(
                focusNode: controller.mobileFocus,
                textInputAction: TextInputAction.next,
                controller: controller.mobileController,
                keyboardType: TextInputType.phone,
                validator: validate,
                hintText: AppString.enterYourMobileNumber,
                onFieldSubmitted: (v) {
                  controller.addressFocus.requestFocus();
                },
                label: AppString.mobileNumber),
            const SizedBox(height: kSmallSize),
            CustomTextField(
                focusNode: controller.addressFocus,
                textInputAction: TextInputAction.next,
                controller: controller.addressController,
                keyboardType: TextInputType.name,
                validator: validate,
                onFieldSubmitted: (v) {
                  controller.shippingAddressFocus.requestFocus();
                },
                hintText: AppString.enterYourCityAddress,
                label: AppString.city),
            const SizedBox(height: kSmallSize),
            CustomTextField(
                focusNode: controller.shippingAddressFocus,
                onFieldSubmitted: (v) {
                  controller.validateSubmit();
                },
                textInputAction: TextInputAction.done,
                controller: controller.shippingAddressController,
                validator: validate,
                keyboardType: TextInputType.emailAddress,
                hintText: AppString.enterYourShippingAddress,
                label: AppString.shipping,
                padding: 25,
                maxLines: 3),
            const SizedBox(height: kTextSize),
            Obx(() => GlobalButton(
                isLoading: controller.isLoading,
                onPress: controller.validateSubmit,
                text: AppString.complete)),
          ],
        ),
      ),
    );
  }
}
