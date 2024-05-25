import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_gamification/ui/pages/achievement/achievement_card.dart';
import 'package:gym_gamification/ui/widgets/buttons/gg_button_filled.dart';
import 'package:gym_gamification/ui/widgets/fields/gg_field_text.dart';

import '../../widgets/fields/gg_field_date.dart';
import '../../widgets/fields/gg_field_val.dart';
import 'achievement.dart';
import 'achievement_controller.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({super.key});

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  Future<void> _showModalBottomSheet() async {
    var weightController = TextEditingController();
    var repetitionsController = TextEditingController();
    var dateController = GGControllerDate();

    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(4))),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(132, 236, 230, 212),
                  Color.fromARGB(132, 255, 250, 236),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.3, 1],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                        tooltip: 'Fechar',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Adicionar',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.done),
                        tooltip: 'Confirmar',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 12),
                  child: Column(
                    children: [
                      GGFieldVal(label: 'Carga', controller: weightController),
                      const SizedBox(height: 8),
                      GGFieldVal(label: 'Repetições', controller: repetitionsController),
                      const SizedBox(height: 8),
                      GGFieldDate(label: 'Data', controller: dateController),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(6))),
            flexibleSpace: Container(
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
              ),
            ),
            title: Stack(
              alignment: Alignment.centerLeft,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.chevron_back,
                    color: Color.fromARGB(255, 253, 232, 205),
                  ),
                ),
                const Center(
                  child: Row(
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
                            color: Color(0xFFFACD92),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Alice',
                          ),
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
              ],
            ),
            centerTitle: true,
            leading: const SizedBox(),
            leadingWidth: 0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: BlocBuilder(
                    bloc: context.read<AchievementController>(),
                    builder: (context, achievements) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          (achievements as List<Achievement>).length,
                          (index) => AchievementCard(
                            achievement: Achievement(
                              weight: 110,
                              repetitions: 4,
                              date: DateTime.now(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              GGButtonFilled(
                label: 'Adicionar',
                prefixIcon: Icons.add,
                onTap: _showModalBottomSheet,
                margin: const EdgeInsets.all(8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
