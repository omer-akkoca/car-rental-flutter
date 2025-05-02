import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/screens/car_details/car_details_screen.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final Car car;

  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CarDetailsScreen(car: car)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: CColors.moreCardBg,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 8),
                  _buildCarDetails(),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      car.model,
      style: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCarDetails() {
    return Row(
      children: [
        const Icon(Icons.directions_car, color: Colors.white, size: 16),
        const SizedBox(width: 5),
        Text(
          "${car.distance} km",
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.battery_full, color: Colors.white, size: 16),
        const SizedBox(width: 5),
        Text(
          car.fuelCapacity.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
