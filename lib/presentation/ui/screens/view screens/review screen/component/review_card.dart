
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/common_text.dart';
import '../../../../widgets/normal_text.dart';
import '../../../../widgets/subtitle_text.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.des, required this.name});

  final String des, name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: Get.width,
      child: FittedBox(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.manage_accounts_outlined),
                NormalText(name)
              ],
            ),
            SubtitleText(
              des,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}