class Car {
  final String id;
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;
  final String image;
  final Location location;

  Car({
    required this.id,
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    required this.image,
    required this.location,
  });

  factory Car.fromMap(Map<String, dynamic> map, String id) {
    return Car(
      id: id,
      model: map["model"],
      distance: map["distance"].toDouble(),
      fuelCapacity: map["fuelCapacity"].toDouble(),
      pricePerHour: map["pricePerHour"].toDouble(),
      image: map["image"],
      location: Location.fromMap(map["location"]),
    );
  }
}

class Location {
  final double longitude;
  final double latitude;

  Location({required this.longitude, required this.latitude});

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(longitude: map["longitude"], latitude: map["latitude"]);
  }
}
