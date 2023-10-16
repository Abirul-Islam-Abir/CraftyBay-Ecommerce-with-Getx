import '../../../../utils/export.dart';
import '../../../widgets/normal_text.dart';
import '../controller/produts_details_screen_controller.dart';
import 'color_circle.dart';

class ColorCircleBuilder extends GetView<ProductDetailsScreenController> {
  const ColorCircleBuilder(this.color, {super.key});

  final List color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kTooSmallSize),
          child: NormalText('Color'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kTooSmallSize),
          child: Row(
            children: List.generate(
              color.length,
              (index) => ColorCircle(
                selectedIndex: controller.colorIndex,
                index: index,
                color: color[index],
                onTap: () {
                  controller.colorSelect(index);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
