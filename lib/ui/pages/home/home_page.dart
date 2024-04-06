import 'package:flutter/material.dart';
import 'package:gym_gamification/domain/entities/training_day.dart';
import 'package:gym_gamification/ui/pages/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../add_exercise/add_exercise_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Semana de treino')),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.showAddTrainingDay(context);
            },
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return _TrainingDayCard(index + 1);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TrainingDayCard extends StatelessWidget {
  final int weekday;

  const _TrainingDayCard(this.weekday);

  String get _weekdayName {
    switch (weekday) {
      case 1:
        return 'Segunda-feira';
      case 2:
        return 'Terça-feira';
      case 3:
        return 'Quarta-feira';
      case 4:
        return 'Quinta-feira';
      case 5:
        return 'Sexta-feira';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        throw Exception('Dia da semana inválido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddExercisePage(weekday: weekday)));
      },
      child: Column(
        children: [
          Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_weekdayName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Aperte para adicionar exercicios'),
                  ],
                ),
                const Icon(Icons.add),
              ],
            ),
          ),
          const Divider(height: 0, thickness: 1),
        ],
      ),
    );
  }
}
