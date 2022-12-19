import 'package:flutter/material.dart';
import 'package:gaia/controller/plant.dart';
import '../dal/plant.dart';
import '../components/bobbie_builder.dart';
import '../components/sensor_card.dart';
import '../components/page.dart';

class EditNamePage extends StatelessWidget {
  const EditNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlantDTO?>(
      future: PlantController().self,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InnerEditNamePage(snapshot.data!);
        } else {
          return ScrollableHeaderPage("Edit Name", const []);
        }
      },
    );
  }
}

class InnerEditNamePage extends StatelessWidget {
  final PlantDTO plant;
  const InnerEditNamePage(this.plant, {super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();

    return ScrollableHeaderPage(
      "Bobbie",
      <Widget>[
        SizedBox(height: 30),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Plant Name',
          ),
          controller: controller,
        ),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              final plant = PlantController();
              await plant.setName(controller.text);
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Save'),
          ),
        ),
      ],
      backButton: () {
        Navigator.pushNamed(context, '/');
      },
    );
  }
}
