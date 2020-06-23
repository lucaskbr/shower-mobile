import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;
  final IconData icon;
  final TextInputType inputType;
  bool obscureText = false;

  TextInput({
    this.controller,
    this.label,
    this.placeholder,
    this.icon,
    this.inputType,
    this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        obscureText: this.obscureText == null ? false : true,
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: placeholder,
        ),
        keyboardType: inputType != null ? inputType : TextInputType.text,
      ),
    );
  }
}
