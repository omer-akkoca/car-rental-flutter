import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/widgets/custom_app_bar.dart';
import 'package:car_rental/presentation/widgets/custom_scaffold.dart';
import 'package:car_rental/presentation/widgets/safe_area_bottom_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CarMapScreen extends StatelessWidget {
  final Car car;
  const CarMapScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: CAppbar(title: car.model),
      body: Column(
        children: [
          Expanded(
            child: _buildMap(),
          ),
          _buildCarDetails(),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(car.location.longitude, car.location.latitude),
        initialZoom: 12,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 50.0,
              height: 50.0,
              point: LatLng(car.location.longitude, car.location.latitude),
              child: const Icon(Icons.location_on, color: Colors.red, size: 35),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCarDetails() {
    return Container(
      color: CColors.gunmetal,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCarTitle(),
                    const SizedBox(height: 8),
                    _buildCarInformation(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
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
                    _buildFeatureTitle(),
                    const SizedBox(height: 8),
                    _buildFeatureIcons(),
                    const SizedBox(height: 16),
                    _buildPriceAndButton(),
                    const SafeAreaBottomSpace(),
                  ],
                ),
              ),
            ],
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

  Widget _buildCarTitle() {
    return Text(
      car.model,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCarInformation() {
    return Row(
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
          car.fuelCapacity.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildFeatureTitle() {
    return const Text(
      "Features",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildFeatureIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFeatureIcon(Icons.local_gas_station, "Diesel", "Common Rail"),
        _buildFeatureIcon(Icons.speed, "Acceleration", "0 - 100km/s"),
        _buildFeatureIcon(Icons.ac_unit, "Cold", "Temp Control"),
      ],
    );
  }

  Widget _buildFeatureIcon(IconData icon, String title, String subTitle) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 4),
          Text(title),
          const SizedBox(height: 4),
          Text(
            subTitle,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          )
        ],
      ),
    );
  }

  Widget _buildPriceAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${car.pricePerHour}/day",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: CColors.gunmetal,
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
          ),
          child: const Text(
            "Book Now",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}
