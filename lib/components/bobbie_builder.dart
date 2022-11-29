import 'package:flutter/material.dart';

class BobbieBuilder extends StatelessWidget {
  final int waterLevel;
  final int face;
  final int pot;
  final int plant;
  final int color;
  const BobbieBuilder(
      {required this.waterLevel,
      required this.face,
      required this.pot,
      required this.plant,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    var mood = 'happy';

    var base = 'assets/images/tamagochi';

    return Center(
      child: SizedBox(
        height: 332,
        width: 332,
        child: Stack(
          children: <Widget>[
            Align(child: Image.asset('$base/Plants/$plant.png')),
            Align(child: Image.asset('$base/Pots/$pot.png')),
            Align(child: Image.asset('$base/Faces/${face}_$mood.png')),
          ],
        ),
      ),
    );
  }
}
