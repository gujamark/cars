import 'package:flutter/material.dart';
import '../constants/asset_image_paths.dart';

class CarCard extends StatelessWidget {
  const CarCard(
      {Key? key,
      required this.name,
      required this.year,
      required this.imageUrl})
      : super(key: key);

  final String name;
  final int year;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            FadeInImage(
                placeholder:
                    const AssetImage(AssetImagePaths.carPlaceholderImage),
                image: NetworkImage(imageUrl)),
            Text(name),
            Text("$year")
          ],
        ),
      ),
    );
  }
}
