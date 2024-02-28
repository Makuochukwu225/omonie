import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInput extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffix;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Color? textColor;
  final Function(String value)? onChanged;
  final String? hintText;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  const AppInput(
      {Key? key,
      this.controller,
      this.keyboardType,
      this.validator,
      this.obscureText = false,
      this.suffix,
      this.hintText,
      this.onChanged,
      this.prefix,
      this.textColor,
      this.inputFormatters})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      obscuringCharacter: "*",
      // autovalidateMode: AutovalidateMode.disabled,
      style: TextStyle(
        color: textColor ?? const Color(0xFF6D7177),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        suffix: suffix,
        prefixIcon: prefix,
        hintText: hintText,
        errorMaxLines: 3,
        errorStyle: const TextStyle(
          color: Color(0xFFDA0404),
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        hintStyle: const TextStyle(
          color: Color(0xFF6D7177),
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF282D35)),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF282D35)),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF282D35)),
          borderRadius: BorderRadius.circular(5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF282D35)),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFDA0404)),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFF282D35)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
