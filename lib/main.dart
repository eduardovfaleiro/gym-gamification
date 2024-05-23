import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_gamification/data/repositories/config_repository.dart';
import 'package:gym_gamification/data/repositories/training_day_repository.dart';
import 'package:gym_gamification/data/repositories/user_repository.dart';
import 'package:gym_gamification/domain/entities/training_day.dart';
import 'package:gym_gamification/ui/pages/logon/register/register_page.dart';
import 'package:gym_gamification/ui/router/gg_router.dart';
import 'package:gym_gamification/ui/pages/home/home_controller.dart';
import 'package:gym_gamification/ui/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain/entities/user.dart';
import 'firebase_options.dart';
import 'ui/pages/logon/login/login_page.dart';
import 'ui/router/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await ConfigRepositorySharedPreferences.initializeSharedPreferences();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      child: GymGamification(initialRoute: await _getInitialRoute()),
    ),
  );
}

Future<String> _getInitialRoute() async {
  String? userJson = Config.I.get('user');
  if (userJson == null) return '/login';

  var user = User.fromJson(userJson);
  User? userLogged = await UserRepository.I.login(user.name, user.password);

  if (userLogged == null) {
    return '/login';
  } else {
    return '/home';
  }
}

class GymGamification extends StatelessWidget {
  final String initialRoute;

  const GymGamification({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Alice',
        colorSchemeSeed: const Color.fromARGB(255, 89, 91, 212),
        appBarTheme: const AppBarTheme(centerTitle: true),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
