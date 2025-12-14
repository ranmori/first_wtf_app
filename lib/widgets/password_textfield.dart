import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({
    super.key,
    this.textEditingController,
    this.label = "Password",
  });

  final TextEditingController? textEditingController;
  final String label;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      style: const TextStyle(
        color: Colors.white, // typing text color
      ),
      cursorColor: Colors.white, //  cursor color
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.white70,
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white, // icon color
          ),
        ),
      ),
      obscureText: !isVisible,
    );
  }
}
