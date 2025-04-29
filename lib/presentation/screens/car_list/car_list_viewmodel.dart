import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/data/repositories/car_repository.dart';
import 'package:flutter/material.dart';

class CarListViewModel extends ChangeNotifier {
  final CarRepository carRepository;
  List<Car> cars = [];
  bool isLoading = false;

  CarListViewModel(this.carRepository);

  Future<void> fetchCars() async {
    isLoading = true;
    cars = await carRepository.getCars();
    isLoading = false;
    notifyListeners();
  }
}