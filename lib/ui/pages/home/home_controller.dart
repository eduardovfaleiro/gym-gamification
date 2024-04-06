import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_gamification/data/repositories/training_day_repository.dart';
import 'package:gym_gamification/domain/entities/training_day.dart';
import 'package:gym_gamification/ui/widgets/gg_field.dart';

import '../../../core/cloud_firestore_instance.dart';
import '../../messages/gg_snackbar.dart';

class HomeController extends ChangeNotifier {
  List<TrainingDay> trainingWeek = [];

  Future<void> showAddTrainingDay(BuildContext context) {
    int weekday = 0;

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              titlePadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              title: const Text('Adicionar treino'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    runSpacing: -2,
                    spacing: 8,
                    direction: Axis.horizontal,
                    children: [
                      ChoiceChip(
                        label: const Text('Segunda-feira'),
                        selected: weekday == 1,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        onSelected: (_) {
                          weekday = weekday == 1 ? 0 : 1;
                          setState(() {});
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Terça-feira'),
                        selected: weekday == 2,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        onSelected: (_) {
                          weekday = weekday == 2 ? 0 : 2;
                          setState(() {});
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Quarta-feira'),
                        selected: weekday == 3,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        onSelected: (value) {
                          weekday = weekday == 3 ? 0 : 3;
                          setState(() {});
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Quinta-feira'),
                        selected: weekday == 4,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        onSelected: (_) {
                          weekday = weekday == 4 ? 0 : 4;
                          setState(() {});
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Sexta-feira'),
                        selected: weekday == 5,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        onSelected: (_) {
                          weekday = weekday == 5 ? 0 : 5;
                          setState(() {});
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Sábado'),
                        selected: weekday == 6,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        onSelected: (_) {
                          weekday = weekday == 6 ? 0 : 6;
                          setState(() {});
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Domingo'),
                        selected: weekday == 7,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        onSelected: (_) {
                          weekday = weekday == 7 ? 0 : 7;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> addTrainingDay(TrainingDay trainingDay) async {
    await TrainingDayRepository.I.save(trainingDay);

    trainingWeek.add(trainingDay);
    notifyListeners();
  }
}
