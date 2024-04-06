import 'package:flutter/material.dart';
import 'package:gym_gamification/main.dart';

abstract class GGSnackBar {
  static bool _showing = false;

  static void show(BuildContext context, String message) {
    if (_showing) return;
    _showing = true;

    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(content: Text(message)),
        )
        .closed
        .then((reason) {
      _showing = false;
    });
  }
}
