import '../../../data/utils/export.dart';

class CommonText extends StatelessWidget {
  const CommonText(
    this.text, {
    super.key,
    this.fontWeight,
    this.color = AppColor.kTextColor,
    this.onTap,
  });

  final String? text;
  final FontWeight? fontWeight;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kTextSize, vertical: 5),
        child: Text(
          text!,
          style: titleTooSmall(color: color, fontWeight: fontWeight),
          overflow: TextOverflow.fade,
          maxLines: 4,
        ),
      ),
    );
  }
}
