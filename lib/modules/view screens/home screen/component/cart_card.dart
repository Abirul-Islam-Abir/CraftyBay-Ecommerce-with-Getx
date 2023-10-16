import '../../../../theme/app_colors.dart';
import '../../../../utils/export.dart';
import '../../../../utils/image_assets.dart';
import '../../../widgets/count_card.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.title,
    required this.colorText,
    required this.sizeText,
    required this.price,
    required this.count,
    required this.deletePress,
    required this.addBtn,
    required this.removeBtn,
  });
  final String title, colorText, sizeText, price, count;
  final Function() deletePress, addBtn, removeBtn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kTooSmallSize),
          child: SizedBox(
            height: 90,
            width: Get.width,
            child: Row(
              children: [
                Expanded(flex: 3, child: Image.asset(ImageAsset.shoes)),
                Expanded(
                    flex: 8,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                  fontSize: kTextSmallSize,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.kTextColor)),
                          const SizedBox(height: 5),
                          Text('Color: $colorText, Size: $sizeText',
                              style: const TextStyle(
                                  color: AppColor.kTextColor,
                                  fontSize: kSmallSize)),
                          const Spacer(),
                          Text('\$$price',
                              style: const TextStyle(
                                  color: AppColor.kPrimaryColor,
                                  fontSize: kTextSize,
                                  fontWeight: FontWeight.bold))
                        ])),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: deletePress,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: kSmallSize),
                          child: Icon(Icons.delete,
                              color: AppColor.kRedColor, size: kPrimarySize),
                        ),
                      ),
                      const Spacer(),
                      CountCard(
                          addBtn: addBtn, removeBtn: removeBtn, count: count)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
