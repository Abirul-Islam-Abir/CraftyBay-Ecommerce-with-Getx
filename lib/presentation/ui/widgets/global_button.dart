import 'package:flutter/material.dart';

import '../../../data/theme/app_colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.onPress,
    required this.text,
    this.isLoading = false,
  });

  final Function() onPress;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.kPrimaryColor,
                ),
              )
            : ElevatedButton(
                onPressed: onPress,
                child: Text(text),
              ),
      ),
    );
  }
}
