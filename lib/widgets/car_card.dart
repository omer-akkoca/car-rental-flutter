import 'package:car_rental/components/svg_asset.dart';
import 'package:car_rental/constants/images.dart';
import 'package:car_rental/models/car.dart';
import 'package:car_rental/pages/car_details.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsPage(car: car),
          ),
        );
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
            Image.asset(CImages.carImage, height: 120),
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
