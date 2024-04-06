import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym_gamification/data/repositories/training_day_repository.dart';
import 'package:gym_gamification/ui/messages/gg_snackbar.dart';
import 'package:gym_gamification/ui/widgets/buttons/gg_button_filled.dart';

import '../../../domain/entities/exercise.dart';
import '../../widgets/gg_field.dart';

class AddExercisePage extends StatelessWidget {
  final int weekday;

  AddExercisePage({super.key, required this.weekday});

  final _nome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar exercício'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            GGField(
              label: 'Nome',
              onChanged: (value) {
                _nome.text = value;
              },
            ),
            const SizedBox(height: 16),
            GGButtonFilled(
              onPressed: () async {
                await TrainingDayRepository.I.addExercise(weekday, Exercise(name: _nome.text)).then((_) {
                  GGSnackBar.show(context, 'Exercício adicionado com sucesso!');
                  Navigator.pop(context);
                });
              },
              label: 'Adicionar',
            ),
          ],
        ),
      ),
    );
  }
}
