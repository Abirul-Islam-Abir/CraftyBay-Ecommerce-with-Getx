import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.label,
      this.padding = 18,
      this.maxLines = 1,
      this.controller,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.keyboardType,
      this.textInputAction,
      this.obscureText = false,
      this.autofocus = false,
      this.readOnly = false,
      this.prefixIcon,
      this.onChanged, this.onTap});
  final String hintText;
  final String label;
  final double padding;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        onTap: onTap,
        obscuringCharacter: '*',
        readOnly: readOnly,
        autofocus: autofocus,
        obscureText: obscureText,
        onChanged: onChanged,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.all(padding),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 15),
          label: Text(label),
        ),
      ),
    );
  }
}
