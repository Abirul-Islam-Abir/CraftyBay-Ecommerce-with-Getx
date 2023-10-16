import '../../../../../../data/utils/export.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    Key? key,
    required this.color,
    this.onTap,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  final Color color;
  final GestureCancelCallback? onTap;
  final int index;
  final int selectedIndex;

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
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: index == selectedIndex
                ? const Center(
                    child: Icon(
                    Icons.check,
                    color: AppColor.kWhiteColor,
                  ))
                : null,
          )),
    );
  }
}
