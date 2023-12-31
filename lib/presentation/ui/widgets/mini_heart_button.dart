import '../../../data/utils/export.dart';

class MiniHeartButton extends StatelessWidget {
  const MiniHeartButton({
    super.key,
    required this.isFavPress,
    required this.icon,
  });

  final Function()? isFavPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isFavPress,
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: AppColor.kPrimaryColor.shade200),
        child: Icon(icon, color: AppColor.kGreyColor, size: kTextSize),
      ),
    );
  }
}
