import 'package:flutter/material.dart';

class GGField extends TextField {
  final String label;

  const GGField({
    super.key,
    required this.label,
    super.onChanged,
    super.obscureText,
    super.controller,
    super.onTap,
    super.readOnly,
  });

  @override
  InputDecoration get decoration => InputDecoration(label: Text(label));
}
