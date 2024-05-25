import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:gym_gamification/core/constants.dart';
import 'package:gym_gamification/ui/extensions/date_time_extensions.dart';

import 'gg_field.dart';

// class GGFieldDate extends GGField {
//   const GGFieldDate({super.key, required super.label, required super.controller});

//   @override
//   bool get readOnly => true;

//   @override
//   GestureTapCallback? get onTap => () {
//     showDatePicker(context: context, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate)
//   };

// }

// class DateController {
//   final DateTime date;
// }

abstract class GGController {
  final textController = TextEditingController();
}

class GGControllerDate extends GGController {
  late DateTime? _date;

  set date(DateTime? date) {
    _date = date;
    textController.text = date?.toDate() ?? '';
  }

  DateTime? get date => _date;

  GGControllerDate({DateTime? dateTime}) {
    date = dateTime;
  }
}

class GGFieldDate extends StatelessWidget {
  final String label;
  final GGControllerDate controller;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  GGFieldDate({
    super.key,
    required this.label,
    required this.controller,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  })  : initialDate = initialDate ?? DateTime.now(),
        firstDate = firstDate ?? kFirstDate,
        lastDate = lastDate ?? kLastDate;

  @override
  Widget build(BuildContext context) {
    return GGField(
      label: label,
      controller: controller.textController,
      readOnly: true,
      onTap: () async {
        controller.date ??= await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
        );
      },
    );
  }
}
