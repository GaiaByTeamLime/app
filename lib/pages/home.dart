import 'package:flutter/material.dart';
import 'package:gaia/controller/plant.dart';
import '../dal/plant.dart';
import '../components/bobbie_builder.dart';
import '../components/sensor_card.dart';
import '../components/page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlantDTO?>(
      future: PlantController().self,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InnerHomePage(snapshot.data!);
        } else {
          return ScrollableHeaderPage("", const []);
        }
      },
    );
  }
}

class InnerHomePage extends StatelessWidget {
  final PlantDTO plant;
  const InnerHomePage(this.plant, {super.key});

  @override
  Widget build(BuildContext context) {
    var waterLevel = ((plant.soilHumidity - plant.calibrationWet) /
        (plant.calibrationDry - plant.calibrationWet + 0.000000001) *
        100);

    var sunLevel = plant.illumination;

    return ScrollableHeaderPage(
      plant.name,
      <Widget>[
        GestureDetector(
          onLongPress: () {
            Navigator.pushNamed(context, '/edit');
          },
          child: BobbieBuilder(
            waterLevel: waterLevel.floor(),
            pot: plant.avatarPot,
            face: plant.avatarFace,
            plant: plant.avatarPlant,
            accessories1: plant.avatarAccessories1,
            accessories2: plant.avatarAccessories2,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: <Widget>[
            Expanded(
                child: SensorCard(
                    label: '${waterLevel.floor()}%',
                    enabled: !plant.isCalibrating,
                    icon: Icons.water_drop,
                    color: Colors.blue)),
            const SizedBox(width: 10),
            Expanded(
                child: SensorCard(
                    label: '${sunLevel.floor()} lx',
                    enabled: true,
                    icon: Icons.sunny,
                    color: Colors.yellow)),
          ],
        ),
      ],
      menuItems: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings, color: Color(0xFF0A5251)))
      ],
    );
  }
}
