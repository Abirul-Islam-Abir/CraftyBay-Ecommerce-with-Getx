import '../../theme/app_colors.dart';
import '../../utils/export.dart';
import 'normal_text.dart';

class BottomDetailsCard extends StatelessWidget {
  const BottomDetailsCard(
      {super.key,
      required this.price,
      required this.onPressed,
      required this.name});

  final String price, name;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: AppColor.kPrimaryColor.shade50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const NormalText('Price'),
              CommonText(
                '\$$price',
                color: AppColor.kPrimaryColor,
              ),
            ],
          ),
          ElevatedButton(onPressed: onPressed, child: Text(name)),
        ],
      ),
    );
  }
}
