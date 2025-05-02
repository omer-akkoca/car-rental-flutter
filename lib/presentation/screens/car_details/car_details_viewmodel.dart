import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/data/repositories/car_repository.dart';
import 'package:flutter/material.dart';

class CarDetailsViewModel extends ChangeNotifier {
  late CarRepository carRepository;
  List<Car> _cars = [];
  bool isLoading = false;

  CarDetailsViewModel(this.carRepository);

  List<Car> get cars {
    return _cars;
  }

  Future<void> fetchCars() async {
    isLoading = true;
    _cars = await carRepository.getCars();
    isLoading = false;
    notifyListeners();
  }
}
