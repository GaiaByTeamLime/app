import 'package:flutter/material.dart';

class BobbieBuilder extends StatelessWidget {
  final int waterLevel;
  final int face;
  final int pot;
  final int plant;
  final int accessories1;
  final int accessories2;
  const BobbieBuilder(
      {required this.waterLevel,
      required this.face,
      required this.pot,
      required this.plant,
      required this.accessories1,
      required this.accessories2,
      super.key});

  @override
  Widget build(BuildContext context) {
    var mood = 'happy';
    if (waterLevel < 70) mood = 'neutral';
    if (waterLevel < 30) mood = 'sad';

    var base = 'assets/images/tamagochi';

    return Center(
      child: SizedBox(
        height: 332,
        width: 332,
        child: Stack(
          children: <Widget>[
            ...(accessories2 <= 2
                ? [
                    Align(
                        child: Image.asset(
                            '$base/Accessories/2_$accessories2.png',
                            width: 312,
                            height: 312))
                  ]
                : []),
            Align(
                child: Image.asset('$base/Plants/$plant.png',
                    width: 312, height: 312)),
            Align(
                child: Image.asset('$base/Pots/$pot.png',
                    width: 312, height: 312)),
            Align(
                child: Image.asset('$base/Faces/${face}_$mood.png',
                    width: 312, height: 312)),
            Align(
                child: Image.asset('$base/Accessories/1_$accessories1.png',
                    width: 312, height: 312)),
            ...(accessories2 > 2
                ? [
                    Align(
                        child: Image.asset(
                            '$base/Accessories/2_$accessories2.png',
                            width: 312,
                            height: 312))
                  ]
                : []),
          ],
        ),
      ),
    );
  }
}
