import 'package:flutter/material.dart';

import 'gg_field.dart';

class GGFieldInt extends GGField {
  const GGFieldInt({super.key, required super.label, super.onChanged});

  @override
  TextInputType get keyboardType => const TextInputType.numberWithOptions(decimal: false, signed: false);
}
