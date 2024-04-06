// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_gamification/data/repositories/config_repository.dart';
import 'package:gym_gamification/data/repositories/user_repository.dart';

import '../../../../domain/entities/password.dart';
import '../../../../domain/entities/result.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/functions/hash_password.dart';
import '../../../messages/gg_snackbar.dart';
import '../../../router/routes.dart';

class LoginController {
  String name = '';
  String password = '';

  Future<void> handleLogin(BuildContext context) async {
    Result<User?> userLogged = await _login(context);
    GGSnackBar.show(context, userLogged.message);

    if (userLogged.result != null) {
      User user = userLogged.result!;
      String hashedPassword = hashPassword(user.password);

      await Config.I.save('user', jsonEncode({'name': user.name, 'password': hashedPassword}));

      await Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<Result<User?>> _login(BuildContext context) async {
    if (name.isEmpty || password.isEmpty) {
      return Result(null, 'Preencha todos os campos!');
    }

    User? user = await UserRepository.I.get(name);

    if (user == null) {
      return Result(null, 'Usuário "$name" não cadastrado');
    }

    if (user.password == hashPassword(password)) {
      return Result(user);
    } else {
      return Result(null, 'Senha inválida!');
    }
  }
}
