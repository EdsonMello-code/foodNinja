import 'package:foodninja/app/core/services/location/latitude_longitude.dart';
import 'package:foodninja/app/core/services/location/location_service.dart';
import 'package:geolocator/geolocator.dart';

class LocationServiceImpl implements LocationService {
  @override
  Future<LatitudeLongitude> getCurrentLatitudeAndLongitude() async {
    late final bool serviceEnabled;
    late LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final location = await Geolocator.getCurrentPosition();

    return LatitudeLongitude(
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }
}
