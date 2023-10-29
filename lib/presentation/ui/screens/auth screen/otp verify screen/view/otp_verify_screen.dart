import '../../../../../../data/utils/export.dart';
import '../../../../widgets/global_button.dart';
import '../../../../widgets/headline_text.dart';
import '../../../../widgets/splash_logo.dart';
import '../component/otp_sent_subtitle_text.dart';

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
                        vertical: 0, horizontal: kDefaultSize),
                    child: GetBuilder<OtpVerifyScreenController>(
                        builder: (controller) =>
                            PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                                length: 6,
                                obscureText: false,
                                obscuringCharacter: '*',

                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                validator: (v) {
                                  if (v!.length < 5) {
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
                  builder: (_) =>
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                              controller.hasError
                                  ? "*Please fill up all the cells properly"
                                  : "",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)))),
              GetBuilder<OtpVerifyScreenController>(
                  builder: (controller) =>
                      GlobalButton(
                        onPress: controller.validateSubmit,
                        text: 'Verify'.toUpperCase(),
                        isLoading: controller.isLoading,
                      )),
              const SizedBox(height: 16),
              Obx(() =>
                  LongLineSubtitleText(
                      text: AppString.thisCodeWillExpired,
                      txt: '${controller.countdown}s')),
              Obx(() =>
                  LongLineSubtitleText(
                    text: AppString.didNotReceivedTheCode,
                    txt: controller.isTimeOut.value ? '' : 'RESEND',
                    onTap: () {
                      controller.startCountdown();
                      userLoginRequest(UserData.userEmail);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
