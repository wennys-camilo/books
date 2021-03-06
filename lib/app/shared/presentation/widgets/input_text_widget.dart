import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final Color? fillColor;
  final String? labelText;
  final Widget? suffixIcon;
  final Function(String)? onChanged;

  const InputTextWidget(
      {Key? key,
      this.fillColor,
      this.labelText,
      this.suffixIcon,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        filled: true,
        fillColor: fillColor,
        border: const OutlineInputBorder(borderSide: BorderSide(width: 0.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0, color: fillColor ?? Colors.black),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      ),
      onChanged: onChanged,
    );
  }
}
