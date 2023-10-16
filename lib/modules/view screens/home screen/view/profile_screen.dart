import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/controller/home_screen_controller.dart';
import 'package:crafty_bay_ecommerce/theme/app_colors.dart';
import 'package:crafty_bay_ecommerce/utils/export.dart';
import '../../../../utils/image_assets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: Get.width,
        child: ListView.builder(
          itemCount: controller.readProfile.length,
          itemBuilder: (context, index) {
            final firstName = controller.readProfile[0].firstName ?? '';
            final lastName = controller.readProfile[0].lastName ?? '';
            final email = controller.readProfile[0].email ?? '';
            final mobile = controller.readProfile[0].mobile ?? '';
            final city = controller.readProfile[0].city ?? '';
            final shippingAddress =
                controller.readProfile[0].shippingAddress ?? '';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.kTransparentColor,
                  radius: 50,
                  backgroundImage: NetworkImage(ImageAsset.profileImageNet),
                ),
                const SizedBox(height: 20),
                const Divider(),
                Text(
                  '$firstName $lastName',
                  style: const TextStyle(
                      fontSize: kPrimarySize,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kTextColor),
                ),
                const SizedBox(height: 10),
                Text(email,
                    style: const TextStyle(
                        fontSize: kTextSize, color: AppColor.kTextColor)),
                const SizedBox(height: 10),
                Text(
                  mobile,
                  style: const TextStyle(
                      fontSize: kTextSize, color: AppColor.kTextColor),
                ),
                const SizedBox(height: 10),
                Text(
                  city,
                  style: const TextStyle(
                      fontSize: kTextSize, color: AppColor.kTextColor),
                ),
                const SizedBox(height: 10),
                Text(
                  shippingAddress,
                  style: const TextStyle(
                      fontSize: kTextSize, color: AppColor.kTextColor),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
