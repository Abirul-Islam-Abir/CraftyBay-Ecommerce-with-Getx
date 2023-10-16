import '../../../../utils/export.dart';
import '../../../widgets/normal_text.dart';

AppBar buildAppBarList(text) => AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(text),
        ],
      ),
    );
