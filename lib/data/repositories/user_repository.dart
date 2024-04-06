import '../../core/cloud_firestore_instance.dart';
import '../../domain/entities/user.dart';

abstract class UserRepository {
  static final I = UserRepositoryFireStore();

  Future<User?> get(String name);
  Future<void> save(User user);
  Future<User?> login(String name, String password);
}

class UserRepositoryFireStore implements UserRepository {
  static final _collection = fs.collection('users');

  @override
  Future<User?> get(String name) async {
    var userDoc = await _collection.where('name', isEqualTo: name).get();
    return User.fromDocument(userDoc);
  }

  @override
  Future<void> save(User user) async {
    await _collection.add({'name': user.name, 'password': user.password});
  }

  @override
  Future<User?> login(String name, String password) async {
    var userDoc = await _collection.where('name', isEqualTo: name).where('password', isEqualTo: password).get();
    return User.fromDocument(userDoc);
  }
}
