import 'package:flutter/material.dart';
import 'package:gym_gamification/domain/entities/password.dart';
import 'package:gym_gamification/ui/widgets/buttons/gg_button_outlined.dart';

import '../../../widgets/buttons/gg_button_filled.dart';
import '../../../widgets/fields/gg_field_text.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gym Gamification')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Image.asset(name)
            const SizedBox(height: 54),
            GGFieldText(
              label: 'Usuário',
              onChanged: (user) => loginController.name = user,
            ),
            const SizedBox(height: 4),
            GGFieldText(
              label: 'Senha',
              obscureText: true,
              onChanged: (password) => loginController.password = password,
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                GGButtonFilled(
                  onTap: () {
                    loginController.handleLogin(context);
                  },
                  label: 'Login',
                ),
                const SizedBox(height: 8),
                GGButtonOutlined(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  label: 'Registrar',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
