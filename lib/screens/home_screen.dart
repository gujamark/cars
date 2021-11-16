import 'edit_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/car_card.dart';
import '../data/repository/car_helper.dart';
import 'add_screen.dart';
import 'car_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home-screen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cars = CarRepository().getCars();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddCarScreen.routeName)
                    .then((value) => setState(() {}));
              })
        ],
        centerTitle: true,
        title: const Text(
          "Cars",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height - 80,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onLongPress: () => Navigator.pushNamed(
                          context, EditCarScreen.routeName,
                          arguments: {"car": cars[index], "index": index})
                      .then((value) => setState(() {})),
                  onTap: () => Navigator.pushNamed(
                      context, CarDetailsScreen.routeName,
                      arguments: {
                        "car": cars[index],
                      }).then((value) => setState(() {})),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: CarCard(
                        name: cars[index].brand,
                        year: cars[index].year,
                        imageUrl: cars[index].imageUrl),
                  ),
                );
              },
              itemCount: cars.length,
            ),
          )
        ],
      ),
    );
  }
}
