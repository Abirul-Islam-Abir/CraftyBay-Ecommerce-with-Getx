import 'package:empty_widget/empty_widget.dart';

import '../../../data/utils/export.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyWidget(
      packageImage: PackageImage.Image_1,
      title: 'Empty Screen',
      subTitle: 'There is no Items',
      titleTextStyle: const TextStyle(
        fontSize: 22,
        color: Color(0xff9da9c7),
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xffabb8d6),
      ),
    );
  }
}
