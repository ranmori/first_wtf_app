import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.textEditingController,
  });

  final String label;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: const TextStyle(
        color: Colors.white, // typing text color
      ),
      cursorColor: Colors.white, //  cursor color
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white70, // label color
        ),
      ),
    );
  }
}
