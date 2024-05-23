import 'package:flutter/material.dart';
import 'package:gym_gamification/domain/entities/training_day.dart';
import 'package:gym_gamification/ui/pages/achievement/achievement_page.dart';
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
        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/patterns/cartographer.png',
                repeat: ImageRepeat.repeat,
                color: const Color.fromARGB(255, 0, 0, 0),
                colorBlendMode: BlendMode.difference,
              ),
            ),
            Scaffold(
              backgroundColor: const Color.fromARGB(66, 0, 0, 0),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 44, 44, 31),
                          Color.fromARGB(255, 36, 36, 25),
                          Color.fromARGB(255, 36, 36, 25),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
                    ),
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12).copyWith(bottom: 16),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.flag,
                                  size: 14,
                                  color: Color.fromARGB(255, 250, 224, 146),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'Recordes',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 250, 205, 146),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Alice'),
                                  ),
                                ),
                                Icon(
                                  Icons.flag,
                                  size: 14,
                                  color: Color.fromARGB(255, 250, 224, 146),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _Card(
                                  label: 'Supino',
                                  image: SizedBox(
                                    height: 35,
                                    child: Image.asset('assets/images/bench-press.png'),
                                  ),
                                  iconData: Icons.line_weight,
                                ),
                                _Card(
                                  label: 'Agachamento',
                                  image: SizedBox(
                                    height: 50,
                                    child: Image.asset('assets/images/barbell-back-squat-by-leremy.png'),
                                  ),
                                  iconData: Icons.line_weight,
                                ),
                                _Card(
                                  label: 'Remada curvada',
                                  image: SizedBox(
                                    height: 30,
                                    child: Image.asset('assets/images/bent-over-row-by-leremy.png'),
                                  ),
                                  iconData: Icons.line_weight,
                                ),
                                _Card(
                                  label: 'Levantamento terra',
                                  image: SizedBox(
                                    height: 50,
                                    child: Image.asset('assets/images/deadlift-by-slamlabs.png'),
                                  ),
                                  iconData: Icons.line_weight,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  final String label;
  final Widget image;
  final IconData iconData;

  const _Card({required this.label, required this.image, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AchievementPage()),
          );
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 83, 83, 60),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontFamily: 'Alice'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
