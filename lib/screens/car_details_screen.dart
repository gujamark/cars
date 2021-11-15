import 'package:flutter/material.dart';
import '../data/models/car_model.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/car-details-screen';

//   @override
//   _CarDetailsScreenState createState() => _CarDetailsScreenState();
// }

// class _CarDetailsScreenState extends State<CarDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Car car = parsedData["car"];
    final int index = parsedData["index"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // TODO
              })
        ],
      ),
      body: Column(
        children: [
          FadeInImage(
              placeholder:
                  const AssetImage('assets/images/car_placeholder.png'),
              image: NetworkImage(car.imageUrl)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Brand"), Text(car.brand)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Model"), Text(car.model)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Year"), Text(car.year.toString())],
          ),
          Container(
              alignment: Alignment.center,
              width: 400,
              height: 100,
              decoration: BoxDecoration(color: Colors.red),
              child: Text(car.description))
        ],
      ),
    );
  }
}
