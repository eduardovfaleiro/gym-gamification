import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

import 'gg_field.dart';

class GGFieldVal extends GGField {
  const GGFieldVal({super.key, required super.label, super.onChanged, super.obscureText, required super.controller});

  TextEditingController get _controller => super.controller!;

  @override
  TextInputType get keyboardType => TextInputType.number;

  @override
  List<TextInputFormatter>? get inputFormatters => [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.?\d*)')),
      ];

  @override
  ValueChanged<String>? get onSubmitted => (value) {
        _controller.text = double.tryParse(value)?.toString() ?? '';
      };
}
