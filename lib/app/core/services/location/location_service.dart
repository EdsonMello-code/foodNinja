import 'package:foodninja/app/core/services/location/latitude_longitude.dart';

abstract interface class LocationService {
  Future<LatitudeLongitude> getCurrentLatitudeAndLongitude();
}
