import 'package:flutter/material.dart';
import 'package:gym_gamification/core/utils/gg_lock.dart';

class GGButtonFilled extends StatefulWidget {
  final void Function()? onPressed;
  final String label;

  const GGButtonFilled({super.key, this.onPressed, required this.label});

  @override
  State<GGButtonFilled> createState() => _GGButtonFilledState();
}

class _GGButtonFilledState extends State<GGButtonFilled> {
  final _tapLock = GGLock(isLocked: false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          if (_tapLock.lock()) return;

          widget.onPressed?.call();

          _tapLock.release();
        },
        child: Text(widget.label),
      ),
    );
  }
}
