class LatitudeLongitude {
  final double latitude;
  final double longitude;

  const LatitudeLongitude({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
