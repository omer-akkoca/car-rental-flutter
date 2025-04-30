import 'package:car_rental/constants/images.dart';
import 'package:car_rental/data/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CarMapScreen extends StatelessWidget {
  final Car car;
  const CarMapScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2c2b34),
        title: Text(
          car.model,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(41.00244, 29.23187),
              initialZoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ["a", "b", "c"],
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailsCard(car),
          ),
        ],
      ),
    );
  }
}

Widget carDetailsCard(Car car) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
            //color: Colors.black54,
            color: Color(0xff2c2b34),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                car.model,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${car.distance} km",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.battery_full, color: Colors.white, size: 16),
                  const SizedBox(width: 5),
                  Text(
                    "${car.fuelCapacity}",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Features",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                featureIcons(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${car.pricePerHour}/day",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 5,
          child: Image.network(
            car.image,
            width: 200,
            height: 125,
            fit: BoxFit.contain,
          ),
        )
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, "Diesel", "Common Rail"),
      featureIcon(Icons.speed, "Acceleration", "0 - 100km/s"),
      featureIcon(Icons.ac_unit, "Cold", "Temp Control"),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subTitle) {
  return Container(
    width: 100,
    height: 100,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 28),
        Text(title),
        Text(
          subTitle,
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    ),
  );
}
