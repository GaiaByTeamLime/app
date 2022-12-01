import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gaia/components/bobbie_builder.dart';
import 'package:gaia/components/widget_size.dart';

import '../components/page.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

enum EditPageTab {
  plant,
  pot,
  face,
}

final editPageTabSize = {
  EditPageTab.plant: 6,
  EditPageTab.pot: 18,
  EditPageTab.face: 3,
};

final editPageTabIcon = {
  EditPageTab.plant: Icons.eco,
  EditPageTab.pot: Icons.inventory_2,
  EditPageTab.face: Icons.mood,
};

extension EditPageTabExtention on EditPageTab {
  String get label => toString().split('.').last;
  String get name => label.capitalize();
  IconData get icon => editPageTabIcon[this]!;

  String formatPath(i) {
    switch (this) {
      case EditPageTab.plant:
      case EditPageTab.pot:
        return 'assets/images/tamagochi/${name}s/$i.png';
      case EditPageTab.face:
        return 'assets/images/tamagochi/${name}s/${i}_happy.png';
    }
  }

  Widget tab(void Function(int index) onPressed) => Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 8,
        children: List.generate(
          editPageTabSize[this]!,
          (i) => TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFD9ECE1),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () => onPressed(i),
            child: Image.asset(formatPath(i), width: 100, height: 100),
          ),
        ),
      );
}

class _EditPageState extends State<EditPage> {
  var face = 0;
  var plant = 0;
  var pot = 0;
  var active = EditPageTab.plant;
  var currentTabHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    var percOfScreen = (currentTabHeight + 180) / height;
    var bobbySize = (height - 450) / height;
    var maxScreenHeight = (height - 110) / height;

    double minChildSize = min(percOfScreen, bobbySize);
    double maxChildSize = min(maxScreenHeight, percOfScreen);
    double initialChildSize = minChildSize;

    return HeaderPage(
      "Bobbie",
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          children: [
            BobbieBuilder(waterLevel: 100, pot: pot, face: face, plant: plant),
          ],
        ),
      ),
      extraLayers: [
        DraggableScrollableSheet(
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          initialChildSize: initialChildSize,
          builder: (context, scrollController) => Container(
            decoration: const BoxDecoration(
              color: Color(0xFF9ED0B3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: SafeArea(
                    top: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 110),
                        WidgetSize(
                          onChange: (Size size) {
                            setState(() {
                              currentTabHeight = size.height;
                            });
                          },
                          child: active.tab((i) {
                            setState(() {
                              switch (active) {
                                case EditPageTab.plant:
                                  plant = i;
                                  break;
                                case EditPageTab.pot:
                                  pot = i;
                                  break;
                                case EditPageTab.face:
                                  face = i;
                                  break;
                              }
                            });
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFF9ED0B3),
                  height: 95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          active.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF0A5251),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: EditPageTab.values
                            .map<Widget>(
                              (i) => Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        active = i;
                                      });
                                    },
                                    style: active == i
                                        ? TextButton.styleFrom(
                                            primary: const Color(0xFFD9ECE1),
                                            backgroundColor:
                                                const Color(0xFF588585),
                                            padding: const EdgeInsets.all(0),
                                          )
                                        : TextButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFD9ECE1),
                                            primary: const Color(0xFF588585),
                                            padding: const EdgeInsets.all(0),
                                          ),
                                    child: Icon(i.icon),
                                  )),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 15),
                      Container(height: 1, color: const Color(0xFF6A9697)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Color(0xFF588585)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
