import '../../../../../../data/utils/export.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/global_button.dart';
import '../../../../widgets/headline_text.dart';
import '../../../../widgets/splash_logo.dart';
import '../../../../widgets/subtitle_text.dart';

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
              Obx(() =>
                  GlobalButton(
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
