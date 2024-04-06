import 'package:flutter/material.dart';

import '../gg_colors.dart';

class GGField extends TextField {
  final String label;

  const GGField({super.key, super.onChanged, required this.label, super.obscureText, super.keyboardType});

  @override
  InputDecoration get decoration => InputDecoration(border: const OutlineInputBorder(), label: Text(label));
}
