import 'package:crafty_bay_ecommerce/modules/widgets/global_button.dart';
import 'package:crafty_bay_ecommerce/modules/widgets/headline_text.dart';
import 'package:crafty_bay_ecommerce/theme/app_colors.dart';
import 'package:crafty_bay_ecommerce/utils/export.dart';
import 'package:crafty_bay_ecommerce/utils/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../services/user/user_login.dart';
import '../../../../utils/store_data_value.dart';
import '../component/otp_sent_subtitle_text.dart';
import '../controller/otp_verify_screen_controller.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({super.key});

  final controller = Get.put(OtpVerifyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: Get.height,
          width: Get.size.width,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 100),
              const SplashLogo(),
              const SizedBox(height: kTooSmallSize),
              const HeadlineText(
                  text: 'Enter Your OTP Code', alignment: Alignment.center),
              LongLineSubtitleText(
                  text: AppString.someDigitCodeSentTo, txt: UserData.userEmail),
              const SizedBox(height: kBigSize),
              Form(
                key: controller.formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kTooSmallSize, horizontal: 50),
                    child: GetBuilder<OtpVerifyScreenController>(
                        builder: (controller) => PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                            length: 4,
                            obscureText: true,
                            obscuringCharacter: '*',
                            obscuringWidget:
                                SvgPicture.asset(ImageAsset.primaryLogoSvg),
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 3) {
                                return "Type your pin code";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: AppColor.kWhiteColor),
                            cursorColor: AppColor.kPrimaryColor,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: false,
                            errorAnimationController:
                                controller.errorController,
                            controller: controller.otpController,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                  offset: Offset(0, 1),
                                  color: AppColor.kPrimaryColor,
                                  blurRadius: 10)
                            ],
                            onCompleted: (v) {
                              controller.validateSubmit();
                            },
                            onChanged: (value) {
                              controller.onChangeMethod(value);
                            },
                            beforeTextPaste: (text) {
                              debugPrint("Allowing to paste $text");
                              return true;
                            }))),
              ),
              GetBuilder<OtpVerifyScreenController>(
                  builder: (_) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                          controller.hasError
                              ? "*Please fill up all the cells properly"
                              : "",
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)))),
              Obx(() => GlobalButton(
                    onPress: controller.validateSubmit,
                    text: 'Verify'.toUpperCase(),
                    isLoading: controller.isLoading,
                  )),
              const SizedBox(height: 16),
              Obx(() => LongLineSubtitleText(
                  text: AppString.thisCodeWillExpired,
                  txt: '${controller.countdown}s')),
              Obx(
                () => LongLineSubtitleText(
                  text: AppString.didNotReceivedTheCode,
                  txt: controller.isTimeOut.value ? '' : 'RESEND',
                  onTap: () {
                    controller.startCountdown();
                    userLoginRequest(UserData.userEmail);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
