import 'package:flutter/material.dart';
import 'package:gym_gamification/core/utils/gg_lock.dart';

class GGButtonFilled extends StatefulWidget {
  final void Function()? onTap;
  final String label;
  final Widget? prefixIconWidget;
  final IconData? prefixIcon;
  final EdgeInsets? margin;

  const GGButtonFilled(
      {super.key, this.onTap, required this.label, this.prefixIcon, this.prefixIconWidget, this.margin});

  @override
  State<GGButtonFilled> createState() => _GGButtonFilledState();
}

class _GGButtonFilledState extends State<GGButtonFilled> {
  final _tapLock = GGLock(isLocked: false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          if (_tapLock.lock()) return;
          widget.onTap?.call();
          _tapLock.unlock();
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(132, 189, 168, 132),
                Color.fromARGB(132, 189, 168, 112),
                Color.fromARGB(132, 189, 168, 92),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.prefixIconWidget ??
                  () {
                    if (widget.prefixIcon != null) {
                      return Icon(
                        widget.prefixIcon,
                        color: const Color.fromARGB(255, 255, 241, 222),
                      );
                    }
                    return const SizedBox.shrink();
                  }(),
              Text(
                widget.label,
                style: const TextStyle(color: Color.fromARGB(255, 255, 241, 222), fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
