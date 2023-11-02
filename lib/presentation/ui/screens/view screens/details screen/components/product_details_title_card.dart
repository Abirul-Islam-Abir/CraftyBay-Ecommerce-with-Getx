import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../../../../data/utils/export.dart';
import '../../../../widgets/common_text.dart';
import '../../../../widgets/count_card.dart';
import '../../../../widgets/mini_heart_button.dart';
import '../../../../widgets/normal_text.dart';

class ProductDetailsTitleCard extends StatelessWidget {
  const ProductDetailsTitleCard({
    super.key,
    required this.title,
    required this.save,
    required this.count,
    required this.ratings,
    required this.removeOnTap,
    required this.addOnTap,
    required this.isFavPress, required this.reviewTap,
  });

  final String title, save, count, ratings;
  final Function() removeOnTap, addOnTap, isFavPress,reviewTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kTooSmallSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(title),
                  NormalText('Save $save%'),
                ],
              ),
              CountCard(
                addBtn: addOnTap,
                removeBtn: removeOnTap,
                count: count,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kTextSize),
          child: Row(
            children: [
              const Icon(
                EvaIcons.star,
                color: AppColor.kOrangeColor,
                size: kDefaultSize,
              ),
              CommonText(ratings),
              const SizedBox(width: 10),
              OutlinedButton( onPressed: reviewTap,
                child: const CommonText(
                  'Review',
                  color: AppColor.kPrimaryColor,fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              MiniHeartButton(
                isFavPress: isFavPress,
                icon: EvaIcons.heart,
              ),
            ],
          ),
        )
      ],
    );
  }
}
