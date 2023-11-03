import '../../../../../../data/utils/export.dart';
import '../../../../widgets/common_text.dart';
import '../../../../widgets/count_card.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.title,
    required this.colorText,
    required this.sizeText,
    required this.price,
    required this.count,
    required this.deletePress,
    required this.img, required this.onTap,
  });

  final String title, colorText, sizeText, price, count, img;
  final Function() deletePress ;
final Function()  onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child:  Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kTooSmallSize),
            child:InkWell(onTap: onTap,
              child: SizedBox(
              height: 90,
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Image.network(
                      img,
                      errorBuilder: (context, error, stackTrace) => Image.network(
                        ImageAsset.noImageNet,
                        height: 300,
                        width: Get.width / 3,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 10,
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
                    flex: 5,
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
                       CommonText('Qty: $count')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
