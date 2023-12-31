import '../../../data/utils/export.dart';
import 'mini_heart_button.dart';
import 'normal_text.dart';

class CountCard extends StatelessWidget {
  const CountCard({
    super.key,
    required this.addBtn,
    required this.removeBtn,
    required this.count,
  });

  final Function() addBtn, removeBtn;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MiniHeartButton(isFavPress: removeBtn, icon: Icons.remove),
        NormalText(count),
        MiniHeartButton(isFavPress: addBtn, icon: Icons.add),
      ],
    );
  }
}
