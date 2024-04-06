import 'package:flutter/material.dart';
import 'package:gym_gamification/domain/entities/password.dart';
import 'package:gym_gamification/ui/widgets/buttons/gg_button_filled.dart';
import 'package:gym_gamification/ui/widgets/gg_field.dart';

import 'Register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gym Gamification')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Bem-vindo ao Gym Gamification!', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            GGField(
              label: 'Usuário',
              onChanged: (user) {
                registerController.name = user;
              },
            ),
            const SizedBox(height: 4),
            GGField(
              label: 'Senha',
              obscureText: true,
              onChanged: (password) {
                registerController.password = password;
              },
            ),
            const SizedBox(height: 24),
            GGButtonFilled(
              onPressed: () {
                registerController.handleRegister(context);
              },
              label: 'Cadastrar',
            ),
          ],
        ),
      ),
    );
  }
}
