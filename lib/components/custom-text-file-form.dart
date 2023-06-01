import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final double? radius;
  final bool isPassword;
  final IconData? icon;
  final IconData? iconSuffix;
  final String? text;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Function? validator;

  const CustomTextFiled(
      {super.key,
      this.hintText,
      this.controller,
      this.radius,
      this.isPassword = false,
      this.icon,
      this.text,
      this.textInputAction,
      this.onEditingComplete,
      this.textInputType,
      this.obscureText,
      this.iconSuffix,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: text ?? '',
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: iconSuffix != null ? Icon(icon) : null,
      ),
    );
  }
}
