// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../data/repositories/user_repository.dart';
import '../../../../domain/entities/password.dart';
import '../../../../domain/entities/result.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/functions/hash_password.dart';
import '../../../messages/gg_snackbar.dart';
import '../../../router/routes.dart';

class RegisterController {
  String name = '';
  String password = '';

  Future<void> handleRegister(BuildContext context) async {
    Result<bool> registered = await _register();
    GGSnackBar.show(context, registered.message);

    if (registered.result) {
      await Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<Result<bool>> _register() async {
    if (name.isEmpty || password.isEmpty) {
      return Result(false, 'Preencha todos os campos!');
    }

    if (await UserRepository.I.get(name) != null) {
      return Result(false, 'Usuário "$name" já cadastrado');
    }

    if (Password(password).isValid()) {
      await UserRepository.I.save(User(name: name, password: hashPassword(password)));
      return Result(true, 'Usuário "$name" cadastrado com sucesso!');
    } else {
      return Result(false, 'Senha inválida!');
    }
  }
}
