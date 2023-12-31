import '../../../../../../data/utils/export.dart';

class SizeCircle extends StatelessWidget {
  const SizeCircle({
    Key? key,
    this.onTap,
    required this.index,
    required this.selectedIndex,
    required this.text,
  }) : super(key: key);
  final Function()? onTap;
  final int index;
  final int selectedIndex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: index == selectedIndex
                ? AppColor.kPrimaryColor
                : AppColor.kGreyColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
