import 'package:car_rental/data/datasources/car_remote_datasource.dart';
import 'package:car_rental/data/models/car.dart';

class CarRepository {
  final CarRemoteDataSource remoteDataSource;

  CarRepository(this.remoteDataSource);

  Future<List<Car>> getCars() => remoteDataSource.getCars();
}