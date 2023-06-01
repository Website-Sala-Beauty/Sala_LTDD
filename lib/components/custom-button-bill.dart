import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool? isRead;
  const CustomButton(
      {super.key, required this.onPressed, required this.text, this.isRead});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // enabal button

      onPressed: isRead ?? true ? onPressed : null,
      // ignore: sort_child_properties_last
      child: Text(text),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 244, 188, 206))),
    );
  }
}
