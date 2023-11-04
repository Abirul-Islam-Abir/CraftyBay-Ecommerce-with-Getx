import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/read_profile_controller.dart';

import '../../../../../../data/utils/export.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.put(ReadProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: Get.width,
        child: ListView.builder(
          itemCount: controller.readProfile.length,
          itemBuilder: (context, index) {
            final firstName = controller.readProfile[index].cusName ?? '';
            final mobile = controller.readProfile[index].cusPhone ?? '';
            final city = controller.readProfile[index].cusCity ?? '';
            final shippingAddress = controller.readProfile[index].cusAdd ?? '';

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
                  firstName,
                  style: const TextStyle(
                      fontSize: kPrimarySize,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kTextColor),
                ),
                const SizedBox(height: 10),
                Text(city,
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
