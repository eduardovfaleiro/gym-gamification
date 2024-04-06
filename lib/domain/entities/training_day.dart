import 'package:cloud_firestore/cloud_firestore.dart';

import 'exercise.dart';

class TrainingDay {
  final int weekday;
  final List<Exercise> exercises;

  const TrainingDay({required this.weekday, required this.exercises});

  factory TrainingDay.fromMap(Map<String, dynamic> document) {
    return TrainingDay(
      weekday: document['weekday'],
      exercises: document['exercises'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weekday': weekday,
      'exercises': exercises.map((e) => e.toMap()),
    };
  }
}
