
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/normal_text.dart';
import '../../../../widgets/subtitle_text.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.des, required this.name});

  final String des, name;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: 120,
        width: Get.width,
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.manage_accounts_outlined),
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