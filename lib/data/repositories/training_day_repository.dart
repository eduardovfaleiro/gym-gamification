import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/cloud_firestore_instance.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/training_day.dart';
import '../../domain/entities/user.dart';
import 'config_repository.dart';
import 'user_repository.dart';

abstract class TrainingDayRepository {
  static final I = TrainingDayRepositoryFireStore();

  Future<List<TrainingDay>> getAll();
  Future<void> save(TrainingDay trainingDay);
  Future<bool> addExercise(int weekday, Exercise exercise);
}

class TrainingDayRepositoryFireStore implements TrainingDayRepository {
  @override
  Future<List<TrainingDay>> getAll() async {
    var trainingDocumentsDocuments = await _trainingWeekCollectionRef().then((ref) => ref.get());
    List<TrainingDay> trainingWeek = trainingDocumentsDocuments.docs.map((e) => e.data()).toList();

    return trainingWeek;
  }

  @override
  Future<void> save(TrainingDay trainingDay) async {
    var trainingCollectionRef = await _trainingWeekCollectionRef();
    await trainingCollectionRef.add(trainingDay);
  }

  @override
  Future<bool> addExercise(int weekday, Exercise exercise) async {
    var trainingCollectionRef = await _trainingWeekCollectionRef();
    var trainingCollection = await trainingCollectionRef.where('weekday', isEqualTo: weekday).get();
    var exercisesCollection = trainingCollection.docs.single.reference
        .withConverter<TrainingDay>(
          fromFirestore: (snapshot, _) => TrainingDay.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap(),
        )
        .collection('exercises');

    exercisesCollection.add(exercise.toMap());

    return true;
  }

  Future<CollectionReference<TrainingDay>> _trainingWeekCollectionRef() async {
    var user = Config.I.getCurrentUser() as User;
    var userFireStore = await fs.collection('users').where('name', isEqualTo: user.name).get();

    var userCollectionRef = userFireStore.docs.single.reference.collection('trainingWeek').withConverter<TrainingDay>(
          fromFirestore: (snapshot, _) => TrainingDay.fromMap(snapshot.data()!),
          toFirestore: (model, _) => model.toMap(),
        );

    return userCollectionRef;
  }
}
