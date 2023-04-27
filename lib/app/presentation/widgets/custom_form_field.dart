import 'package:flutter/material.dart';

Widget customFormField({
  required final String hintText,
  final bool obscureText = false,
  final Function(String value)? onChanged,
  final String? Function()? errorText,
  final TextInputType? keyboardType,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText!(),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
    ),
  );
}
