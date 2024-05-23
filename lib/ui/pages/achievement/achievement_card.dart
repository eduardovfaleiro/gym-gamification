import 'package:flutter/material.dart';
import 'package:gym_gamification/core/configs.dart';
import 'package:gym_gamification/ui/extensions/date_time_extensions.dart';

class AchievementCard extends StatelessWidget {
  final double weight;
  final double repetitions;
  final DateTime setAt;

  const AchievementCard({super.key, required this.weight, required this.repetitions, required this.setAt});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 236, 230, 212),
                  Color.fromARGB(255, 255, 250, 236),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.3, 1],
              ),
            ),
            child: Image.asset('assets/patterns/black-lozenge.png', repeat: ImageRepeat.repeat),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12).copyWith(left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(132, 236, 230, 212),
                Color.fromARGB(132, 255, 250, 236),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [.3, 1],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.flag),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$weight ${Configs.massUnit}',
                        style: const TextStyle(fontFamily: 'Mantinia', fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'x$repetitions',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 94, 57, 52),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                setAt.toDate(),
                style: const TextStyle(
                  fontFamily: 'Mantinia',
                  color: Color.fromARGB(255, 94, 57, 52),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
