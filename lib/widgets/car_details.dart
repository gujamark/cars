import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  const CarDetails(
      {Key? key, required this.brand, required this.model, required this.year})
      : super(key: key);

  final String brand;
  final String model;
  final int year;

  final TextStyle labelTextStyle =
      const TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Brand",
                style: labelTextStyle,
              ),
              Text(
                brand,
                style: labelTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Model", style: labelTextStyle),
              Text(
                model,
                style: labelTextStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Year", style: labelTextStyle),
              Text(
                year.toString(),
                style: labelTextStyle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
