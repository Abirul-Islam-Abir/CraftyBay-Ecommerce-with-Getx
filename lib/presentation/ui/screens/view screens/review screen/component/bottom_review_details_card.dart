
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/normal_text.dart';

class BottomReviewDetailsCard extends StatelessWidget {
  const BottomReviewDetailsCard(
      {super.key,
        required this.length,
        required this.onPressed,
        required this.name,
        required this.isProgress});

  final String length, name;
  final GestureTapCallback onPressed;
  final bool isProgress;

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
          Row(
            children: [
              const NormalText('Reviews'),
              NormalText(
                  '( $length )'
              ),
            ],
          ),
          isProgress
              ? const Center(child: CircularProgressIndicator())
              :  FloatingActionButton(onPressed: onPressed,child: Icon(Icons.add),),
        ],
      ),
    );
  }
}