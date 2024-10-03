import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTHORIZED,
  AUTH_NOT_GRANTED,
}

class HealthProvider with ChangeNotifier {
  final Health _health = Health();
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;

  List<HealthDataPoint> get healthDataList => _healthDataList;
  AppState get state => _state;

  static final List<HealthDataType> types = [
    HealthDataType.WEIGHT,
    HealthDataType.STEPS,
    HealthDataType.HEIGHT,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.WORKOUT,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
  ];

  Future<bool> requestPermissions() async {
    bool allPermissionsGranted = true;

    for (var permission in [
      Permission.location,
      Permission.activityRecognition
    ]) {
      var status = await permission.request();
      if (status.isDenied) {
        allPermissionsGranted = false;
        log('${permission.toString()} not granted.');
        if (status.isPermanentlyDenied) {
          openAppSettings();
        }
      }
    }

    bool healthAuthorized = await _health.requestAuthorization(types);
    if (!healthAuthorized) {
      allPermissionsGranted = false;
      log('Health permissions not granted.');
    }

    return allPermissionsGranted;
  }

  Future<void> fetchData() async {
    bool permissionsGranted = await requestPermissions();
    if (!permissionsGranted) {
      _state = AppState.AUTH_NOT_GRANTED;
      notifyListeners();
      return;
    }

    _state = AppState.FETCHING_DATA;
    notifyListeners();

    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
      List<HealthDataPoint> healthData = await _health.getHealthDataFromTypes(
        types: types,
        startTime: yesterday,
        endTime: now,
      );

      _healthDataList = _health.removeDuplicates(healthData);
      _healthDataList.sort((a, b) => b.dateTo.compareTo(a.dateTo));

      if (_healthDataList.length > 100) {
        _healthDataList = _healthDataList.sublist(0, 100);
      }

      _state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
    } catch (error) {
      log("Error fetching health data: $error");
      _state = AppState.NO_DATA;
    }

    notifyListeners();
  }
}
