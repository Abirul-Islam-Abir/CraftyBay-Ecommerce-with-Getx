import 'package:crafty_bay_ecommerce/data/utils/export.dart';

import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/global_button.dart';
import '../../../../../state holder controller/create_review_controller.dart';

class CreateReviewScreen extends StatelessWidget {
  CreateReviewScreen({super.key});

  final controller = Get.put(CreateReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: Form(key: controller.formKey,
        child: ListView(
          children: [ const SizedBox(height: 50),
            CustomTextField(
                focusNode: controller.firstNameFocus,
                textInputAction: TextInputAction.next,
                controller: controller.firstNameController,
                keyboardType: TextInputType.name,
                validator: validate,
                onFieldSubmitted: (v) {
                  controller.firstNameFocus.requestFocus();
                },
                hintText: AppString.firstName,
                label: AppString.firstName),
            const SizedBox(height: kDefaultSize),
            CustomTextField(
                focusNode: controller.lastNameFocus,
                textInputAction: TextInputAction.next,
                controller: controller.lastNameController,
                keyboardType: TextInputType.name,
                validator: validate,
                onFieldSubmitted: (v) {
                  controller.lastNameFocus.requestFocus();
                },
                hintText: AppString.lastName,
                label: AppString.lastName),
            const SizedBox(height: kDefaultSize),
            CustomTextField(
                focusNode: controller.reviewFocus,
                onFieldSubmitted: (v) {
                  controller.validateSubmit();
                },
                textInputAction: TextInputAction.done,
                controller: controller.reviewController,
                validator: validate,
                keyboardType: TextInputType.emailAddress,
                hintText: AppString.createReview,
                label: AppString.createReview,
                padding: 60,
                maxLines: 5),
            const SizedBox(height: kTextSize),
            GetBuilder<CreateReviewController>(
              builder: (controller) => GlobalButton(
                  isLoading: controller.isLoading,
                  onPress: controller.validateSubmit,
                  text: 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
