class Car {
  final String id;
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;
  final String image;

  Car({
    required this.id,
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    required this.image,
  });

  factory Car.fromMap(Map<String, dynamic> map, String id) {
    return Car(
      id: id,
      model: map["model"],
      distance: map["distance"].toDouble(),
      fuelCapacity: map["fuelCapacity"].toDouble(),
      pricePerHour: map["pricePerHour"].toDouble(),
      image: map["image"],
    );
  }
}
