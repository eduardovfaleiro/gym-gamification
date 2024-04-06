import 'package:flutter/material.dart';
import 'package:gym_gamification/core/utils/gg_lock.dart';

class GGButtonOutlined extends StatefulWidget {
  final void Function()? onPressed;
  final String label;

  const GGButtonOutlined({super.key, this.onPressed, required this.label});

  @override
  State<GGButtonOutlined> createState() => _GGButtonOutlinedState();
}

class _GGButtonOutlinedState extends State<GGButtonOutlined> {
  final _tapLock = GGLock(isLocked: false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
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
