import 'home_screen.dart';
import 'package:flutter/material.dart';
import '../data/models/car_model.dart';
import '../constants/asset_image_paths.dart';
import 'package:cars/widgets/car_details.dart';
import 'package:cars/data/repository/car_helper.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/car-details-screen';

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Car car = parsedData["car"];

    const SizedBox labelSpacer = SizedBox(
      height: 20,
    );
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                            title: const Text("Are you sure?"),
                            content:
                                Text("${car.brand} ${car.model} - ${car.year}"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    CarRepository().removeCar(car.id);
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text("Yes")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); /* Close Dialog */
                                  },
                                  child: const Text("No"))
                            ])).then((agreed) {
                  if (agreed) {
                    Navigator.pop(context);
                  }
                  /* Return to previous screen */
                });
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FadeInImage(
              placeholder:
                  const AssetImage(AssetImagePaths.carPlaceholderImage),
              image: NetworkImage(car.imageUrl)),
          labelSpacer,
          CarDetails(brand: car.brand, model: car.model, year: car.year),
          labelSpacer,
          Container(
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.cyan, border: Border.all(color: Colors.black)),
              child: Text(
                car.description,
                style: const TextStyle(fontSize: 20),
              ))
        ]),
      ),
    );
  }
}
