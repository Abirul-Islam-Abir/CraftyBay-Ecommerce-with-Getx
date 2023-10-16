import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/details%20screen/components/size_circle.dart';

import '../../../../../../data/utils/export.dart';
import '../../../../widgets/normal_text.dart';

class SizeCircleBuilder extends GetView<ProductDetailsScreenController> {
  const SizeCircleBuilder(this.list, {super.key});

  final List list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kTooSmallSize),
          child: NormalText('Size'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kTooSmallSize),
          child: Row(
              children: List.generate(
            list.length,
            (index) => SizeCircle(
              selectedIndex: controller.sizeIndex,
              index: index,
              text: list[index],
              onTap: () {
                controller.sizeSelect(index);
              },
            ),
          )),
        ),
      ],
    );
  }
}
