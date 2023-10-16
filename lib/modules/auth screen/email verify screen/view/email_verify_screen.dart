import 'package:crafty_bay_ecommerce/modules/auth%20screen/email%20verify%20screen/controller/email_verify_screen_controller.dart';
import 'package:crafty_bay_ecommerce/modules/widgets/global_button.dart';
import 'package:crafty_bay_ecommerce/modules/widgets/headline_text.dart';
import 'package:crafty_bay_ecommerce/modules/widgets/subtitle_text.dart';
import 'package:crafty_bay_ecommerce/utils/export.dart';
import 'package:crafty_bay_ecommerce/utils/validate_method.dart';

class EmailVerifyScreen extends StatelessWidget {
  EmailVerifyScreen({super.key});

  final controller = Get.put(EmailVerifyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 150),
              const SplashLogo(),
              const HeadlineText(
                  text: AppString.welcomeBack, alignment: Alignment.center),
              const SubtitleText(
                  text: AppString.pleaseEnterYourEmailAddress,
                  alignment: Alignment.center),
              const SizedBox(height: kBigSize),
              CustomTextField(
                  focusNode: controller.focusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  onFieldSubmitted: (v) {
                    controller.validateSubmit();
                  },
                  controller: controller.emailController,
                  hintText: AppString.enterYourEmail,
                  label: AppString.email),
              const SizedBox(height: kBigSize),
              Obx(() => GlobalButton(
                  isLoading: controller.isLoading,
                  onPress: () {
                    controller.validateSubmit();
                  },
                  text: AppString.verify)),
            ],
          )),
    );
  }
}
