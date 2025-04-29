import 'package:car_rental/presentation/widgets/svg_asset.dart';
import 'package:car_rental/constants/images.dart';
import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/screens/car_details/car_details_screen.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final bool navigate;
  const CarCard({
    super.key,
    required this.car,
    this.navigate = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigate) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarDetailsScreen(car: car),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xfff3f3f3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            Image.network(car.image, height: 120),
            Text(
              car.model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        const SvgAsset(path: CImages.gpsIcon, width: 16, height: 16),
                        Text(" ${car.distance.toStringAsFixed(0)}km")
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const SvgAsset(path: CImages.pumpIcon, width: 16, height: 16),
                        Text(" ${car.fuelCapacity.toStringAsFixed(0)}km")
                      ],
                    ),
                  ],
                ),
                Text(
                  "\$${car.pricePerHour.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
