import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/presentation/screens/car_list/car_list_viewmodel.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:car_rental/presentation/widgets/custom_app_bar.dart';
import 'package:car_rental/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CarListViewModel>(context, listen: false);

    return FutureBuilder(
      future: viewModel.fetchCars(),
      builder: (context, snapshot) {
        return CScaffold(
          appBar: const CAppbar(
            title: "Choose Your Car",
            showBackIcon: false,
          ),
          body: _buildBody(snapshot.connectionState),
        );
      },
    );
  }

  Widget _buildBody(ConnectionState state) {
    if (state == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(color: CColors.gunmetal),
      );
    }
    return Consumer<CarListViewModel>(
      builder: (context, vm, _) {
        return ListView.separated(
          itemCount: vm.cars.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          padding: EdgeInsets.only(
            right: 16,
            left: 16,
            top: 16,
            bottom: MediaQuery.paddingOf(context).bottom + 16,
          ),
          itemBuilder: (context, index) {
            final car = vm.cars[index];
            return CarCard(car: car);
          },
        );
      },
    );
  }
}
