import 'package:car_rental/models/car.dart';
import 'package:car_rental/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListPage extends StatelessWidget {
  CarListPage({super.key});

  final List<Car> cars = [
    Car(model: "Fortune FR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "Fortune FR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "Fortune FR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "Fortune FR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "Fortune FR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "Fortune FR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return CarCard(car: car);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
