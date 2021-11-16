import 'package:cars/data/models/car_model.dart';
import 'package:flutter/material.dart';
import '../data/repository/car_helper.dart';

class EditCarScreen extends StatefulWidget {
  const EditCarScreen({Key? key}) : super(key: key);

  static const routeName = "/edit-car-screen";

  @override
  State<EditCarScreen> createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController imageUrl = TextEditingController();
  late TextEditingController id = TextEditingController();
  late TextEditingController brand = TextEditingController();
  late TextEditingController model = TextEditingController();
  late TextEditingController year = TextEditingController();
  late TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Car car = parsedData["car"];
    final int index = parsedData["index"];

    imageUrl = TextEditingController(text: car.imageUrl);
    id = TextEditingController(text: car.id.toString());
    brand = TextEditingController(text: car.brand);
    model = TextEditingController(text: car.model);
    year = TextEditingController(text: car.year.toString());
    description = TextEditingController(text: car.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Car",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  child: TextFormField(
                    controller: imageUrl,
                    decoration: const InputDecoration(
                        hintText: "Please enter Image url"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid url";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  child: TextFormField(
                    controller: id,
                    decoration:
                        const InputDecoration(hintText: "Please enter ID"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid id";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  child: TextFormField(
                    controller: brand,
                    decoration:
                        const InputDecoration(hintText: "Please enter Brand"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid Brand";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  child: TextFormField(
                    controller: model,
                    decoration:
                        const InputDecoration(hintText: "Please enter Model"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid Model";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  child: TextFormField(
                    controller: year,
                    decoration:
                        const InputDecoration(hintText: "Please enter Year"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid Year";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  child: TextFormField(
                    controller: description,
                    decoration: const InputDecoration(
                        hintText: "Please enter description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid description";
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Back"),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Car car = Car(
                              imageUrl: imageUrl.text,
                              id: int.parse(id.text),
                              brand: brand.text,
                              model: model.text,
                              year: int.parse(year.text),
                              description: description.text);
                          CarRepository().editCar(car, index);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Edit"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
