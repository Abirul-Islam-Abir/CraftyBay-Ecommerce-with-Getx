import '../../../data/utils/export.dart';

class NormalText extends StatelessWidget {
  final String text;

  const NormalText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kTooSmallSize),
      child: Text(
        text,
        style: TextStyle(
            fontSize: kTextSize,
            fontWeight: FontWeight.bold,
            color: AppColor.kBlackColor.withOpacity(0.5)),
      ),
    );
  }
}