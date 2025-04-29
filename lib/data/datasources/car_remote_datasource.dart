import 'package:car_rental/data/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CarRemoteDataSource {
  final FirebaseFirestore firestore;

  CarRemoteDataSource(this.firestore);

  Future<List<Car>> getCars() async {
    try {
      final snapshot = await firestore.collection('cars').get();
      return snapshot.docs.map((doc) {
        return Car.fromMap(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      debugPrint("Firebase Error: ${e.toString()}");
      return [];
    }
  }
}
