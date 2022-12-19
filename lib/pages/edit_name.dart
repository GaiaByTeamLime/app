import 'package:flutter/material.dart';
import 'package:gaia/controller/plant.dart';
import '../dal/plant.dart';
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
          return ScrollableHeaderPage("", const []);
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
    return FutureBuilder<String?>(
      future: PlantController().getName(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var controller = TextEditingController(text: snapshot.data ?? "");

          return ScrollableHeaderPage(
            "Change Name",
            <Widget>[
              const SizedBox(height: 30),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Plant Name',
                  fillColor: Colors.white,
                ),
                controller: controller,
              ),
              const SizedBox(height: 10),
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
              Navigator.pop(context);
            },
          );
        } else if (snapshot.hasError) {
          return ScrollableHeaderPage("Oops!", [
            Text('error: ${snapshot.error}'),
          ]);
        } else {
          return ScrollableHeaderPage("", const []);
        }
      },
    );
  }
}
