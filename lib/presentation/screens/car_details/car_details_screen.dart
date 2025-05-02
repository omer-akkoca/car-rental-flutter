import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/constants/images.dart';
import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/screens/car_details/car_details_viewmodel.dart';
import 'package:car_rental/presentation/screens/car_map/car_map_screen.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:car_rental/presentation/widgets/custom_app_bar.dart';
import 'package:car_rental/presentation/widgets/custom_scaffold.dart';
import 'package:car_rental/presentation/widgets/more_card.dart';
import 'package:car_rental/presentation/widgets/safe_area_bottom_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CarDetailsViewModel>(context, listen: false);
    return FutureBuilder(
      future: viewModel.fetchCars(),
      builder: (context, snapshot) {
        return CScaffold(
          appBar: const CAppbar(title: "Information"),
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CarCard(car: car, navigate: false),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildUserCard(),
                    const SizedBox(width: 16),
                    _buildMapCard(context),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildMoreCars(),
              const SafeAreaBottomSpace(bottom: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserCard() {
    return Expanded(
      child: Container(
        height: 175,
        decoration: BoxDecoration(
          color: const Color(0xfff3f3f3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(CImages.userAvatarImage),
            ),
            SizedBox(height: 10),
            Text(
              "Jane Cooper",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "\$4,253",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMapCard(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarMapScreen(car: car),
            ),
          );
        },
        child: Container(
          height: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              CImages.mapsImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoreCars() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "More Cars",
            style: TextStyle(
              color: CColors.gunmetal,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Consumer<CarDetailsViewModel>(
            builder: (context, vm, child) {
              return Column(
                children: vm.cars
                    .where((item) => item.id != car.id)
                    .map(
                      (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: MoreCard(car: item),
                  ),
                )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
