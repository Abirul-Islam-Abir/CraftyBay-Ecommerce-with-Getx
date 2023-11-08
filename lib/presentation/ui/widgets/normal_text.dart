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
        style:  Theme.of(context).textTheme.displayMedium!.copyWith( fontSize: kTextSize,
            fontWeight: FontWeight.bold,
            )
      ),
    );
  }
}
