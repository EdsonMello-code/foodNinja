import 'package:flutter/material.dart';
import 'package:foodninja/app/core/errors/app_exception.dart';
import 'package:foodninja/app/core/services/local_storage/local_storage.dart';
import 'package:foodninja/app/core/services/location/latitude_longitude.dart';
import 'package:foodninja/app/core/services/location/location_service.dart';
import 'package:foodninja/app/core/utils/unit.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/set_location_state.dart';

const currenLocationKey = 'location';

class SetLocationController extends ValueNotifier<SetLocationState> {
  late final LocalStorage _localStorage;
  late final LocationService _locationService;

  SetLocationController({
    required LocalStorage localStorage,
    required LocationService locationService,
  }) : super(SetLocationStateIdle()) {
    _localStorage = localStorage;
    _locationService = locationService;
  }

  Future<Unit> _saveCurrentPosition(LatitudeLongitude position) async {
    await _localStorage.set(
      currenLocationKey,
      data: position.toMap(),
    );

    return unit;
  }

  Future<Unit> saveCurrentLocation() async {
    try {
      value = SetLocationStateLoading();
      final currentLocation =
          await _locationService.getCurrentLatitudeAndLongitude();
      await _saveCurrentPosition(
        currentLocation,
      );
      value = SetLocationStateAdded();

      return unit;
    } on AppException {
      value = SetLocationStateFailure();
      return unit;
    }
  }
}
