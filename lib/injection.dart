import 'package:car_rental/data/datasources/car_remote_datasource.dart';
import 'package:car_rental/data/repositories/car_repository.dart';
import 'package:car_rental/presentation/screens/car_details/car_details_viewmodel.dart';
import 'package:car_rental/presentation/screens/car_list/car_list_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

// for cars collection
final carDataSource = CarRemoteDataSource(firestore);
final carRepository = CarRepository(carDataSource);


final carListViewModel = CarListViewModel(carRepository);
final carDetailsViewModel = CarDetailsViewModel(carRepository);