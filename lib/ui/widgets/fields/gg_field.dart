import 'package:flutter/material.dart';

abstract class GGField extends TextField {
  final String label;

  const GGField({super.key, required this.label, super.onChanged, super.obscureText, super.controller});

  @override
  InputDecoration get decoration => InputDecoration(label: Text(label));
}
