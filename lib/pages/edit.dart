import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gaia/components/bobbie_builder.dart';
import 'package:gaia/components/widget_size.dart';
import 'package:gaia/controller/plant.dart';

import '../components/page.dart';
import '../dal/plant.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlantDTO?>(
      future: PlantController().self,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InnerEditPage(snapshot.data!);
        } else {
          return ScrollableHeaderPage("", const []);
        }
      },
    );
  }
}

class InnerEditPage extends StatefulWidget {
  final PlantDTO plant;
  const InnerEditPage(this.plant, {super.key});

  @override
  State<InnerEditPage> createState() => _InnerEditPageState();
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
  accessories1,
  accessories2,
}

final editPageTabSize = {
  EditPageTab.plant: 6,
  EditPageTab.pot: 18,
  EditPageTab.face: 3,
  EditPageTab.accessories1: 13,
  EditPageTab.accessories2: 7,
};

final editPageTabIcon = {
  EditPageTab.plant: Icons.eco,
  EditPageTab.pot: Icons.inventory_2,
  EditPageTab.face: Icons.mood,
  EditPageTab.accessories1: Icons.home,
  EditPageTab.accessories2: Icons.home,
};

extension EditPageTabExtention on EditPageTab {
  String get label => toString().split('.').last;
  String get name => label.capitalize();
  String icon(bool active) =>
      'assets/images/tamagochi/Icons/$label${active ? '_active' : ''}_test.png';

  String formatPath(i) {
    switch (this) {
      case EditPageTab.plant:
      case EditPageTab.pot:
        return 'assets/images/tamagochi/${name}s/${i}_thumb.png';
      case EditPageTab.accessories1:
        return 'assets/images/tamagochi/Accessories/1_${i}_thumb.png';
      case EditPageTab.accessories2:
        return 'assets/images/tamagochi/Accessories/2_${i}_thumb.png';
      case EditPageTab.face:
        return 'assets/images/tamagochi/${name}s/${i}_happy_thumb.png';
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

class _InnerEditPageState extends State<InnerEditPage> {
  int pot = 0, plant = 0, face = 0, assessories1 = 0, assessories2 = 0;
  var active = EditPageTab.plant;
  var currentTabHeight = 0.0;
  bool hasSet = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var image in EditPageTab.values) {
      precacheImage(AssetImage(image.icon(true)), context);
      precacheImage(AssetImage(image.icon(false)), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!hasSet) {
      pot = widget.plant.avatarPot;
      face = widget.plant.avatarFace;
      plant = widget.plant.avatarPlant;
      assessories1 = widget.plant.avatarAccessories1;
      assessories2 = widget.plant.avatarAccessories2;
      hasSet = true;
    }

    double height = MediaQuery.of(context).size.height;

    var percOfScreen = (currentTabHeight + 180) / height;
    var bobbySize = (height - 450) / height;
    var maxScreenHeight = (height - 110) / height;

    double minChildSize = min(percOfScreen, bobbySize);
    double maxChildSize = min(maxScreenHeight, percOfScreen);
    double initialChildSize = minChildSize;

    for (var image in EditPageTab.values) {
      precacheImage(AssetImage(image.icon(true)), context);
      precacheImage(AssetImage(image.icon(false)), context);
    }

    return HeaderPage(
      "Edit",
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          children: [
            BobbieBuilder(
              waterLevel: 100,
              pot: pot,
              face: face,
              plant: plant,
              accessories1: assessories1,
              accessories2: assessories2,
            ),
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                              switch (active) {
                                case EditPageTab.plant:
                                  PlantController().setAvatarPlant(i);
                                  setState(() => plant = i);
                                  break;
                                case EditPageTab.pot:
                                  PlantController().setAvatarPot(i);
                                  setState(() => pot = i);
                                  break;
                                case EditPageTab.face:
                                  PlantController().setAvatarFace(i);
                                  setState(() => face = i);
                                  break;
                                case EditPageTab.accessories1:
                                  PlantController().setAvatarAccessories1(i);
                                  setState(() => assessories1 = i);
                                  break;
                                case EditPageTab.accessories2:
                                  PlantController().setAvatarAccessories2(i);
                                  setState(() => assessories2 = i);
                                  break;
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF9ED0B3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 99,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                  margin: const EdgeInsets.only(right: 15),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        active = i;
                                      });
                                    },
                                    child: Image.asset(
                                      i.icon(active == i),
                                      width: 42,
                                      height: 42,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 15),
                        Container(height: 1, color: const Color(0xFF6A9697)),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
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
      backButton: () {
        Navigator.pushNamed(context, '/');
      },
    );
  }
}
